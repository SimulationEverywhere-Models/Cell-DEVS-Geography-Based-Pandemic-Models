Cell-DEVS Geography Based Pandemic Models
===
Overview
----

Two modified implementations of the Zhong model. The original model that this implementation is based off of can be obtained at:


https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7088542/pdf/11430_2009_Article_44.pdf

These implementations add additional features to more closely model the real world. See the documentation for more information.

This folder contains two seperate models : a geographical SIRDS, and a geographical SEIRDS. The geographical SEIRDS is an extension of the SIRDS.

Documentation
----

See the `Manual.docx` file located in each project's root folder, the Requirements section of this readme, and the Ubuntu 20 install guide within this readme.

Requirements
---

* A C++17 compiler (GCC was used for development)

* A copy of this repository

* A copy of Cadmium with JSON input support, available at https://github.com/SimulationEverywhere/cadmium/tree/celldevs-json

  To get the aforementioned copy of cadmium with JSON support, the following commands can be used:
  
  1. git clone https://github.com/SimulationEverywhere/cadmium.git --single-branch --branch celldevs-json
  
  2. cd cadmium
  
  3. git submodule update --init --recursive
  
  **The above commands will change once the branched clone from, celldevs-json, is merged into master in its repository.
  Afterwards, the first command should be replaced with `git clone https://github.com/SimulationEverywhere/cadmium.git`**

  The dependencies for cadmium must also be installed. Refer to the document located at:
   http://www.sce.carleton.ca/courses/sysc-5104/lib/exe/fetch.php?media=cadmium.pdf

  The location of cadmium must be in the parent folder that holds this project.
  For example, if the location of this cloned repository has the location of parentFolder/GeographicalModel, then the cadmium library
  must be located in parentFolder.

* Python 3 packages geopandas, numpy, matplotlib

---
**Ubuntu 20 Install Guide**
- Assuming a fresh install of Ubuntu 20, the following steps will install and run the two models in this project.

**Install Cadmium Dependencies:**
1. ```sudo apt-get install libboost-all-dev```

2. ```sudo apt install build-essential```

3. ```sudo apt-get install git```

4. ```sudo apt-get install cmake```

**Install Cadmium JSON in ~/CADMIUM:**

1. ```cd ~```

2. ```mkdir CADMIUM```

3. ```cd CADMIUM```

4. ```git clone https://github.com/SimulationEverywhere/cadmium.git --single-branch --branch celldevs-json```

5. ```cd cadmium```

6. ```git submodule update --init --recursive```

**Download Anaconda and create geographical environment:**

This project uses several python scripts that are dependent on the libraries: geopandas, numpy, and matplotlib. geopandas requires specific versions of many dependent libraries and installing them manually is difficult. The easiest way to download the right packages is to use conda. It is also recommended to install these packages in a seperate conda environment. Attemping to install in conda base may fail.

1. https://www.anaconda.com/products/individual

2. select 64-Bit (x86) Installer (Linux)

3. run the .sh installer, recommended default settings

4. open a terminal and activate conda if not already active

5. ```conda create --name geo_env``` 

6. ```conda activate geo_env```

7. ```conda install geopandas numpy matplotlib ```

**Installing Project and Compiling**

The project folders must be in a specific location relative to the folder "cadmium"

1. Copy the model folders GeographicalSEIRDS and GeographicalSIRDS into folder ~/CADMIUM

2. Open a terminal in the root directory of each project, run cmake and make by:
	- ```cmake "CMakeLists.txt"```
	- ```make```
	- When running cmake the terminal will say Cadmium not found, but this can be ignored, cmake will search in an addtional place and find it.

**Running Scenarios with the Models**

Several scenarios are included in the project folders, and further scenarios may by run. To run the predefined scenarios, open a terminal and enter: 
1. Edit the location of geographical the geographical data in the generate_cadmium_json.py scripts located in ProjectRoot/Scripts/Input_Generator
   The scripts should looks for the geographical data at ProjectRoot/geodata
   
   Two lines need to be edited in each of the 3 seperate scenario scripts:
   df = pd.read_csv("/home/<user>/CADMIUM/Cadmium-JSON/GeographicalSEIRDS/geodata/DA Ottawa Clean.csv")  # General information (id, population, area...)
   df_adj = pd.read_csv("/home/<user>/CADMIUM/Cadmium-JSON/GeographicalSEIRDS/geodata/DA Ottawa Adjacency.csv")  # Pair of adjacent territories
   
1. ```cd ~/CADMIUM/<ProjectRoot>/runScenarios``` where ProjectRoot is either GeographicalSEIRDS or GeographicalSIRDS. 

2. ```conda activate geo_env```

3. ```bash <runScenario.sh>``` where runScenario is one of available scenarios in each runScenario directory
4. View the resulting graphs in ProjectRoot/logs

Each scenario will generate a JSON for Cadmium to represent a cell space. The project is currently using the Dissemination Areas/Population of Ottawa for geographical data. The JSON is copied to ParentRoot/config, and then the pandemic model is run from ParentRoot/bin. When the simulation completes, the log files are used to generate graphs to represent the simulation data, which are then saved to the logs folder. Running a scenario will overwrite the previous contents of the logs folder. The available scenarios for each project are:

The JSON input for other scenarios can be generated using the script found in ProjectRoot/Scripts/Input_Generator/

The graph generation script to produce graphs from logs is located at ProjectRoot/Scripts/Graph_Generator/

