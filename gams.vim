" Vim syntax file
" Language:        gams
" Filenames:       *.gms
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" gams is not case sensitive
syn case ignore

" for model definition and solve 
syn keyword gamsStatement       Sets Set 
syn keyword gamsStatement       Table 
syn keyword gamsStatement       Parameter parameters
syn keyword gamsStatement       Model 
syn keyword gamsStatement       Solve 
syn keyword gamsStatement       Equations Equation 
syn keyword gamsStatement       Variable Variables 
syn keyword gamsStatement       display 
syn keyword gamsStatement       option 
syn keyword gamsStatement       Alias 
syn keyword gamsStatement       Scalar 
syn keyword gamsStatement       sameas
syn keyword gamsStatement       xxpto
" equation definitions ending with two dots?

" additional stuff  
syn keyword gamsStatement	free 
syn keyword gamsStatement	positive 
syn keyword gamsStatement       put file putclose abort
syn keyword gamsRepeat          loop while repeat until
syn keyword gamsConditional     if else Elseif ifi exist
syn keyword gamsConditional     ne ge le eq gt lt
syn keyword gamsRepeat          for to Downto By 

syn match gamsSpecial "\$option" 
syn match gamsSpecial "\$call"
syn match gamsSpecial "\$eval"

syn match gamsSpecial "\$if"
syn match gamsSpecial "\$ifi"
syn match gamsSpecial "\$endif"
syn match gamsSpecial "\$endifi"
syn match gamsSpecial "\$iftheni"
syn match gamsSpecial "\$iftheni"

syn match gamsSpecial "\$gdxin"
syn match gamsSpecial "\$gdxout"
syn match gamsSpecial "\$load"
syn match gamsSpecial "\$unload"
syn match gamsSpecial "\$include"
syn match gamsSpecial "\$batinclude"
syn match gamsSpecial "\$libinclude"
syn match gamsSpecial "\$sysinclude"
syn match gamsSpecial "\$goto"
syn match gamsSpecial "\$label"
syn match gamsSpecial "\$exit"
syn match gamsSpecial "\$kill"

syn match gamsSpecial "\$offlisting"
syn match gamsSpecial "\$onlisting"
syn match gamsSpecial "\$oneolcom"
syn match gamsSpecial "\$offeolcom"

syn match gamsSpecial "\$stars"
syn match gamsSpecial "\$setglobal"
syn match gamsSpecial "\$dropglobal"
syn match gamsSpecial "\$setlocal"
syn match gamsSpecial "\$droplocal"
syn match gamsSpecial "\$setenv"
syn match gamsSpecial "\$setnames"

syn match gamsSpecial "\$onglobal"
syn match gamsSpecial "\$offglobal"

syn match gamsSpecial "\$setargs"
syn match gamsSpecial "\$onmulti"
syn match gamsSpecial "\$offmulti"
syn match gamsSpecial "\$onempty"
syn match gamsSpecial "\$offempty"

syn match gamsSpecial "\$comment"
syn match gamsSpecial "\$dollar"
syn match gamsSpecial "\$double"
syn match gamsSpecial "\$single"
syn match gamsSpecial "\$echo"
syn match gamsSpecial "\$echon"
syn match gamsSpecial "\$eject"
syn match gamsSpecial "\$error"
syn match gamsSpecial "\$escape"
syn match gamsSpecial "\$expose"
syn match gamsSpecial "\$hidden"
syn match gamsSpecial "\$hide"

syn match gamsSpecial "\$inlinecom"
syn match gamsSpecial "\$lines"
syn match gamsSpecial "\$log"

syn match gamsSpecial "\$maxcol"
syn match gamsSpecial "\$mincol"
syn match gamsSpecial "\$offdigit"
syn match gamsSpecial "\$ondigit"
syn match gamsSpecial "\$offend"
syn match gamsSpecial "\$onend"
syn match gamsSpecial "\$offeps"
syn match gamsSpecial "\$oneps"
syn match gamsSpecial "\$offinline"
syn match gamsSpecial "\$oninline"
syn match gamsSpecial "\$offmargin"
syn match gamsSpecial "\$onmargin"
syn match gamsSpecial "\$offnestcom"
syn match gamsSpecial "\$onnestcom"

syn match gamsSpecial "\$onput"
syn match gamsSpecial "\$onputs"
syn match gamsSpecial "\$onputv"
syn match gamsSpecial "\$offput"

syn match gamsSpecial "\$onsymlist"
syn match gamsSpecial "\$offsymlist"
syn match gamsSpecial "\$onsymxref"
syn match gamsSpecial "\$offsymxref"
syn match gamsSpecial "\$onuellist"
syn match gamsSpecial "\$offuellist"
syn match gamsSpecial "\$onuelxref"
syn match gamsSpecial "\$offuelxref"

