# bash-mg
A simple, lightweight Bash library for printing styled and color-coded terminal messages. Useful for debugging, scripting, CI/CD output, and interactive tools.

## Features

- Supports standard colors: red, green, yellow, blue, cyan, magenta
- Styled output with `**bold**` and `__underline__`
- Debug, warning, and error message helpers
- Optional automatic exit on error
- Easy to integrate into other scripts

## Usage

## 1. Source the Library

```bash
source /path/to/message.sh
```

## 2. Example
```bash
#!/bin/bash
source ./message.sh
EXIT_ON_ERROR=1

msg "green" "**Setup complete** and __ready to use__\n"
warning "This is a warning"
DEBUG=1
debug "Debugging is enabled"
error "A fatal error occurred"

```
## 3. Formatting
**bold** → bold text

__underline__ → underlined text

### Functions

| Function            | Description                                               |
|---------------------|-----------------------------------------------------------|
| `msg [color] [text]`   | Print a styled message with optional color                |
| `debug [text]`         | Print a debug message if `DEBUG=1`                        |
| `warning [text]`       | Print a warning in yellow                                 |
| `error [text]`         | Print an error in red and exit if `EXIT_ON_ERROR=1`       |
