# C64 asm V1.0
By Jean-Yves Oberlé

C64 asm is an assembler program for Commodore 64 written in COMMODORE 64 BASIC language.
It does not need any floppy disk drive to work.
Everything is located in memory: the assembler, the source code to assemble and the resulting machine code.
It has the particularity to use the Commodore 64 BASIC editor to store the source code. 

You will find here a demo of C64 asm: [https://youtu.be/Cm87bmoTSmQ](https://youtu.be/Cm87bmoTSmQ).

## Contents

- [c64asm.bas](c64asm.bas) is the assembler program written in COMMODORE 64 BASIC language

- [c64asm.t64](c64asm.t64) is the same program in tape format (it can be loaded with the LOAD command)

- [c64asm_commented.bas](c64asm_commented.bas) is the same program with comments

- [asmex.asm](asmex.asm) is an example of assembly source code which we will assemble in the Usage Instructions section

- [asmex.t64](asmex.t64) is the same example in tape format (it can be loaded with the LOAD command)

## Background

I wrote C64 asm 32 years ago! I was a teenager at that time. I couldn't share it with anybody in the 80s but now, with the magic of the Internet, it will be accessible to all human beings :-) 
As floppy disk drives were too expensive for me at that time (I had only a [datassette](https://www.c64-wiki.com/wiki/Datassette)), I designed this program so that everything resides in memory: the program itself obviously, the source code to assemble and the resulting machine code.
This program also has the particularity to use the Commodore 64 BASIC editor to store the source code.
For this reason, it will be necessary to modify the BASIC pointers (in 43 and following addresses) to switch between the source code and the program, as detailed in the Usage Instructions section.

All mnemonics of the 6502 processor are supported (you can find them on this [page](http://www.6502.org/tutorials/6502opcodes.html)).
Some mnemonics had to be shortened because they contain a BASIC keyword (and, or). Thus:
- and becomes ad
- eor becomes er
- ora becomes oa
- ror becomes rr

The reason is that, since we are using the BASIC editor for the assembly code, and, eor, ora and ror mnemonics would have been translated (at least partially) into tokens.
For example, "and" would have been translated into 175 (or $AF) instead of its ASCII equivalent sequence 65, 78, 68 (or $41, $4E, $44).
You will find more details about Commodore 64 BASIC tokens on this [page](https://www.c64-wiki.com/wiki/BASIC_token).

Labels and variables are also supported by my program. An example for each is given in the assembly source code.

## Usage Instructions

Just follow the below steps to compile and run the assembly source code. I suppose that you will be using the [Vice emulator](https://vice-emu.sourceforge.io/).
All commands are in lower case so that they just can be pasted in Vice (where they will appear in upper case).

### Load the assembly source code or copy&paste it

To load the assembly source code:

```
In Vice, attach the file asmex.t64 with the menu File->Attach tape image... 
Type the keyword LOAD and once you see the message "PRESS PLAY ON TAPE", select the menu File->Datassette control->Start
After a few seconds, you will see the message "FOUND ASMEX"; press then the SPACE BAR or wait a few seconds
```

or to copy&paste it:

```
Open asmex.bas in your favorite editor and copy it
In Vice emulator, select Edit->Paste
```

### Change BASIC pointers for the program 

Type or copy&paste using Vice menu Edit->Paste:

```
poke 44,16:sys42291:poke46,peek(35):poke45,peek(781)+2:clr:new
```

With the first above command (poke 44,16), we move the area where the Commodore 64 stores the BASIC programs to 1 + 16*256 = 4097 (the address 43 contains the value 1 which we keep as is).
The other instructions update automatically the other BASIC pointers so that the Commodore 64 does not get lost.
You can find more details about the Commodore 64 memory map [here](http://sta.c64.org/cbm64mem.html).

### Load the program or copy&paste it

To load the program:

```
In Vice, attach the file c64asm.t64 with the menu File->Attach tape image...
Type the keyword LOAD and once you see the message "PRESS PLAY ON TAPE", select the menu File->Datassette control->Start
After a few seconds, you will see the message "FOUND C64ASM"; press then the SPACE BAR or wait a few seconds
To speed up the load (which is very slow), you can switch to the Warp mode using Alt+W
```

or to copy&paste it:

```
Open c64asm.bas in you favorite editor and copy it
In Vice emulator, select Edit->Paste
To speed up the paste (which is long), you can switch to the Warp mode using using Alt+W
```

At this stage, we have the BASIC program starting at address 4097 and the assembly source code at address 2049
(before we modified the content of address 44, it was 8, hence 1+8*256 = 2049).
The BASIC program expects the assembly source code to start at address 2049.

### Launch the assembly

This is the last step. Just type (you can stay in Warp mode):

```
run
```

Once the assembly is completed, you should see the message END OF ASSEMBLY PHASE.

### Execute the assembled machine code

The machine code is located at the address 49152 (or $C000) due to the directive "*=$c000" used in the assembly source code.
To execute this code, just type:

```
sys 49152
```

and you will see, guess what? HELLO WORLD

### Modify the assembly source code and reassemble it

If you wish to modify the assembly source code, you will have to switch the BASIC pointers:

```
poke 44,8:sys42291:poke46,peek(35):poke45,peek(781)+2:clr
```

At this point, you can see the assembly source code using the LIST instruction and modify it by typing a line number followed by a mnmemonic.
But nowadays, it will be more practical to modify your assembly source code directly in your favorite editor and then paste it in the Vice emulator.
For this purpose, you can use the NEW instruction to delete the old source code before you paste the new one.
You will find more details about the Commodore 64 BASIC instructions on this [page](https://www.c64-wiki.com/wiki/C64-Commands).
Once you are satisfied with your assembly source code, you will have to switch back to the BASIC program in order to reassemble your new code:

```
poke 44,16:sys42291:poke46,peek(35):poke45,peek(781)+2:clr
run
```

You can then execute the new code:

```
sys 49152
```

If you still want to modify your source code, you will have to switch again to it, still using:

```
poke 44,8:sys42291:poke46,peek(35):poke45,peek(781)+2:clr
```

And after you modified it, switch to the BASIC program to assemble it:

```
poke 44,16:sys42291:poke46,peek(35):poke45,peek(781)+2:clr
run
```

And so on.

## Conclusion

At this stage, you have at least executed the original assembly source code. If you want to improve the BASIC program, feel free to clone this project.
There's probably room for improvement (remember that I wrote this program when I was a teenager!).
As a starting point, you can have a look at the [c64asm_commented.bas](c64asm_commented.bas) file.

## License

This project is released under the MIT license. See the bundled LICENSE file for details.
