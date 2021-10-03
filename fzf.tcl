proc fzf inlist {
    set chan [file tempfile filename]

    foreach arg $inlist {
        puts $arg
        puts $chan $arg
    }
    close $chan

    set res [exec 2>@stderr cat $filename | fzf]

    file delete $filename
    return $res
}