syn match gamsSpecial "\$onundf"
syn match gamsSpecial "\$offundf"
syn match gamsSpecial "\$onupper"
syn match gamsSpecial "\$offupper"
syn match gamsSpecial "\$onwarning"
syn match gamsSpecial "\$offwarning"

syn match gamsSpecial "\$phantom"
syn match gamsSpecial "\$prefixpath"
syn match gamsSpecial "\$protect"
syn match gamsSpecial "\$purge"
syn match gamsSpecial "\$remark"

syn match gamsSpecial "\$setcomps"
syn match gamsSpecial "\$setddlist"
syn match gamsSpecial "\$shift"
syn match gamsSpecial "\$show"

syn match gamsSpecial "\$use205"
syn match gamsSpecial "\$use225"
syn match gamsSpecial "\$use999"

syn match gamsSpecial "\$title"
syn match gamsSpecial "\$stitle"

syn match gamsSpecial "\$abort"
syn match gamsSpecial "\$terminate"
syn match gamsSpecial "\$stop"

syn keyword gamsSpecial execute_load execute_unload

syn match gamsSpecial "\$("he=e-1


syntax keyword gamsFunction     ABS ASC sigmoid  
syntax keyword gamsFunction      acos acosh asin asinh atan atan2
syntax keyword gamsFunction      atanh ceil ctime cos cosh exp floor log log10
syntax keyword gamsFunction      max min precision round sin sinh sqrt tan tanh sqr
syntax keyword gamsFunction      time trunc div
syntax keyword gamsFunction      beta betareg binomial edist entropy errorf fact
syntax keyword gamsFunction      gamma gammareg logbeta loggamma normal
syntax keyword gamsFunction      mapval mod ncpcm ncpf pi poly power
syntax keyword gamsFunction      sign trunc uniform uniformint

syntax keyword gamsTodo contained       TODO

" hihglight every word starting with a dollar sign in the beggining of the line
"syn match gamsSpecial           "^\$\<[^ ]\+\>"

"integer number, or floating point number without a dot.
syn match  gamsNumber           "\<\d\+\>"
"floating point number, with dot
syn match  gamsNumber           "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  gamsNumber           "\.\d\+\>"

"integer number, or floating point number without a dot.
syn match  gamsNumber           "\<\d\+\>"
"floating point number, with dot
syn match  gamsNumber           "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  gamsNumber           "\.\d\+\>"

" String and Character contstants
syn region  gamsString            start=+"+  skip=+\\\\\|\\"+  end=+"+
" with single quotes as well
syn region  gamsString            start=+'+  skip=+\\\\\|\\"+  end=+'+


" GAMS comments:
" switch on for end of line comments 
" syn match   gamsComment         "#.*$"

syntax match gamsComment       "^\*.*"
"syn match gamsComment "^/star.*$"
"syn region gamsComment start="^\*" end="^\*" 

syntax region  gamsComment         start="^\$ontext" end="^\$offtext"
" would highlight and/or everywhere
" syn match   gamsMathsOperator   "-\|=\|[:<>+\*^/\\]\|AND\|OR"
syn match gamsMathsOperator "-\|=\|[:+^/\\]"
syn match gamsMathsOperator "\A\(AND\|OR\|XOR\|NOT\)\A"hs=s+1,he=e-1

" ?? =e=, =g=, =l=

" to include .csv files
syn region gamsInclude start="\$ondelim" end="\$offdelim"



" GAMS global variables e.g. %myglobal%  
syn region gamsInclude start="%" end="%"
" when a command line parameter is passed to the gams code the %1 notation can be used
syn region gamsInclude start="%" end=" "
"syn region gamsInclude start="\"%" end="%\""


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have
" highlighting yet
if version >= 508 || !exists("did_gams_syntax_inits")
  if version < 508
    let did_gams_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gamsLabel              Label
  HiLink gamsConditional        Conditional
  HiLink gamsRepeat             Repeat
  HiLink gamsLineNumber Comment
  HiLink gamsNumber             Number
  HiLink gamsError              Error
  HiLink gamsStatement  Statement
  HiLink gamsString             String
  HiLink gamsComment            Comment
  HiLink gamsSpecial            Special
  HiLink gamsTodo               Todo
  HiLink gamsFunction           Identifier
  HiLink gamsTypeSpecifier Type
  HiLink gamsFilenumber gamsTypeSpecifier
  HiLink gamsInclude           Special 
  hi gamsMathsOperator term=bold cterm=bold gui=bold

  delcommand HiLink
endif

let b:current_syntax = "gams"

" vim: ts=8 
