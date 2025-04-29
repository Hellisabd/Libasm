define show
    printf "\n--- Affichage des chaînes pointées par les registres ---\n"
    printf "🡺 rax: "
    x/s $rax
    printf "🡺 rdi: "
    x/s $rdi
    printf "🡺 rsi: "
    x/s $rsi
    printf "🡺 rdx: "
    x/s $rdx
    printf "🡺 rcx: "
    x/s $rcx
    printf "🡺 r8 : "
    x/s $r8
    printf "🡺 r9 : "
    x/s $r9
    printf "🡺 rbx: "
    x/s $rbx
    printf "🡺 rsp: "
    x/s $rsp
    printf "🡺 rbp: "
    x/s $rbp
    printf "🡺 r10: "
    x/s $r10
    printf "🡺 r11: "
    x/s $r11
    printf "🡺 r12: "
    x/s $r12
    printf "🡺 r13: "
    x/s $r13
    printf "🡺 r14: "
    x/s $r14
    printf "🡺 r15: "
    x/s $r15
    printf "--- Fin ---\n\n"
end