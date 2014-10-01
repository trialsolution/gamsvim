" ABOUT
" -----
"
" vim script to process GAMS listing files
" the main objective is to help reviewing solver output of large models
" by hiding (folding) large parts of the listing file
" 
" (the script builds on Antonio Colombo's f.vim script)
"
" :call MODLIST()
" Everything is folded except variables, equation and parameters
" => you get a quick overview of the model structure and are able
" to jump to the relevant positions. Then simply unfold the relevant
" parts.
"
" :cal MOREX()
" You can add additional search term that will not be folded.
" Example: search for a country name then single equations and variables
" defined for that country remain visible
"
" INSTALLATION
" ------------
"
" :so gamslist.vim 
"
" You can map the functions to a function key in your vimrc file:
" map <F6> :call MOREX() <CR>
"
" [you can find me on github: trialsolution]


" :call F()
" This function lets you see all the lines in a file
" that contain a given regular-expression.
"
" The remaining lines are folded with the manual method,
" and can be opened to see some 'nearby' line.
" 
" If no regular expression is specified, the last regular expression
" speicified for search is utilized.
"
" The idea comes from the mainframe ISPF editor.
"
" zo   to open a fold a bit
" zozj to open a fold a bit and leave the cursor on the fold line
" zO   to open a fold completely 
" zE   to open all folds
"
" zf{motion} to close folders 'a bit more' (or to create folders)
" If you have 2 adjacent folders, zf<ENTER> will 'merge' them.
" In the same way a visible line can be 'added' to a nearby folder.
"
" :call FA()
" This function is similar to F() above, except instead of typing in
" a regular expression, the current word the cursor is over is used as
" the regular expression.
"
" The function FA() has been prepared and added by:
" Ken Huisman - ken.huisman@gmail.com
"
" Suggested mappings:
" :map <F5> :call F()<CR>
" :map <F6> :normal zozj<CR>
" :set backspace=indent,eol,start
" the above setting allows you to go back/forward with "w","b" etc.
" thus opening "a bit" a nearby folder
"
" :map <F1> :call FA()<CR>
" :map <F2> zR
" useful for finding all instances of the current word quickly and then
" opening all the folds when you are done.
" 
" :<Up> to recall the macro after having executed it once
" giving <Up> as an argument, last searches can be repeated/modified
"
" try giving as an expression  nfold
" try giving as an expression  as
" try giving as an expression   as     [that is: ' as' ]
" try giving as an expression  let
" try giving as an expression  ^":
" try giving as an expression  :fun\|:endf
" try giving as an expression  :endf
" try giving as an expression  ^:endf
"
" for remarks, complaints, etc. write to: azc100@gmail.com
" Thanks to Michael Fitz (Wien -AT), Jean-Marc Frigerio
" Alexander Langer, and Paul Wei
" for corrections, suggestions and enhancements.
" version 05051001

:fun! s:Foldft(from,to) range
"makes folds from "a:from" to "a:to"
":echo a:from a:to "fold"
:let range=a:to-a:from
:if ( range<0 )
:retu
:en
:if ( range<3 )
:exe a:from ","  a:to "fold"
:retu
:en
:let center=range/2
:wh ( center>=0 )
:let f=a:from+center
:let t=a:to-center
":echo range center f t
:exe f "," t "fold"
:if ( center>999 )
: let center=center-500
:else
: if ( center>=99 )
:  let center=center-50
: else
:  if ( center>=9 )
:   let center=center-5
:  else
:   let center=center-1
:  en
: en
:en
:endw
:endf

:fun! F2(larg) range
:let arg=a:larg
exec "normal /" . arg . "/"
":nohl
" for use inside :help
set foldenable
set foldmethod=manual
set foldminlines=0
set foldtext=
let idx=0
let lastline= line("$")
let nfold=0
let nFound=0
let nLines=0
norm G$
norm zE
let fromline=1
while idx<lastline
  if ( idx==0 ) 
    let num=search(arg)
  else
    let num=search(arg,"W")
  endif
  " search gives back the column number...
  if ( num==0 )
    break
  endif
  if ( num!=0 ) 
    let nFound=1
    let toline=num-1
    if toline>=fromline
      call s:Foldft(fromline,toline)
      let nfold=nfold+1
    en
    let fromline=num+1
    ":echo "line" num "found" arg "at col" col(".")
    ":echo "----+----1----+----2----+----3----+----4----+----5----+----6----+-----7"
    ":p
    let nLines=nLines+1
    norm $
    let idx=line(".")
  endif
endwhile
if fromline<=lastline && fromline!=1
  let toline=lastline
  call s:Foldft(fromline,toline)
  let nfold=nfold+1
en
norm 1G
if (nFound)
  call histadd("/",arg)
  exec "normal" "/" . arg . "/"
  exec "match Search /\\c" . arg . "/"
  if (!nfold)
    echo "Expression on each line:" arg
  endif
  if ( nLines>1 )
    echo nLines "lines found"
  else
    echo nLines "line found"
  endif
  return ("/" . arg . "/")
else
  echo "Expression not found:" arg
  return ("")
endif
:endf

:fun! FA() range
:let arg=expand("<cword>")
:let linenum=line(".")
:let colnum=col(".")
call F2(arg)
call cursor(linenum,colnum)
:endf


:fun! MODLIST() range
:let arg="^---- VAR\\|^---- EQU\\|PARAMETER\\|SOLVE"
if strlen(arg)<1
:let arg=@/
endif
call F2(arg)
:endf

:fun! F() range
:let arg=input("Which expression? ")
if strlen(arg)<1
:let arg=@/
endif
call F2(arg)
:endf

:fun! MOREX() range
:let arg=input("Which expression? ")
if strlen(arg)<1
:let arg=@/
endif
:let arg="^---- VAR\\|^---- EQU\\|PARAMETER\\|SOLVE\\|" . arg
call F2(arg)
:endf


