10 *=$c000          ; starting address of assembled code
20 chrout=$ffd2     ; routine in kernal to ouput one char on screen
30 jsr dispmsg      ; jump to subroutine dispmsg
40 rts              ; end of program
50 dispmsg lda #$48 ; load $48 in the accumulator
60 jsr chrout       ; print the equivalent ascii char on screen
70 lda #$45         ; do the same for the other chars
80 jsr chrout
90 lda #$4c
100 jsr chrout
110 lda #$4c
120 jsr chrout
130 lda #$4f
140 jsr chrout
150 lda #$20
160 jsr chrout
170 lda #$57
180 jsr chrout
190 lda #$4f
200 jsr chrout
210 lda #$52
220 jsr chrout
230 lda #$4c
240 jsr chrout
250 lda #$44
260 jsr chrout
270 lda #$0d
280 jsr chrout
290 rts             ; end of subroutine

