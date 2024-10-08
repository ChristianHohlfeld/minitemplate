
# Minitemplate Project

## Overview
This is a modular, component-based template project using Tailwind CSS and DaisyUI. The project is designed to allow easy integration of self-contained components such as a sidebar, chat interface, buttons, and more. Each component is stored as a separate file, making it simple to manage and update.

## Project Structure
- `index.html`: The main template file where the components are dynamically inserted.
- `template.html`: The base HTML file used as a template for generating the final output.
- `generate.sh`: A script that processes the template and inserts components into placeholders.
- `chatDefaultComponent.html`: Chat interface component with scrollable chat bubbles and input field.
- `buttonDefaultComponent.html`: A simple button component.
- `contentDefaultComponent.html`: The main content area with a header, chat integration, and footer.
- `sidebarDefaultComponent.html`: Sidebar component that toggles visibility on smaller screens.
- `create_component.sh`: A script for generating new components based on a template.
- `print.sh`: A script that prints the current file structure and file contents.

## Installation
No specific installation is required for this project. The project uses CDN links for Tailwind CSS and DaisyUI, so make sure you have an active internet connection.

### Steps:
1. Clone the project.
2. Edit the components or add new ones.
3. Use `generate.sh` to create the final output HTML file.

## Usage
To generate the output:
```bash
./generate.sh
```
You will be prompted for the page title and whether to use default components or regular components.

## Components
1. **Button Component** (`buttonDefaultComponent.html`): A button with a click event that shows an alert.
2. **Chat Component** (`chatDefaultComponent.html`): A chat interface with scrollable chat bubbles and input area.
3. **Sidebar Component** (`sidebarDefaultComponent.html`): Sidebar with navigation links that toggles visibility based on screen size.
4. **Footer Component** (`footerDefaultComponent.html`): A basic footer for the template.

## Future Enhancements
- Add more advanced components such as forms, modals, etc.
- Implement component-level testing.
- Extend the theme functionality with more Tailwind and DaisyUI themes.

## License
MIT License.
