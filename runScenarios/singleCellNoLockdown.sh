# user is assumed to have already complied, and the model executable is located in bin
echo -e "\nExecuting model\n"
cd ../bin
ls
./pandemic-geographical_model ../config/singleCelledConfigs/NoLockdown.json 100
#rm ../logs/pan*
echo -e "\nGenerating graphs from logs\n"
cd ../Scripts/Graph_Generator/
python graph_generator.py

