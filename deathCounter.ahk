#Requires AutoHotkey v2.0
#SingleInstance

counterFile := A_ScriptDir "\deathCounter.txt"

; Ensure the counter file exists and initialize to "Deaths: 0" if it doesn't
if !FileExist(counterFile) {
    FileAppend("Deaths: 0", counterFile)
}

; Function to read the current counter value
readCounter() {
    global counterFile
    content := FileRead(counterFile)
    counter := RegExReplace(content, ".*?(\d+).*", "$1")
    return counter
}

; Function to write the counter value, preserving the text
writeCounter(value) {
    global counterFile
    content := FileRead(counterFile)
    newContent := RegExReplace(content, "(\d+)", value)
    FileDelete(counterFile) ; Delete the old file to avoid appending
    FileAppend(newContent, counterFile)
}

; Function to increment the counter
incrementCounter() {
    counter := readCounter()
    counter++
    writeCounter(counter)
    ;ToolTip("Counter: " counter) ; Display current counter value as a tooltip
    SetTimer(ToolTipOff, 1000)
}

; Function to decrement the counter, ensuring it does not go below zero
decrementCounter() {
    counter := readCounter()
    if counter > 0 {
        counter--
        writeCounter(counter)
        ;ToolTip("Counter: " counter) ; Display current counter value as a tooltip
    } else {
        ;ToolTip("Counter is already at 0 and cannot be decremented further.")
    }
    SetTimer(ToolTipOff, 1000)
}

; Function to reset the counter to zero
resetCounter() {
    writeCounter(0)
    ;ToolTip("Counter reset to 0") ; Display reset notification as a tooltip
    SetTimer(ToolTipOff, 1000)
}

; Timer to turn off the tooltip
ToolTipOff() {
    ToolTip("")
}

; Hotkey for incrementing
+::incrementCounter()

; Hotkey for decrementing
-::decrementCounter()

; Hotkey for resetting
*::resetCounter()

; Hotkey for exiting the script
Esc::ExitApp
