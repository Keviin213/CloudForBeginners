#!/bin/bash

# Azure Storage Account details
STORAGE_ACCOUNT_NAME="cloudforbeginners"
STORAGE_ACCOUNT_CONTAINER="cloudforbeginners"
STORAGE_ACCOUNT_KEY="IXEUV7MEzsHpMNJrOhoDVZnjdFUOHrz53VOiOZLcPPFbVJNr/rJ2IuBTjZHEb6TbhgDP1vF4ejmR+AStE+MsoQ=="

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file-to-upload>"
    exit 1
fi

FILE_TO_UPLOAD=$1

# Check if the file exists
if [ ! -f "$FILE_TO_UPLOAD" ]; then
    echo "File not found: $FILE_TO_UPLOAD"
    exit 1
fi

# Upload the file to Azure Blob Storage
az storage blob upload \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_ACCOUNT_KEY \
    --container-name $STORAGE_ACCOUNT_CONTAINER \
    --file $FILE_TO_UPLOAD \
    --name $(basename $FILE_TO_UPLOAD)

if [ $? -eq 0 ]; then
    echo "File uploaded successfully to $STORAGE_ACCOUNT_CONTAINER/$FILE_TO_UPLOAD"
else
    echo "Failed to upload file"
    exit 1
fi
