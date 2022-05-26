import strutils
import os

proc fuck(code: string) =
    var arr: seq[int] = @[0]
    var pointerLocation: int = 0
    var i: int = 0
    while i < code.len():
        if code[i] == '<':
            if pointerLocation > 0:
                pointerLocation -= 1
        elif code[i] == '>':
            pointerLocation += 1
            if arr.len() <= pointerLocation:
                arr.add(0)
        elif code[i] == '+':
            arr[pointerLocation] += 1
        elif code[i] == '-':
            if arr[pointerLocation] > 0:
                arr[pointerLocation] -= 1
        elif code[i] == '.':
            stdout.write(arr[pointerLocation])
        elif code[i] == ',':
            var x: int = parseInt(readLine(stdin))
            arr[pointerLocation] = x
        elif code[i] == '[':
            if arr[pointerLocation] == 0:
                var open_braces = 1
                while open_braces > 0:
                    i += 1
                    if code[i] == '[':
                        open_braces += 1
                    elif code[i] == ']':
                        open_braces -= 1
        elif code[i] == ']':
            var open_braces = 1
            while open_braces > 0:
                i -= 1
                if code[i] == '[':
                    open_braces -= 1
                elif code[i] == ']':
                    open_braces += 1
            i -= 1
        i += 1

try:
    when declared(paramStr):
        var filename = readFile(paramStr(1))
        if paramStr(1).endsWith(".bf") == true:
            fuck(filename)
        else:
            echo "This is not a Brainf**k file :P"
except IOError:
    echo "bruh! This file does not exist!"
except IndexDefect:
    echo "Brainduck, a Brainf**k interpreter written in nim."
#fin.