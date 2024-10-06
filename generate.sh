#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the template and output files
TEMPLATE_FILE="template.html"
OUTPUT_FILE="index.html"  # Output file set to index.html

# Check if the template file exists
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo "Error: Template file '$TEMPLATE_FILE' not found."
    exit 1
fi

# Prompt the user for the page title
read -p "Enter the title for your page: " PAGE_TITLE

# Prompt the user if they want to use default components
read -p "Do you want to use default components for sidebar, content, and footer? (y/n): " USE_DEFAULT

# Function to ensure default components exist
create_default_components() {
    for component in sidebarDefaultComponent.html contentDefaultComponent.html footerDefaultComponent.html; do
        if [[ ! -f "$component" ]]; then
            echo "Error: Default component '$component' does not exist. Please create it before proceeding."
            exit 1
        fi
    done
}

# Function to ensure regular components exist
ensure_regular_components() {
    for component in sidebarComponent.html contentComponent.html footerComponent.html; do
        if [[ ! -f "$component" ]]; then
            echo "Error: Regular component '$component' not found in the root directory."
            exit 1
        fi
    done
}

# Check components based on user choice
if [[ "$USE_DEFAULT" =~ ^[Yy]$ ]]; then
    create_default_components
elif [[ "$USE_DEFAULT" =~ ^[Nn]$ ]]; then
    ensure_regular_components
else
    echo "Invalid input. Please enter y or n."
    exit 1
fi

# Create or overwrite the output file
> "$OUTPUT_FILE"

# Initialize an array to store missing components
missing_components=()

# Read the template file line by line
while IFS= read -r line || [[ -n "$line" ]]; do
    # Replace the <title> tag with the user-provided title
    if [[ "$line" =~ \<title\>(.*)\<\/title\> ]]; then
        echo "Replacing <title> tag with user-provided title."
        line="<title>${PAGE_TITLE}</title>"
    fi

    # Use regex to find all placeholders in the line
    while [[ "$line" =~ \{\{([a-zA-Z0-9]+)\}\} ]]; do
        COMPONENT_ID="${BASH_REMATCH[1]}"

        # Determine which component file to use
        if [[ "$USE_DEFAULT" =~ ^[Yy]$ ]]; then
            COMPONENT_FILE="${COMPONENT_ID%Component}DefaultComponent.html"
        else
            COMPONENT_FILE="${COMPONENT_ID}.html"
        fi

        # Check if the component file exists
        if [[ -f "$COMPONENT_FILE" ]]; then
            echo "Processing component: $COMPONENT_ID"
            COMPONENT_CONTENT=$(<"$COMPONENT_FILE")
            line="${line/\{\{$COMPONENT_ID\}\}/$COMPONENT_CONTENT}"
            echo "Replaced {{${COMPONENT_ID}}} successfully."
        else
            echo "Warning: Component file '$COMPONENT_FILE' not found. Leaving placeholder unchanged."
            missing_components+=("$COMPONENT_ID")
            line="${line/\{\{$COMPONENT_ID\}\}/{{${COMPONENT_ID}}}}"
        fi
    done

    # Write the processed line to the output file
    echo "$line" >> "$OUTPUT_FILE"
done < "$TEMPLATE_FILE"

# Check for any missing components
if [[ ${#missing_components[@]} -gt 0 ]]; then
    echo "The following components were not found and left unchanged:"
    for missing in "${missing_components[@]}"; do
        echo "- {{${missing}}}"
    done
fi

echo "Template processing complete. Check '$OUTPUT_FILE'."
