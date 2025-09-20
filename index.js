document.addEventListener("DOMContentLoaded", () => {
  const options = document.querySelectorAll(".Option");
  let currentIndex = 0;

  const updateHighlight = () => {
    options.forEach((option, index) => {
      option.classList.toggle("highlighted", index === currentIndex);
    });
  };

  document.addEventListener("keydown", (e) => {
    if (e.key === "ArrowDown") {
      currentIndex = (currentIndex + 1) % options.length;
      updateHighlight();
    } else if (e.key === "ArrowUp") {
      currentIndex = (currentIndex - 1 + options.length) % options.length;
      updateHighlight();
    } else if (e.key === "Enter") {
      const selected = options[currentIndex];
      const text = selected.textContent.trim();
      handleSelection(text);
    }
  });

  const handleSelection = (text) => {
    console.log("Ausgewählt:", text);

    // Hier kannst du dein Verhalten definieren je nachdem, welcher Tab gewählt wurde.
    switch (text) {
      case "Local Player":
        // Logik für Local Player
        alert("Local Player geöffnet");
        break;
      case "Online":
        alert("Online geöffnet");
        break;
      case "Weapon":
        alert("Weapon geöffnet");
        break;
      case "Teleport":
        alert("Teleport geöffnet");
        break;
      case "Miscellaneous":
        alert("Misc geöffnet");
        break;
      case "Setting":
        alert("Setting geöffnet");
        break;
      default:
        break;
    }
  };
});
