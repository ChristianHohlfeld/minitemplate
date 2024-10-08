
# **MiniTemplate Project**

This project is a component-based system that uses **Tailwind CSS** and **DaisyUI** to help developers quickly create and customize web pages. Each component is self-contained, meaning it includes its own HTML structure, CSS classes, and JavaScript functionality.

## **Technologies Used**
- **Tailwind CSS**: A utility-first CSS framework for rapid UI development.
- **DaisyUI**: A component library for Tailwind CSS that provides pre-designed UI elements.

## **Component System**
Each component in this system follows a simple structure, making it easy to create, reuse, and customize. Components include:
- **HTML structure**: The basic structure of the component.
- **CSS classes**: Using Tailwind and DaisyUI classes for styling.
- **JavaScript functionality**: Inline JavaScript for handling component-specific behavior.

### **Types of Components**
1. **Default Components**: These are provided by the system and can be used without modification.
2. **Regular Components**: User-created components that can be customized to fit specific needs.

### **Self-contained Component Example**
Here’s an example of a self-contained component:

```html
<div id="exampleComponent" class="flex justify-center items-center p-4">
    <button class="btn btn-primary">
        Click Me
    </button>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const button = document.querySelector('#exampleComponent .btn');
            button.addEventListener('click', function() {
                alert('Button Clicked!');
            });
        });
    </script>
</div>
```

## **Theming with DaisyUI**
You can choose from a list of available themes provided by DaisyUI. These themes modify the look and feel of the entire application by changing things like color schemes and font styles.

### **Available Themes**
Here are the available themes:
- light
- dark
- cupcake
- bumblebee
- emerald
- corporate
- synthwave
- retro
- cyberpunk
- valentine
- halloween
- garden
- forest
- aqua
- lofi
- pastel
- fantasy
- wireframe
- black
- luxury
- dracula
- cmyk
- autumn
- business
- acid
- lemonade
- night
- coffee
- winter
- dim
- nord
- sunset

### **How to Apply a Theme**
To apply a theme, generate your page with the following steps:
1. Run the `generate.sh` script and pass the theme name as an argument.
```bash
./generate.sh [themeName]
```
If no theme is provided, the default theme `business` will be used.

## **How to Create Components**
When you run the `generate.sh` script, you'll be prompted to choose between default or regular components:
- **Default Components**: These are system-provided components.
- **Regular Components**: Customizable components that you create.

### **Component Creation Process**
1. To use **default components**, simply run the `generate.sh` script and answer `y` when prompted.
2. If you want to create your own components, answer `n`, and make sure the regular component files (e.g., `sidebarComponent.html`, `contentComponent.html`) exist in the root directory.

## **Generating the Project**
1. Run the `generate.sh` script to generate the `index.html` page based on the template and components you’ve created.
```bash
./generate.sh
```

2. Follow the prompts to choose the page title, theme, and component usage.

---

This setup allows for fast prototyping and a flexible, component-based design approach using Tailwind CSS and DaisyUI.
