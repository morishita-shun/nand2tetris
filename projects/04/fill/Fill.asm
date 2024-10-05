// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

    @8192
    D=A
    @number_of_pixel
    M=D

    @R0
    M=0
(LOOP)
    @KBD
    D=M
    @KEY_PUSHED
    D;JNE
(KEY_NOT_PUSHED)
    @R1
    M=0
    @CHECK_STATE_CHANGE
    0;JMP
(KEY_PUSHED)
    @R1
    M=1
(CHECK_STATE_CHANGE)
    @R0
    D=M
    @R1
    D=D-M
    @LOOP
    D;JEQ
    @i
    M=0
    @R1
    M=D
    @EMPTY_SCREEN_LOOP
    D;JEQ
(FILL_SCREEN_LOOP)
    @i
    D=M
    @number_of_pixel
    D=M-D
    @LOOP
    D;JLT
    @SCREEN
    A=A+D
    M=-1
    @i
    MD=M+1
    @FILL_SCREEN_LOOP
    0;JMP
(EMPTY_SCREEN_LOOP)
    @i
    D=M
    @number_of_pixel
    D=M-D
    @LOOP
    D;JLT
    @SCREEN
    A=A+D
    M=0
    @i
    MD=M+1
    @EMPTY_SCREEN_LOOP
    0;JMP