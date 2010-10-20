" Vim syntax file
" Language:	GAMS
" Maintainer:	Henry Bryant <h-bryant@tamu.edu>
" Last Change:  2007-05-09
" Filenames:	*.gms *.gams
"

if exists("b:current_syntax")
  finish
endif

syn case ignore

" math
	syn match gamsComp /[<>=]/
	syn match gamsComp /=[cCeElLgGnN]=/
	syn keyword gamsComp lt gt le ge eq ne
	syn match gamsMath /[\+\-\*]/
	syn keyword gamsLogic or xor not and

" constants
	" string enclosed in double quotes
	syn region gamsString start=/"/ skip=/\\\\\|\\"/ end=/"/
	" string enclosed in single quotes
	syn region gamsString start=/'/ skip=/\\\\\|\\'/ end=/'/
	" number with no fractional part or exponent
	syn match gamsNumber /\d\+/
	" floating point number with integer and fractional parts and optional exponent
	syn match gamsNumber /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
	" floating point number with no integer part and optional exponent
	syn match gamsNumber /\.\d\+\([Ee][-+]\=\d\+\)\=/
	" floating point number with no fractional part and optional exponent
	syn match gamsNumber /\d\+[Ee][-+]\=\d\+/
	syn keyword gamsNumber eps na undf
	syn match gamsNumber /[ +-]inf/

" statements
	syn keyword gamsStatement  alias positive negative free integer binary 
							\ sum solve using display option loop
							\ loop if elseif else while for sos1 sos2 semicont semiint file put putclose puttl puthd putpage
							\ mcp nlp lp

" dollar control
	syn match gamsControl /^\$comment/
	syn match gamsControl /^\$eolcom/
	syn match gamsControl /^\$inlinecom/
	syn match gamsControl /^\$maxcol/
	syn match gamsControl /^\$mincol/
	syn match gamsControl /^\$offeolcom/
	syn match gamsControl /^\$offinline/
	syn match gamsControl /^\$offmargin/
	syn match gamsControl /^\$offnestcom/
	syn match gamsControl /^\$offtext/
	syn match gamsControl /^\$oneolcom/
	syn match gamsControl /^\$oninline/
	syn match gamsControl /^\$onmargin/
	syn match gamsControl /^\$onnestcom/
	syn match gamsControl /^\$ontext/
	syn match gamsControl /^\$dollar/
	syn match gamsControl /^\$offdigit/
	syn match gamsControl /^\$offempty/
	syn match gamsControl /^\$offend/
	syn match gamsControl /^\$offeps/
	syn match gamsControl /^\$offglobal/
	syn match gamsControl /^\$offwarning/
	syn match gamsControl /^\$ondigit/
	syn match gamsControl /^\$onempty/
	syn match gamsControl /^\$onend/
	syn match gamsControl /^\$oneps/
	syn match gamsControl /^\$onglobal/
	syn match gamsControl /^\$onwarning/
	syn match gamsControl /^\$use205/
	syn match gamsControl /^\$use225/
	syn match gamsControl /^\$use999/
	syn match gamsControl /^\$double/
	syn match gamsControl /^\$eject/
	syn match gamsControl /^\$hidden/
	syn match gamsControl /^\$lines/
	syn match gamsControl /^\$offdollar/
	syn match gamsControl /^\$offinclude/
	syn match gamsControl /^\$offlisting/
	syn match gamsControl /^\$offupper/
	syn match gamsControl /^\$ondollar/
	syn match gamsControl /^\$oninclude/
	syn match gamsControl /^\$onlisting/
	syn match gamsControl /^\$onupper/
	syn match gamsControl /^\$single/
	syn match gamsControl /^\$stars/
	syn match gamsControl /^\$stitle/
	syn match gamsControl /^\$title/
	syn match gamsControl /^\$offsymlist/
	syn match gamsControl /^\$offsymxref/
	syn match gamsControl /^\$offuellist/
	syn match gamsControl /^\$offuelxref/
	syn match gamsControl /^\$onsymlist/
	syn match gamsControl /^\$onsymxref/
	syn match gamsControl /^\$onuellist/
	syn match gamsControl /^\$onuelxref/
	syn match gamsControl /^\$abort/
	syn match gamsControl /^\$batinclude/
	syn match gamsControl /^\$call/
	syn match gamsControl /^\$clear/
	syn match gamsControl /^\$echo/
	syn match gamsControl /^\$offecho/
	syn match gamsControl /^\$error/
	syn match gamsControl /^\$exit/
	syn match gamsControl /\$goto/
	syn match gamsControl /^\$if/
	syn match gamsControl /\$include/
	syn match gamsControl /^\$kill/
	syn match gamsControl /^\$label/
	syn match gamsControl /^\$libinclude/
	syn match gamsControl /^\$onglobal/
	syn match gamsControl /^\$onmulti/
	syn match gamsControl /^\$offglobal/
	syn match gamsControl /^\$offmulti/
	syn match gamsControl /^\$phantom/
	syn match gamsControl /^\$shift/
	syn match gamsControl /^\$sysinclude/
	syn match gamsControl /^\$load/
	syn match gamsControl /^\$loaddc/
	syn match gamsControl /^\$gdxin/
	syn match gamsControl /^\$gdxout/
	syn match gamsControl /^\$unload/
	syn match gamsControl /^\$purge/
	syn match gamsControl /^\$hide/
	syn match gamsControl /^\$expose/
	syn match gamsControl /^\$protect/
	syn match gamsControl /^\$acc/
	syn match gamsControl /^\$encrypt/
	syn match gamsControl /^\$compress/
	syn match gamsControl /^\$decompress/

