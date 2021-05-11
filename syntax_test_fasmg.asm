; SYNTAX TEST "Packages/User/ez80-sublime-syntax/fasmg.sublime-syntax"

variable = 1
; <- variable.other.fasmg
;        ^ keyword.operator.assignment.fasmg
;          ^ constant.numeric.integer.decimal.fasmg

ident_$%@^'":
;   ^^^^^^^^ entity.name.label.fasmg
        db      ident_$%@^'"
;                   ^^^^^^^^ variable.other.fasmg

        db      0,0d,0b,0o,0q,$a,0xa0,0ah
;               ^ constant.numeric.integer.decimal.fasmg
;                ^ punctuation.separator.fasmg
;                 ^ constant.numeric.integer.decimal.fasmg
;                    ^ constant.numeric.integer.binary.fasmg
;                       ^ constant.numeric.integer.octal.fasmg
;                          ^ constant.numeric.integer.octal.fasmg
;                             ^ constant.numeric.integer.hexadecimal.fasmg
;                                ^ constant.numeric.integer.hexadecimal.fasmg
;                                     ^ constant.numeric.integer.hexadecimal.fasmg
        db      'hi',"hi"
;               ^ punctuation.definition.string.begin.fasmg
;                ^ string.quoted.single.fasmg
;                  ^ punctuation.definition.string.end.fasmg
;                    ^ punctuation.definition.string.begin.fasmg
;                     ^ string.quoted.double.fasmg
;                       ^ punctuation.definition.string.end.fasmg

a: b:   db      'hi'
; <- entity.name.label.fasmg
;  ^ entity.name.label.fasmg

?c: ?d:   db      'hi'
;^ entity.name.label.fasmg
;    ^ entity.name.label.fasmg

my_label:
; <- entity.name.label.fasmg
case_insensitive_label? :
;                     ^ entity.name.label.fasmg
.dot_label:
;^ entity.name.label.fasmg

namespace test_namespace
; <- keyword.declaration.namespace.fasmg
;         ^ entity.name.namespace.fasmg
end namespace
; <- keyword.other.fasmg
;   ^ keyword.declaration.namespace.fasmg

variable =: 2
; <- variable.other.fasmg
;        ^^ keyword.operator.assignment.fasmg
;           ^ constant.numeric.integer.decimal.fasmg

restore variable
; <- keyword.other.fasmg
;       ^ variable.other.fasmg


label label1
; <- keyword.declaration.label.fasmg
;     ^ entity.name.label.fasmg
label label2:byte
; <- keyword.declaration.label.fasmg
;     ^ entity.name.label.fasmg
;           ^ punctuation.separator.fasmg
;            ^ storage.type.fasmg

        db      1 + 2 - 3 * 4 / 5 mod 6
;                 ^ keyword.operator.arithmetic.fasmg
;                     ^ keyword.operator.arithmetic.fasmg
;                         ^ keyword.operator.arithmetic.fasmg
;                             ^ keyword.operator.arithmetic.fasmg
;                                 ^ keyword.operator.arithmetic.fasmg
        db      1 xor 1 and 1 or 1 shl 1 shr 1
;                 ^ keyword.operator.bitwise.fasmg
;                       ^ keyword.operator.bitwise.fasmg
;                             ^ keyword.operator.bitwise.fasmg
;                                  ^ keyword.operator.bitwise.fasmg
;                                        ^ keyword.operator.bitwise.fasmg
        db      bsr bsf not 1
;               ^ keyword.operator.bitwise.fasmg
;                   ^ keyword.operator.bitwise.fasmg
;                       ^ keyword.operator.bitwise.fasmg

        db      lengthof string 1 bswap 1
;               ^ keyword.operator.word.fasmg
;                        ^ keyword.operator.word.fasmg
;                                 ^ keyword.operator.word.fasmg

        element A
;       ^ keyword.declaration.variable.fasmg
;               ^ variable.other.fasmg
        element B:1
;       ^ keyword.declaration.variable.fasmg
;               ^ variable.other.fasmg
;                ^ punctuation.separator.fasmg
;                 ^ constant.numeric.integer.decimal.fasmg
        linpoly = A + A + 3
        vterm = linpoly scale 1 * linpoly element 1     ; vterm = 2 * A
