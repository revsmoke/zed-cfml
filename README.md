# zed-cfml

ColdFusion 2025 CFML language support for [Zed](https://github.com/zed-industries/zed).

## Features

This extension provides comprehensive syntax highlighting for:

### CFML (.cfc files)
- Component definitions and inheritance
- Property declarations
- Function definitions and access modifiers
- ColdFusion-specific keywords and operators
- Built-in functions and data types
- CF2025 async/await syntax

### CFScript (.cfs files) 
- Modern JavaScript-like ColdFusion syntax
- Control flow statements (if/else, loops, try/catch)
- Function expressions and declarations
- Lambda expressions and closures
- Async programming features
- Type annotations and modifiers

### CFHTML (.cfm files)
- HTML with embedded ColdFusion tags
- CFScript blocks within CFHTML
- Tag-based ColdFusion syntax
- Query and output operations
- Error handling constructs

## ColdFusion 2025 Enhancements

This extension includes support for ColdFusion 2025 specific features:

### New Keywords
- `async`, `await` - Asynchronous programming
- `lambda`, `closure` - Functional programming constructs
- `null`, `undefined` - Enhanced null handling
- `final`, `abstract`, `static`, `readonly` - Advanced OOP modifiers

### Enhanced Functions
- Promise-based operations: `promiseNew()`, `promiseAll()`, `promiseRace()`
- Async utilities: `asyncRun()`, `asyncAwait()`
- Lambda creation: `lambdaNew()`, `closureNew()`
- Enhanced array/struct methods: `filter()`, `map()`, `reduce()`, `each()`
- Null safety: `nullValue()`, `elvis()`, `nullCoalescing()`
- Security functions: `csrfGenerateToken()`, `htmlSafe()`, `sqlSafe()`

### New Tags (CFHTML)
- `<cfasync>` - Asynchronous tag execution
- `<cfpromise>` - Promise-based operations
- `<cflambda>` - Lambda expression tags
- `<cfnull>` - Null value handling

## Installation

Install this extension through the Zed extensions marketplace or add it to your Zed configuration.