" It is really a hack job ignoring best practices. I royally screwed up the
" regular expressions which led to the definition of the pythonBrackets.
" This should be improved and simplified.
syn match   pythonFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
syn region pythonVars start="(" end=")" contained contains=pythonParameters,pythonSelf transparent keepend
syn match pythonParameters "[^,:]*" contained contains=pythonParam,pythonBrackets skipwhite
syn match pythonSelf "(self)*" contained contains=pythonParam,pythonBrackets skipwhite
syn match pythonParam "=[^,]*" contained contains=pythonExtraOperator,pythonBuiltin,pythonConstant,pythonStatement,pythonNumber,pythonString,pythonClassVar skipwhite
syn match pythonBrackets "[(|)]" contained skipwhite

" NOTE: @pfdevilliers added this
" The same as the previous definitions but for the python class.
syn match   pythonClass
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonClassVars
syn region pythonClassVars start="(" end=")" contained contains=pythonClassParameters transparent keepend
syn match pythonClassParameters "[^,]*" contained contains=pythonBuiltin,pythonBrackets skipwhite

