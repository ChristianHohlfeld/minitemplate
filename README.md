
# Self-Contained Component Structure and Usage

This project is based on a flexible, component-based architecture, utilizing **Tailwind CSS** and **DaisyUI**. The idea is to create self-contained, reusable components that include both their HTML structure and any associated JavaScript in one file.

## CSS Framework & Component Library Used

1. **Tailwind CSS**: A utility-first CSS framework used for styling components.
2. **DaisyUI**: A component library built on Tailwind CSS that provides pre-built UI components with customizable themes.

## Basic Idea of Self-Contained Components

Each component follows these rules where:
- The HTML structure is defined directly in the component file.
- JavaScript is included inside the root <div> of the component using a `<script>` tag.
- Components are fully self-contained, making them reusable across different parts of the project.

## Sample Component Definition

Here is an example of a **self-contained component** for a button:

### buttonDefaultComponent.html

```html
<div id="buttonComponent" class="flex justify-center items-center p-4">
    <button class="btn btn-primary">
        Click Me
    </button>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const button = document.querySelector('#buttonComponent .btn');
            button.addEventListener('click', function() {
                alert('Button Clicked!');
            });
        });
    </script>
</div>
```

- The component contains HTML (the button) and the necessary JavaScript (an event listener to show an alert on button click).
- It's fully self-contained, meaning this file alone can provide the functionality wherever it's included.

## How to Create a Component

When running the `generate.sh` script, you are prompted to choose whether to use **default** components or **regular** components. 

- **Default Components**: These are pre-defined components that follow specific styles and behavior, such as `buttonDefaultComponent.html` or `chatDefaultComponent.html`. These are used when the user selects 'y' (yes) during the prompt in the `generate.sh` script.
  
- **Regular Components**: These components do not have the `Default` suffix and offer more customization. When the user selects 'n' (no) during the prompt, the script expects that the regular components like `buttonComponent.html` or `chatComponent.html` already exist in the directory.

### Creating Default and Regular Components

1. **Default Component**: Use the `Default` suffix in the filename to signify it's a pre-built component. For example, `sidebarDefaultComponent.html`.
2. **Regular Component**: Remove the `Default` suffix for custom-built components. For example, `sidebarComponent.html`.

## Example Workflow for Creating a Button Component

- **Default**: `buttonDefaultComponent.html`
- **Regular**: `buttonComponent.html`

1. Run `generate.sh`.
2. The script will ask: "Do you want to use default components for sidebar, content, and footer? (y/n)"
3. If **y**, the script will include default components like `buttonDefaultComponent.html`.
4. If **n**, the script will look for custom components without the `Default` suffix.

## Conclusion

This system provides a flexible and scalable approach to web development using reusable, self-contained components. By leveraging Tailwind CSS and DaisyUI, you gain access to powerful utility classes and pre-built UI components, while the self-contained nature of your components keeps your project clean and modular.
