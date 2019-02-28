; FizzBuzz in MASM assembly

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

include Irvine32.inc                ; Simplifies printing values to console

.data
; Null-terminated strings to print
fizz BYTE "Fizz",0
buzz BYTE "Buzz",0
; div does not accept immediate operands
three DWORD 3
five DWORD 5
; Flag to control the default case
divided BYTE ?

.code
main proc
    mov ecx,1                       ; Start at 1
    L1:
        mov divided,0               ; Reset flag
        mov eax,ecx                 ; Store current loop number in eax
        cdq                         ; Extend eax into edx:eax, for calling div
        div three                   ; Divide by 3, remainder is stored in edx
        test edx,edx                ; Check whether remainder == 0
        jnz NOTTHREE                ; Skip printing Fizz if remainder !=0
        
        mov divided,1               ; Set flag to avoid printing the current number
        mov edx,OFFSET fizz
        call WriteString            ; Print Fizz
    NOTTHREE:
        mov eax,ecx                 ; Store current loop number in eax
        cdq                         ; Extend eax into edx:eax, for calling div
        div five                    ; Divide by 5, remainder is stored in edx
        test edx,edx                ; Check whether remainder == 0
        jnz NOTFIVE                 ; Skip printing Buzz if remainder != 0
        
        mov divided,1               ; Set flag to avoid printing the current number
        mov edx,OFFSET buzz
        call WriteString            ; Print Buzz
    NOTFIVE:
        mov eax,DWORD PTR divided   ; Move flag to register
        test eax,eax                ; ZF is set if the flag is zero
        jnz SKIPNUMBER              ; Skip printing the number if Fizz and/or Buzz has been printed
        
        mov eax,ecx                 ; Store the number in eax
        call WriteDec               ; Print the number without a leading sign
    SKIPNUMBER:
        call Crlf                   ; Print a new line
        
        inc ecx                     ; Increment loop counter
        cmp ecx,101                 ; Check if the loop has been run 100 times
        jne L1                      ; Jump to beginning
        
        invoke ExitProcess,0
main endp
end main