" suffixes
	syn match gamsSuffix /\.pc/
	syn match gamsSuffix /\.ps/
	syn match gamsSuffix /\.pw/
	syn match gamsSuffix /\.tm/
	syn match gamsSuffix /\.bm/
	syn match gamsSuffix /\.case/
	syn match gamsSuffix /\.data/
	syn match gamsSuffix /\.ifile/
	syn match gamsSuffix /\.ofile/
	syn match gamsSuffix /\.page/
	syn match gamsSuffix /\.rdate/
	syn match gamsSuffix /\.rfile/
	syn match gamsSuffix /\.rtime/
	syn match gamsSuffix /\.sfile/
	syn match gamsSuffix /\.time/
	syn match gamsSuffix /\.title/
	syn match gamsSuffix /\.ts/
	syn match gamsSuffix /\.tl/
	syn match gamsSuffix /\.te/
	syn match gamsSuffix /\.tf/
	syn match gamsSuffix /\.l/
	syn match gamsSuffix /\.lo/
	syn match gamsSuffix /\.m/
	syn match gamsSuffix /\.fx/
	syn match gamsSuffix /\.prior/
	syn match gamsSuffix /\.scale/
	syn match gamsSuffix /\.up/
	syn match gamsSuffix /\.lj/
	syn match gamsSuffix /\.nj/
	syn match gamsSuffix /\.sj/
	syn match gamsSuffix /\.tj/
	syn match gamsSuffix /\.lw/
	syn match gamsSuffix /\.nw/
	syn match gamsSuffix /\.sw/
	syn match gamsSuffix /\.tw/
	syn match gamsSuffix /\.nd/
	syn match gamsSuffix /\.nr/
	syn match gamsSuffix /\.nz/
	syn match gamsSuffix /\.cc/
	syn match gamsSuffix /\.hdcc/
	syn match gamsSuffix /\.tlcc/
	syn match gamsSuffix /\.cr/
	syn match gamsSuffix /\.hdcr/
	syn match gamsSuffix /\.tlcr/
	syn match gamsSuffix /\.ll/
	syn match gamsSuffix /\.hdll/
	syn match gamsSuffix /\.tlll/
	syn match gamsSuffix /\.lp/
	syn match gamsSuffix /\.ws/
	syn match gamsSuffix /\.errors/

" data types
	syn keyword gamsType scalar scalars table

