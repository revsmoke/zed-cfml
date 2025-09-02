; Variables
;----------

(identifier) @variable

; Properties
;-----------

(property_identifier) @property

; Function and method definitions
;--------------------------------

(function_expression
  name: (identifier) @function)
(function_declaration
  name: (identifier) @function)
(method_definition
  name: (property_identifier) @function.method)

(pair
  key: (property_identifier) @function.method
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: [(function_expression) (arrow_function)])

(variable_declarator
  name: (identifier) @function
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (identifier) @function
  right: [(function_expression) (arrow_function)])

; Function and method calls
;--------------------------

(call_expression
  function: (identifier) @function)

(call_expression
  function: (member_expression
    property: (property_identifier) @function.method))

; Keywords
;---------

; Control flow keywords
[
  "if"
  "else"
  "switch"
  "case"
  "default"
  "for"
  "while"
  "do"
  "break"
  "continue"
  "try"
  "catch"
  "finally"
  "throw"
  "rethrow"
] @keyword.control

; Function keywords
[
  "function"
  "return"
  "var"
  "local"
  "arguments"
] @keyword.function

; Component keywords
[
  "component"
  "interface"
  "extends"
  "implements"
  "import"
  "property"
  "new"
] @keyword.type

; ColdFusion scope keywords
[
  "application"
  "session"
  "request"
  "cgi"
  "url"
  "form"
  "cookie"
  "client"
  "server"
  "variables"
  "this"
  "super"
] @variable.builtin

; ColdFusion operators (as keywords)
[
  "eq"
  "neq"
  "lt"
  "lte"
  "gt"
  "gte"
  "and"
  "or"
  "not"
  "mod"
  "is"
  "contains"
] @keyword.operator

; Data type keywords
[
  "struct"
  "array"
  "query"
  "string"
  "numeric"
  "boolean"
  "binary"
  "date"
  "any"
  "void"
  "required"
  "public"
  "private"
  "package"
  "remote"
  "final"
  "abstract"
  "static"
  "readonly"
] @keyword.type

; ColdFusion 2025 specific keywords
[
  "async"
  "await"
  "yield"
  "lambda"
  "closure"
  "null"
  "undefined"
] @keyword.control.import

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

; Literals
;---------

[
  (true)
  (false)
  (null)
] @constant.builtin

(comment) @comment

[
  (string)
] @string

; Tokens
;-------

[
  ";"
  (optional_chain)
  "."
  ","
] @punctuation.delimiter

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
