## Gene annotation of contigs with humann 3
```
#first rename all fasta files by the sample name
extension=".fa"
directory="./"
#direcoty can be more compicated if you want to do multiple studies

# Iterate over each subdirectory in the specified directory
for folder in "$directory"/*; do
    # Check if the item is a directory
    if [[ -d "$folder" ]]; then
        # Get the folder name
        foldername=$(basename "$folder")
        
        # Search for files with the specified extension in the folder
        files=$(find "$folder" -type f -name "*$extension")
        
        # Iterate over each file found
        while IFS= read -r file; do
            # Get the file name
            filename=$(basename "$file")
            
            # Construct the new file name with the folder name as a prefix
            new_filename="${foldername}_${filename}"
            
            # Rename the file
            mv "$file" "$(dirname "$file")/$new_filename"
            
            echo "Renamed $file to $new_filename"
        done <<< "$files"
    fi
done

###move all contigs to the same folder
#need to run full set of scrpits for each study folder
mkdir metagenome_contigs

# Specify the source directory path
source_directory="./"

# Specify the destination directory path
destination_directory="/hpcstor6/scratch01/p/patrick.kearns/metagenome_contigs"

# Specify the file extension to search for
extension="final.contigs.fa"

# Search for files with the specified extension in the source directory
files=$(find "$source_directory" -type f -name "*$extension")

# Iterate over each file found
while IFS= read -r file; do
    # Get the file name
    filename=$(basename "$file")
    
    # Copy the file to the destination directory
    cp "$file" "$destination_directory/$filename"
    
    echo "Copied $file to $destination_directory/$filename"
done <<< "$files"

#this also copies intermediate files, so remove those
cd /hpcstor6/scratch01/p/patrick.kearns/metagenome_contigs

# Specify the directory path
directory="./"

# Specify the pattern to preserve
pattern="*final.contigs.fa"

# Change to the directory
cd "$directory" || exit

# Remove all files that do not match the pattern
for file in *; do
    if [[ "$file" != $pattern ]]; then
        rm "$file"
        echo "Removed $file"
    fi
done

#get the kmer files too
rm *k*
```

## Run humann3 to call genes for each sample
```
#get databases
conda activate metaphlan
/hpcstor6/scratch01/p/patrick.kearns/metagenome_contigs
humann_databases --download chocophlan full $HOME --update-config yes
humann_databases --download uniref uniref90_diamond $HOME --update-config yes
humann_databases --download utility_mapping full $HOME --update-config yes

for i in *.fa
do
humann3 -i $i -o $i --threads 48 
done


#join tables for each study
humann_join_tables
```