" equation declaration and definition regions
	syn region gamsEqn matchgroup=Delimiter start=/\.\./ matchgroup=Delimiter end=/;/ transparent contains=ALLBUT,gamsComment,gamsData,gamsSetComment,gamsParamComment,gamsVarComment,gamsSetValues,gamsParamValues
	syn region gamsEqDecl matchgroup=Delimiter start=/^[ \t]*equation[ s\n]/ matchgroup=Delimiter end=/;/ transparent contains=gamsEqDeclComment,gamsComment
	syn match gamsEqDeclComment /^[ \t]*[^ \t]*\zs[^;$\/]*/ contained 

" variable declaration region
	syn region gamsVar matchgroup=Delimiter start=/[ \t\n]*variable[ s\n]/ matchgroup=Delimiter end=/;/ transparent contains=gamsVarComment,gamsComment
	syn match gamsVarComment /^[ \t]*[^ \t]*\zs[^;$\/]*/ contained 

" set region
	syn region gamsSet matchgroup=Delimiter start=/^[ \t]*set[ s\n]/ matchgroup=Delimiter end=/;/ transparent contains=gamsSetComment,gamsComment,gamsSetValues
	syn match gamsSetComment /^[ \t]*[^ \t]*\zs[^;$\/]*/ contained 
	syn region gamsSetValues matchgroup=Delimiter start=/\// matchgroup=Delimiter end=/\// transparent contains=NONE contained

" parameter region
	syn region gamsParam matchgroup=Delimiter start=/^[ \t]*parameter[ s\n]/ matchgroup=Delimiter end=/;/ transparent contains=gamsParamComment,gamsComment,gamsParamValues
	syn match gamsParamComment /^[ \t]*[^ \t]*\zs[^;$\/]*/ contained 
	syn region gamsParamValues matchgroup=Delimiter start=/\// matchgroup=Delimiter end=/\// transparent contains=gamsNumber contained

" model definition region
	syn region gamsModel matchgroup=Delimiter start=/^[ \t]*model[ \n]/ matchgroup=Delimiter end=/;/ transparent contains=gamsModelValues,gamsComment
	syn region gamsModelValues matchgroup=Delimiter start=/\// matchgroup=Delimiter end=/\// transparent contained

" grouping and grouping errors
	syn region gamsRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,gamsError,gamsBraceError,gamsCurlyError,gamsSetComment
	syn region gamsRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,gamsError,gamsBraceError,gamsParenError,gamsSetComment
	syn region gamsRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/\]/ transparent contains=ALLBUT,gamsError,gamsCurlyError,gamsParenError,gamsSetComment
	syn match gamsError      /[)\]}]/
	syn match gamsBraceError /[)}]/ contained
	syn match gamsCurlyError /[)\]]/ contained
	syn match gamsParenError /[\]}]/ contained

" comments that are not inside special regions
	syn match gamsComment /^\*.*/
	syn match gamsComment /\.*!!.*/
	syn region gamsComment matchgroup=Delimiter start=/^\$ontext/ matchgroup=Delimiter end=/^\$offtext/
	syn match gamsComment /^\$hidden.*/ 

" some stuff that must come at the end - do not move!
	syn match gamsMath /\//
	syn region gamsComment matchgroup=Delimiter start=/\/\*/ matchgroup=Delimiter end=/\*\//


hi def link gamsComment     		Comment
hi def link gamsString      		String
hi def link gamsNumber      		Number
hi def link gamsStatement   		Statement
hi def link gamsControl				Statement
hi def link gamsSuffix				Statement
hi def link gamsType        		Special
hi def link gamsError       		Error
hi def link gamsBraceError  		Error
hi def link gamsCurlyError  		Error
hi def link gamsParenError			Error
hi def link gamsComp				Statement
hi def link gamsLogic				Statement
hi def link gamsMath				Statement
hi def link gamsSetComment			Comment
hi def link gamsParamComment		Comment
hi def link gamsVarComment			Comment
hi def link gamsEqDeclComment		Comment

let b:current_syntax="gams"
