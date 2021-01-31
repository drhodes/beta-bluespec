
MOD=$(cat module-name)

while true; do    
    inotifywait -m -e modify ./$MOD.bsv ./Tb$MOD.bsv | make test
done
