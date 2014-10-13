#Generate automata and test for the group's members' birthdays (17/06/1992 and 18/06/1992)
#Generating all the transducers
fsmcompile -i data.syms -o data.syms -t < Txts/units.txt > FSMs/units.fsm;
fsmcompile -i data.syms -o data.syms -t < Txts/dozens.txt > FSMs/dozens.fsm;
fsmcompile -i data.syms -o data.syms -t < Txts/hundreds.txt > FSMs/hundreds.fsm;
fsmcompile -i data.syms -o data.syms -t < Txts/thousands.txt > FSMs/thousands.fsm;
fsmcompile -i data.syms -o data.syms -t < Txts/romantoarab.txt > FSMs/romantoarab.fsm;
fsmcompile -i data.syms -o data.syms -t < Txts/bar.txt > FSMs/bar.fsm;
cd FSMs/;
fsminvert romantoarab.fsm > arabtoroman.fsm;
fsmconcat dozens.fsm units.fsm > twodigits.fsm;
fsmconcat hundreds.fsm twodigits.fsm > threedigits.fsm;
fsmconcat thousands.fsm threedigits.fsm > fourdigits.fsm;
fsmconcat twodigits.fsm bar.fsm twodigits.fsm bar.fsm fourdigits.fsm > romantoarabdates.fsm;
fsminvert romantoarabdates.fsm > arabtoromandates.fsm;
fsmunion fourdigits.fsm threedigits.fsm twodigits.fsm units.fsm > composedromantoarab.fsm;

#Print all transducers
for filefsm in *.fsm
do
fsmdraw -i ../data.syms -o ../data.syms < $filefsm | dot -Tps > ../Pictures/$filefsm;
mv ../Pictures/$filefsm `echo $filefsm | sed -r 's/(.*\.)fsm/..\/Pictures\/\1ps/'`;
done

#Move the final 4 transducers
cd ../Pictures/;
cp romantoarab.ps ../TransdutoresFinais/romantoarab.ps;
cp arabtoroman.ps ../TransdutoresFinais/arabtoroman.ps;
cp romantoarabdates.ps ../TransdutoresFinais/romantoarabdates.ps;
cp arabtoromandates.ps ../TransdutoresFinais/arabtoromandates.ps;

#Generating all the tests and the results
cd ../Tests/;
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

fsmcompile -i ../data.syms -o ../data.syms -t < test4.txt > test4.fsm;
fsmcompose test4.fsm ../FSMs/romantoarabdates.fsm > final4.fsm;
fsmrmepsilon final4.fsm > result4romantoarab.fsm;
rm test4.fsm;
rm final4.fsm;
fsmdraw -i ../data.syms -o ../data.syms < result4romantoarab.fsm | dot -Tps > result4romantoarab.ps;
