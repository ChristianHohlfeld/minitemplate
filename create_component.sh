#!/bin/bash

# Script to create a new component file in the root directory
# Usage: ./create_component.sh ComponentName

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage
usage() {
    echo "Usage: $0 ComponentName"
    echo "Example: $0 footerComponent"
    exit 1
}

# Check if a component name is provided
if [[ $# -ne 1 ]]; then
    usage
fi

COMPONENT_NAME="$1"

# Validate component name (alphanumeric and underscores)
if [[ ! "$COMPONENT_NAME" =~ ^[a-zA-Z0-9_]+$ ]]; then
    echo "Error: Component name must be alphanumeric with underscores only."
    exit 1
fi

COMPONENT_FILE="component_${COMPONENT_NAME}.html"

# Check if the component file already exists
if [[ -f "$COMPONENT_FILE" ]]; then
    echo "Error: Component file '$COMPONENT_FILE' already exists."
    exit 1
fi

# Create the component file with boilerplate content
# Ensure Unix-style line endings using 'printf' which doesn't introduce CR characters
cat <<EOF > "$COMPONENT_FILE"
<div id="${COMPONENT_NAME}">
    <footer class="bg-gray-800 p-4 text-center text-white">
        &copy; 2023 My Website. All rights reserved.
    </footer>
    <script>
        // Inline JavaScript for ${COMPONENT_NAME}
        console.log('${COMPONENT_NAME} loaded.');
    </script>
</div>
EOF

# Ensure the component file has Unix-style line endings
sed -i 's/\r$//' "$COMPONENT_FILE"

echo "Component '${COMPONENT_NAME}' created successfully as '${COMPONENT_FILE}'."
