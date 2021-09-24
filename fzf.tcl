proc fzf args {
    set chan [file tempfile filename]
    foreach arg $args {
        puts $chan $arg
    }
    close $chan
    # puts [exec cat $filename]
    file tempfile fzfoutput
    exec >@stdout 2>@stderr cat $filename | fzf > $fzfoutput
    set fd [open $fzfoutput "r"]
    set res [read $fd]
    puts "res $res"
    file delete $filename
    file delete $fzfoutput
    return $res
}
