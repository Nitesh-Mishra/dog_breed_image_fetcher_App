
document.addEventListener("DOMContentLoaded", () => {
  $("#fetchForm").submit(function(e){
    e.preventDefault();
    
    var fetchType = $("input[name='fetchType']:checked").val();
    var breedInput = $("#breed_input").val();
    
    $("#imageDisplay").empty();

    fetchDogImages(breedInput, fetchType)
      .then((data) => displayDogImages(data))
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});

function fetchDogImages(breed, fetch_type) {
  return fetch(`/?breed=${breed}&fetch_type=${fetch_type}`)
    .then((response) => response.json());
}

function displayDogImages(data) {
  data.images.forEach((imageUrl) => {
    var imgCol = $("<div class='col-md-3'></div>");
    var img = $(`<img src="${imageUrl}" class='img-fluid' alt="${data.breed} Image">`);
    imgCol.append(img);
    $("#imageDisplay").append(imgCol);
  });
}