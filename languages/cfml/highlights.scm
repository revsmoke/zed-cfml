(tag_name) @tag
(erroneous_end_tag_name) @tag.error
(doctype) @constant
(attribute_name) @attribute
(attribute_value) @string
(raw_text) @embedded
(start_tag) @tag
(end_tag) @tag
(self_closing_tag) @tag
(cf_selfclose_tag) @tag
(cf_output_tag) @tag
(cf_tag) @tag

; Variables
;----------

(identifier) @variable

; Properties
;-----------

(property_identifier) @property

; Function and method definitions
;--------------------------------

(function_expression
  name: (identifier) @function) @definition.function

(cf_function
	(cf_attribute
    	(cf_attribute_name) @attribute (#eq? @attribute "name")
        (quoted_cf_attribute_value
        	(attribute_value) @function
        )
	)
) @definition.function

(function_declaration
  name: (identifier) @function)

(generator_function
  name: (identifier) @function)

(generator_function_declaration
  name: (identifier) @function)

(method_definition
  name: [
    (property_identifier)
    (private_property_identifier)
  ] @function.method)

(method_definition
  name: (property_identifier) @constructor
  (#eq? @constructor "constructor"))

(pair
  key: (property_identifier) @function.method
  value: (function_expression))

(pair
  key: (property_identifier) @function.method
  value: (arrow_function))

(array) @expression

(cf_set_tag) @tag

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (arrow_function))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (function_expression))

(variable_declarator
  name: (identifier) @function
  value: (arrow_function))

(variable_declarator
  name: (identifier) @function
  value: (function_expression))

(assignment_expression
  left: (identifier) @function
  right: (arrow_function))

(assignment_expression
  left: (identifier) @function
  right: (function_expression))

; Function and method calls
;--------------------------

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: [
      (property_identifier)
      (private_property_identifier)
    ] @function.method.call))

; ColdFusion Keywords for embedded scripts
;------------------------------------------

; Control flow keywords
((identifier) @keyword.control
  (#any-of? @keyword.control
    "if" "else" "switch" "case" "default" "for" "while" "do"
    "break" "continue" "try" "catch" "finally" "throw" "rethrow"
  ))

; Function keywords
((identifier) @keyword.function
  (#any-of? @keyword.function
    "function" "return" "var" "local" "arguments"
  ))

; Component keywords
((identifier) @keyword.type
  (#any-of? @keyword.type
    "component" "interface" "extends" "implements" "import" "property"
    "new" "struct" "array" "query" "string" "numeric" "boolean"
    "binary" "date" "any" "void" "required" "public" "private"
    "package" "remote" "final" "abstract" "static" "readonly"
  ))

; ColdFusion 2025 specific keywords
((identifier) @keyword.control.import
  (#any-of? @keyword.control.import
    "async" "await" "yield" "lambda" "closure" "null" "undefined"
  ))

; ColdFusion scope keywords
((identifier) @variable.builtin
  (#any-of? @variable.builtin
    "application" "session" "request" "cgi" "url" "form" "cookie"
    "client" "server" "variables" "this" "super" "self"
  ))

; ColdFusion operators (as keywords)
((identifier) @keyword.operator
  (#any-of? @keyword.operator
    "eq" "neq" "lt" "lte" "gt" "gte" "and" "or" "not" "mod" "is" "contains"
  ))

