# Usa la imagen base de Python
FROM python:3.12

# Establece el directorio de trabajo en el contenedor
WORKDIR /app/

# Copia el archivo requirements.txt al contenedor
COPY requirements.txt .

# Instala las dependencias listadas en requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos de la aplicación al directorio de trabajo
COPY . /app/.

# Especifica el comando por defecto para ejecutar el programa
CMD ["python", "main.py"]

