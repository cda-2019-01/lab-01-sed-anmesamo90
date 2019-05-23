# Escriba su código aquí


# cambia "/" por "-"
tr '/' '-' <data.csv > data1.csv

# cambia "N" por "\N"
sed 's/;N/;\\N/g' data1.csv > data2.csv

# rellena los "" por "\N"
sed 's/;;/;\\N;/g' data2.csv > data3.csv

# agrega el "20" al año, ej. 2013
sed 's/-\([0-9][0-9];\)/-20\1/' data3.csv > data4.csv

# cambia DD/MM/AAAA por AAA\MM\DD
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/' data4.csv > data5.csv

# cambia ";" por ","
sed 's/;/,/g' data5.csv > data6.csv

# revisa que los números con decimales sean con "." y no con ","
sed 's/,\([0-9][0-9][0-9]\),/,\1./' data6.csv > data7.csv

# rellena los campos vacíos a la derecha con "\N"
sed 's/[,]$/,\\N/g' data7.csv > data8.csv

# elimina las columnas que contengan \N
sed -e '/\N/d' data8.csv > data9.csv

