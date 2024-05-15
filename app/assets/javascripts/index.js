document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("dog_form");

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    const breedInput = document.getElementById("breed_input").value;

    fetch(`/?breed=${breedInput}`)
      .then((response) => response.json())
      .then((data) => {
        const dogImageDiv = document.getElementById("dog_image");
        dogImageDiv.innerHTML = `
          <h4>${data.breed}</h4>
          <img src="${data.image}" alt="${data.breed}" style="max-width: 300px;">
        `;
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});
