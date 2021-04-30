# user is assumed to have already activated geo environment in conda
echo -e "\nGenerating JSON from geo data:\n"
cd ../Scripts/Input_Generator/lognSEIRDOttawa/
python generate_cadmium_json.py 
cp lognSEIRD.json ../../../config/ottawaConfigs

# user is assumed to have already complied, and the model executable is located in bin
echo -e "\nExecuting model:\n"
cd ../../../bin
ls
./pandemic-geographical_model ../config/ottawaConfigs/lognSEIRD.json 400
#rm ../logs/pan*
echo -e "\nGenerating graphs from logs:\n"
cd ../Scripts/Graph_Generator/
python graph_generator.py