;                       ^ keyword.operator.word.fasmg
;                                         ^ keyword.operator.word.fasmg

?restore = 1
; <- punctuation.definition.variable.fasmg
;^ variable.other.fasmg
;        ^ keyword.operator.assignment.fasmg
;          ^ constant.numeric.integer.decimal.fasmg
restore restore
; <- keyword.other.fasmg
;       ^ variable.other.fasmg

        dd 0f
;          ^ constant.numeric.float.decimal.fasmg
        dd 0.0
;          ^ constant.numeric.float.decimal.fasmg
        dd 0.0f
;          ^ constant.numeric.float.decimal.fasmg
        dd 0e0
;          ^ constant.numeric.float.decimal.fasmg
;        dd 0e0f ; allowed according to the manual but doesn't actually work
;          ? constant.numeric.float.decimal.fasmg
        dd 0.0e0
;          ^ constant.numeric.float.decimal.fasmg
;        dd 0.0e0f ; allowed according to the manual but doesn't actually work
;          ? constant.numeric.float.decimal.fasmg

        db      0
;       ^ storage.type.fasmg
        dw      0
;       ^ storage.type.fasmg
        dd      0
;       ^ storage.type.fasmg
        dp      0
;       ^ storage.type.fasmg
        dq      0
;       ^ storage.type.fasmg
        dt      0
;       ^ storage.type.fasmg
        ddq     0
;       ^ storage.type.fasmg
        dqq     0
;       ^ storage.type.fasmg
        ddqq    0
;       ^ storage.type.fasmg

        rb      0
;       ^ storage.type.fasmg
        rw      0
;       ^ storage.type.fasmg
        rd      0
;       ^ storage.type.fasmg
        rp      0
;       ^ storage.type.fasmg
        rq      0
;       ^ storage.type.fasmg
        rt      0
;       ^ storage.type.fasmg
        rdq     0
;       ^ storage.type.fasmg
        rqq     0
;       ^ storage.type.fasmg
        rdqq    0
;       ^ storage.type.fasmg

lbl     rb      1
; <- entity.name.label.fasmg
;       ^ storage.type.fasmg
;               ^ constant.numeric.integer.decimal.fasmg

        emit 2: 0,1000,2000
;       ^ keyword.other.fasmg

        file 'README.md'
;       ^ keyword.control.import.fasmg

        ?dd = 1
;       ^ punctuation.definition.variable.fasmg
;        ^ variable.other.fasmg

        ?file = 1
;       ^ punctuation.definition.variable.fasmg
;        ^ variable.other.fasmg

        ?emit = 1
;       ^ punctuation.definition.variable.fasmg
;        ^ variable.other.fasmg

if ~1 & 1 | 1 = 1 | 1 < 1 | 1 > 1 | 1 <= 1 | 1 >= 1 | 1 <> 1
; <- keyword.control.conditional.fasmg
;  ^ keyword.operator.logical.fasmg
;     ^ keyword.operator.logical.fasmg
;         ^ keyword.operator.logical.fasmg
;             ^ keyword.operator.comparison.fasmg
;                     ^ keyword.operator.comparison.fasmg
;                             ^ keyword.operator.comparison.fasmg
;                                     ^^ keyword.operator.comparison.fasmg
;                                              ^^ keyword.operator.comparison.fasmg
;                                                       ^^ keyword.operator.comparison.fasmg
end if
; <- keyword.other.fasmg
;   ^ keyword.control.conditional.fasmg

assert 1 relativeto 1 | 1 eqtype 1 | 1 eq 1 | defined yeet | definite yeet | used yeet
; <- keyword.other.fasmg
;        ^ keyword.operator.comparison.fasmg
;                          ^^ keyword.operator.comparison.fasmg
;                                      ^ keyword.operator.comparison.fasmg
;                                             ^ keyword.operator.word.fasmg
;                                                            ^ keyword.operator.word.fasmg
;                                                                            ^ keyword.operator.word.fasmg

