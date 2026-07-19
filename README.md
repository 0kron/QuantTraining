# Quant Training
Made of write ups and investigations related to the Quant Finance field.

- **Project's Tree**:
```
.
├── Main        // Write Ups in PDF format
├── Raw         // Raw Code solutions
├── src         // Typst template
├── Typ         // Typst files
├── compile.sh
├── new.sh
└── README.md
```

## Table of contents

- **A Practical Guide to Quantitative Finance Interviews**:
- **CSES**:
  - Introductory Problems:
    - [Missing Numbers](Main/CSES_MissingNumber.pdf).

- **CodeForces**:
- **CodeSignal**:

## Usage and Disclosure

The content of this to its authors but is available for anyone to read it and 
send corrections either on a PR, or by our emails.

The scripts in the main directory are created to make the creation and 
management of files as easy as possible.

#### `new.sh`
Validates if an Write Up exists, and if not, uses the values given either as 
flags or as terminal input to create a new instance inside `Typ/` to edit.

It can take all the data as follows:
```
$ ./new.sh -n MissingNumber -s CSES
```

Or be executed with no flags, and the script will ask for the information.
```
$ ./new.sh
```

#### `compile.sh` 
Validates if an Write Up exists, and if so, compiles it inside `Main/` with the
same name as its `Typ/`'s counter part. In addition, there is the `-w` flag 
that uses the `watch` command built-in the Typst compiler to have a real-time
update.

## Dependencies

On *NIX systems, the scripts `new.sh` and `compile.sh` use `sed` and `typst`.


### File format
| Source     | Name/id        | Termination | File Name                    |
| ---------- | -------------- | ----------- | ---------------------------- |
| CSES       | MissingNumbers | .typ        | CSES_MissingNumbers.typ      |
| CSES       | MissingNumbers | .cpp        | CSES_MissingNumbers.cpp      |
| CSES       | MissingNumbers | .html/.pdf  | CSES_MissingNumbers.html/pdf |