; Built-in functions
((identifier) @function.builtin
  (#any-of? @function.builtin
    ; String functions
    "len" "trim" "left" "right" "mid" "replace" "replaceNoCase" 
    "find" "findNoCase" "lcase" "ucase" "reverse" "repeatString"
    "compare" "compareNoCase" "insert" "removeChars" "spanExcluding"
    "spanIncluding" "val" "asc" "chr" "htmlEditFormat" "htmlCodeFormat"
    "urlEncodedFormat" "urlDecode" "javacast" "toString"
    ; Array functions
    "arrayNew" "arrayLen" "arrayAppend" "arraySort" "arrayReverse"
    "arrayDeleteAt" "arrayInsertAt" "arrayAvg" "arrayMax" "arrayMin"
    "arraySum" "arrayToList" "listToArray" "arraySlice" "arrayEach"
    "arrayFilter" "arrayMap" "arrayReduce" "arrayFind" "arrayFindNoCase"
    "arrayIsDefined" "arrayContains" "arrayContainsNoCase" "arrayMerge"
    ; Struct functions
    "structNew" "structKeyExists" "structDelete" "structCount" 
    "structKeyArray" "structKeyList" "structClear" "structCopy"
    "structAppend" "structInsert" "structUpdate" "structFind"
    "structFindKey" "structFindValue" "structSort" "structEach"
    "structToSorted" "structGetMetadata"
    ; Query functions
    "queryNew" "queryAddRow" "querySetCell" "queryExecute"
    "queryGetRow" "queryDeleteRow" "querySort" "valueList"
    "quotedValueList" "queryRowData" "queryColumnData"
    "queryFilter" "queryMap" "queryReduce" "queryEach"
    ; Date functions
    "now" "dateFormat" "timeFormat" "dateAdd" "dateDiff" "createDate"
    "createTime" "createDateTime" "parseDateTime" "createODBCDate"
    "createODBCTime" "createODBCDateTime" "dateCompare" "createTimeSpan"
    "getTickCount" "isDate" "isLeapYear" "daysInMonth" "daysInYear"
    "datePart" "getTimezone" "setTimezone"
    ; File/IO functions
    "fileRead" "fileWrite" "fileExists" "directoryList" "directoryExists"
    "fileDelete" "directoryDelete" "fileMove" "directoryCreate"
    "getFileInfo" "getTempDirectory" "getTempFile" "expandPath"
    "fileReadBinary" "fileWriteBinary" "fileCopy" "fileGetMimeType"
    ; Type checking functions
    "isArray" "isStruct" "isQuery" "isNumeric" "isDate" "isValid"
    "isBoolean" "isBinary" "isDefined" "isNull" "isObject" "isSimpleValue"
    "isClosure" "isCustomFunction" "isInstanceOf" "isJSON" "isXML"
    "isEmpty" "isLambda" "isThread"
    ; Math functions
    "abs" "acos" "asin" "atan" "atan2" "ceiling" "cos" "exp" "fix"
    "floor" "log" "log10" "max" "min" "pi" "power" "rand" "randomize"
    "round" "sgn" "sin" "sqr" "tan" "randRange" "formatBaseN"
    "precisionEvaluate" "bitAnd" "bitOr" "bitXor" "bitNot" "bitShift"
    ; List functions
    "listAppend" "listPrepend" "listInsertAt" "listDeleteAt" "listSetAt"
    "listGetAt" "listLen" "listFind" "listFindNoCase" "listContains"
    "listContainsNoCase" "listFirst" "listLast" "listRest" "listSort"
    "listChangeDelims" "listQualify" "listValueCount" "listValueCountNoCase"
    "listEach" "listFilter" "listMap" "listReduce" "listToArray"
    ; ColdFusion 2025 specific functions
    "asyncRun" "asyncAwait" "promiseNew" "promiseAll" "promiseRace"
    "lambdaNew" "closureNew" "threadNew" "threadJoin" "threadTerminate"
    "nullValue" "elvis" "nullCoalescing" "optionalChaining"
    "structToJSON" "arrayToJSON" "queryToJSON" "jsonToStruct" "jsonToArray"
    ; Other common functions
    "duplicate" "serializeJSON" "deserializeJSON" "hash" "encrypt" "decrypt"
    "cfusion_encrypt" "cfusion_decrypt" "base64Encode" "base64Decode"
    "urlSessionFormat" "createUUID" "generateSecretKey" "xmlParse"
    "xmlTransform" "xmlFormat" "xmlEscapeText" "getMetaData" "evaluate"
    "iif" "de" "writeOutput" "writeDump" "abort" "include" "location"
    "parameterExists" "getDirectoryFromPath" "getFileFromPath"
    "getBaseTemplatePath" "getCurrentTemplatePath" "getTemplatePath"
    "invoke" "invokeMethod" "createObject" "getComponentMetadata"
    ; Security and validation functions
    "isValidUUID" "isValidEmail" "isValidURL" "isValidCreditCard"
    "csrfGenerateToken" "csrfVerifyToken" "htmlSafe" "sqlSafe"
  ))

