#Generate automata and test for the group's members' birthdays (17/06/1992 and 18/06/1992)
cd Tests/;
fsmcompile -i ../data.syms -o ../data.syms -t < test1.txt > test1.fsm;
fsmcompose test1.fsm ../FSMs/arabtoromandates.fsm > final1.fsm;
fsmrmepsilon final1.fsm > result1arabtoroman.fsm;
rm test1.fsm;
rm final1.fsm;
fsmdraw -i ../data.syms -o ../data.syms < result1arabtoroman.fsm | dot -Tps > result1arabtoroman.ps;

fsmcompile -i ../data.syms -o ../data.syms -t < test2.txt > test2.fsm;
fsmcompose test2.fsm ../FSMs/arabtoromandates.fsm > final2.fsm;
fsmrmepsilon final2.fsm > result2arabtoroman.fsm;
rm test2.fsm;
rm final2.fsm;
fsmdraw -i ../data.syms -o ../data.syms < result2arabtoroman.fsm | dot -Tps > result2arabtoroman.ps;

fsmcompile -i ../data.syms -o ../data.syms -t < test3.txt > test3.fsm;
fsmcompose test3.fsm ../FSMs/arabtoromandates.fsm > final3.fsm;
fsmrmepsilon final3.fsm > result3arabtoroman.fsm;
rm test3.fsm;
rm final3.fsm;
fsmdraw -i ../data.syms -o ../data.syms < result3arabtoroman.fsm | dot -Tps > result3arabtoroman.ps;