macro null
; <- keyword.declaration.macro.fasmg
;     ^ entity.name.macro.fasmg
        esc db 0
;       ^ keyword.other.fasmg
        esc outscope db 0
;           ^ keyword.other.fasmg
end macro
;   ^ keyword.declaration.macro.fasmg

macro lower name,value
; <- keyword.declaration.macro.fasmg
;     ^ entity.name.macro.fasmg
        name = value and 0FFh
end macro

purge lower
; <- keyword.other.fasmg
;     ^ variable.function.fasmg

struc lower name,value
; <- keyword.declaration.struct.fasmg
;     ^ entity.name.struct.fasmg
        name = value and 0FFh
end struc
;   ^ keyword.declaration.struct.fasmg

restruc lower
; <- keyword.other.fasmg
;       ^ variable.function.fasmg

variable equ 1
; <- variable.other.fasmg
;        ^ keyword.operator.assignment.fasmg
;            ^ constant.numeric.integer.decimal.fasmg

variable reequ 1
; <- variable.other.fasmg
;        ^ keyword.operator.assignment.fasmg
;              ^ constant.numeric.integer.decimal.fasmg

define var2 1
; <- keyword.declaration.variable.fasmg
;      ^ variable.other.fasmg

redefine var2 1
; <- keyword.declaration.variable.fasmg
;        ^ variable.other.fasmg

repeat 1
; <- keyword.control.fasmg
end repeat
;   ^ keyword.control.fasmg

rept 1
; <- keyword.control.fasmg
end rept
;   ^ keyword.control.fasmg

while 1 <> 1
; <- keyword.control.fasmg
;       ^ keyword.operator.comparison.fasmg
        db %, %%
;          ^ variable.parameter.fasmg
;             ^ variable.parameter.fasmg
        break
;       ^ keyword.control.fasmg
end while
;   ^ keyword.control.fasmg

iterate value, 1,2,3
; <- keyword.control.fasmg
end iterate
;   ^ keyword.control.fasmg

irp value, 1,2,3
; <- keyword.control.fasmg
        indx 1+%%-%
;       ^ keyword.control.fasmg
end irp
;   ^ keyword.control.fasmg

irpv param, var
; <- keyword.control.fasmg
        db param
end irpv
;   ^ keyword.control.fasmg

match +,+
; <- keyword.control.conditional.fasmg
end match
;   ^ keyword.control.conditional.fasmg

rawmatch +,+
; <- keyword.control.conditional.fasmg
end rawmatch
;   ^ keyword.control.conditional.fasmg

rmatch +,+
; <- keyword.control.conditional.fasmg
end rmatch
;   ^ keyword.control.conditional.fasmg

org 100h
; <- keyword.other.fasmg

section 100h
; <- keyword.other.fasmg

dw $, $@, $%, $%%
;  ^ variable.language.fasmg
;     ^^ variable.language.fasmg
;         ^^ variable.language.fasmg
;             ^^^ variable.language.fasmg

virtual
; <- keyword.control.fasmg
end virtual
;   ^ keyword.control.fasmg

virtual at 0
; <- keyword.control.fasmg
;       ^ keyword.other.fasmg
        db 0
        load f:1 from 0
;       ^ keyword.other.fasmg
;                ^ keyword.other.fasmg
        store 1:1 at 0
;       ^ keyword.other.fasmg
;                 ^ keyword.other.fasmg
        dbl_label::
;       ^ entity.name.label.fasmg
;                ^^ punctuation.separator.fasmg
end virtual
;   ^ keyword.control.fasmg

if 0
        include 'file.asm'
;       ^ keyword.control.import.fasmg
        err 'huh'
;       ^ keyword.other.fasmg
end if

eval ''
; <- keyword.other.fasmg

display 'hi'
; <- keyword.other.fasmg

dd __time__, __file__, __line__, __source__
;  ^ variable.language.fasmg
;            ^ variable.language.fasmg
;                      ^ variable.language.fasmg
;                                ^ variable.language.fasmg

retaincomments
removecomments
; <- keyword.other.fasmg

db \
1

isolatelines
; <- keyword.other.fasmg