; ColdFusion Tags
;-----------------

; Tag names that should be highlighted as keywords
((tag_name) @keyword.control
  (#any-of? @keyword.control
    "cfif" "cfelseif" "cfelse" "cfloop" "cfbreak" "cfcontinue"
    "cfswitch" "cfcase" "cfdefaultcase" "cftry" "cfcatch" "cffinally"
    "cfthrow" "cfrethrow" "cfset" "cfparam" "cfabort" "cflocation"
    "cfinclude" "cfmodule"
  ))

((tag_name) @keyword.function
  (#any-of? @keyword.function
    "cffunction" "cfargument" "cfreturn" "cfinvoke" "cfinvokeargument"
  ))

((tag_name) @keyword.type
  (#any-of? @keyword.type
    "cfcomponent" "cfproperty" "cfinterface"
  ))

((tag_name) @function.builtin
  (#any-of? @function.builtin
    "cfoutput" "cfdump" "cflog" "cfquery" "cfqueryparam" "cfprocparam"
    "cfprocresult" "cffile" "cfdirectory" "cfzip" "cfhttp" "cfhttpparam"
    "cfmail" "cfmailparam" "cfcontent" "cfheader" "cfcookie" "cfwddx"
    "cfxml" "cfexecute" "cfobject" "cfchart" "cfchartdata" "cfchartseries"
    "cfimage" "cfdocument" "cfpdf" "cfspreadsheet" "cfftp" "cfldap"
    "cfpop" "cfexchange" "cfsharepoint" "cffeed" "cfdbinfo" "cfthread"
    "cflock" "cftransaction" "cfstoredproc" "cfschedule" "cfregistry"
    "cfform" "cfinput" "cfselect" "cftextarea" "cfgrid" "cftree"
    "cfapplet" "cfapplication" "cferror" "cfsetting" "cfsilent"
    ; CF2025 specific tags
    "cfasync" "cfawait" "cfpromise" "cflambda" "cfclosure" "cfnull"
    "cfwebsocket" "cfapi" "cfmicroservice" "cfcloud" "cfmobile"
    "cfpwa" "cfperformance" "cfsecurity" "cfvalidation"
  ))

; Literals
;---------
;
; (this)
; (super)
; @variable.builtin

((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

[
  (true)
  (false)
] @boolean

[
  (null)
] @constant.builtin

[
  (comment)
  (cf_comment)
] @comment @spell

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))

((string_fragment) @keyword.directive
  (#eq? @keyword.directive "use strict"))

(string) @string
(text) @string

(escape_sequence) @string.escape

(regex_pattern) @string.regexp
(regex_flags) @character.special

(regex
  "/" @punctuation.bracket) ; Regex delimiters

(number) @number

(hash_expression) @function

((identifier) @number
  (#any-of? @number "NaN" "Infinity"))

; Punctuation
;------------
[
  ";"
  "."
  ","
  ":"
] @punctuation.delimiter

(binary_expression
  "/" @operator)

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

[
  "-"
  "--"
  "-="
  "+"
  "++"
  "+="
  "*"
  "*="
  "**"
  "**="
  "/"
  "/="
  "%"
  "%="
  "<"
  "<="
  "<<"
  "<<="
  "="
  "=="
  "==="
  "!"
  "!="
  "!=="
  "=>"
  ">"
  ">="
  ">>"
  ">>="
  ">>>"
  ">>>="
  "~"
  "^"
  "&"
  "|"
  "^="
  "&="
  "|="
  "&&"
  "||"
  "??"
  "&&="
  "||="
  "??="
] @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<"
  ">"
  "</"
  "/>"
] @punctuation.bracket
