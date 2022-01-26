###########################################################
# Assignment #: 3
#  Name: Rock Palmer
#  ASU email: rtpalmer@asu.edu
#  Course: CSE/EEE230, T/Th 1:30-2:45pm
#  Description: -write a MIPS assembly language program to:
#               -perform arithmetic and logical operations on variables
#               -use syscall operations to display integers and strings on the console window
#               -use syscall operations to read integers from the keyboard.
###########################################################
                    .data
msg1:               .asciiz "Enter a value:\n"
msg2:               .asciiz "Enter another value:\n"
msg3:               .asciiz "Enter one more value:\n"
msg4:               .asciiz "\nnum2+num4="
msg5:               .asciiz "\nnum4-num1="
msg6:               .asciiz "\nnum2*num3="
msg7:               .asciiz "\nnum1/num4="
msg8:               .asciiz "\nnum4 mod num3="
msg9:               .asciiz "\n((num3 / num2) - 7) * (num4 mod num1)="

                    .text
                    .globl main
main:
    la      $a0, msg1
    li      $v0, 4
    syscall                 # print "Enter a value:\n"
    li      $v0, 5
    syscall                 # read in value
    move    $t0, $v0
    la      $a0, msg2
    li      $v0, 4
    syscall                 # print "Enter another value:\n"
    li      $v0, 5
    syscall                 # read in value
    move    $t1, $v0
    la      $a0, msg3
    li      $v0, 4
    syscall                 #  print "Enter one more value:\n"
    li      $v0, 5
    syscall                 # read in value
    move    $t2, $v0
    li      $v0, 4
    syscall                 # print "Enter one more value:\n" again
    li      $v0, 5
    syscall                 # read in value
    move    $t3, $v0
    li      $v0, 4
    la      $a0, msg4
    syscall                 # print "\n\nnum2+num4="
    add     $t4, $t1, $t3
    move    $a0, $t4
    li      $v0, 1
    syscall                 # print $t1 + $t3
    li      $v0, 4
    la      $a0, msg5
    syscall                 # print "\nnum4-num1="
    sub     $t4, $t3, $t0
    move    $a0, $t4
    li      $v0, 1
    syscall                 # print $t3 - $t0
    li      $v0, 4
    la      $a0, msg6
    syscall                 # print "\nnum2*num3="
    mult    $t1, $t2
    mflo    $t4
    li      $v0, 1
    move    $a0, $t4
    syscall                 # print $t1 * $t2
    li      $v0, 4
    la      $a0, msg7
    syscall                 # print "\nnum1/num4="
    div     $t0, $t3
    mflo    $t4
    li      $v0, 1
    move    $a0, $t4
    syscall                 # print $t0 / $t3
    li      $v0, 4
    la      $a0, msg8
    syscall                 # print "\nnum4 mod num3="
    div     $t3, $t2
    mfhi    $t4
    li      $v0, 1
    move    $a0, $t4
    syscall                 # print $t3 % $t2
    li      $v0, 4
    la      $a0, msg9
    syscall                 # print "\n((num3 / num2) - 7) * (num4 mod num1)="
    div     $t2, $t1
    mflo    $t4
    addi    $t4, $t4, -7
    div     $t3, $t0
    mfhi    $t5
    mult    $t4, $t5
    mflo    $t4
    li      $v0, 1
    move    $a0, $t4
    syscall                 # print (($t2 / $t1) - 7) * ($t3 mod $t0)
    jr      $ra
