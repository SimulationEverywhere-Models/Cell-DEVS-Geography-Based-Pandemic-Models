# user is assumed to have already activated geo environment in conda
echo -e "\nGenerating JSON from geo data:\n"
cd ../Scripts/Input_Generator/lognSEIRDOttawaAllSus/
python generate_cadmium_json.py 
cp lognSEIRDAllSus.json ../../../config/ottawaConfigs
