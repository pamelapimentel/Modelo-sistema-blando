import json
import zipfile
import os


api_token = {"username":"pamepimentel","key":"77158af729f3776d09b8f8d6ef075f19"}

##conectar a kaggle con token
with open('C:/Users/USER/.kaggle/kaggle.json', 'w') as file:
    json.dump(api_token, file)

##determinar ruta de dataset
location = "C:/Users/USER/Downloads/pipeline/dataset"

##validar que la carpeta exista
if not os.path.exists(location):
    os.makedirs(location)
else:
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name))
        for name in dirs:
            os.rmdir(os.path.join(root, name))

##se genera descarga de dataset desde plataforma KAGGLE
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/USER/Downloads/pipeline/dataset")

##vamos a carpeta con archivo.zip y lo descomprimimos
os.chdir('C:/Users/USER/Downloads/pipeline/dataset')
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file, 'r')
    zip_ref.extractall()
    zip_ref.close()