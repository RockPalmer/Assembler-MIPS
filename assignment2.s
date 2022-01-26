###########################################################
# Assignment #: 2
#  Name: Rock Palmer
#  ASU email: rtpalmer@asu.edu
#  Course: CSE/EEE230, T/Th 1:30-2:45pm
#  Description: loads addresses of variables or values of variables into registers.
#            -performs arithmetic and logical operations on variables
#            -uses syscall operations to display integers and strings on the console window
###########################################################
                    .data
num1:               .word 69482
num2:               .word 0xBC7
msg1:               .asciiz "num1 is: "
msg2:               .asciiz "\nnum2 is: "
msg3:               .asciiz "\nnum1+num2 = "
msg4:               .asciiz "\nnum1-num2 = "
                    .text
                    .globl main
main:
    la              $a0, msg1       # load "num1 is: "
    li              $v0, 4          # set print_string()
    syscall                         # print "num 1 is: "
    lw              $t0, num1       # store 69482 into $t0
    move            $a0, $t0        # move 69482 to $a0
    li              $v0, 1          # set print_int()
    syscall                         # print 69482
    la              $a0, msg2       # load "\nnum 2 is: "
    li              $v0, 4          # set to print_string()
    syscall                         #
    lw              $t1, num2       # store 0xBC7 into $t1
    move            $a0, $t1        #
    li              $v0, 1          #
    syscall                         # print 0xBC7 as decimal
    add             $t2, $t0, $t1   # $t2 = 69482 + 0xBC7
    sub             $t3, $t0, $t1   # $t3 = 69482 - 0xBC7
    la              $a0, msg3       #
    li              $v0, 4          #
    syscall                         # print "\nnum1+num2 = "
    move            $a0, $t2        #
    li              $v0, 1          #
    syscall                         # print sum of 69482 and 0xBC7
    la              $a0, msg4       #
    li              $v0, 4          #
    syscall                         # print "\nnum1-num2 = "
    move            $a0, $t3        #
    li              $v0, 1          #
    syscall                         # print difference of 69482 and 0xBC7
    jr              $ra             #return
