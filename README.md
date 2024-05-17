## Dog Breed Image Fetcher App

### Overview
This Ruby on Rails application allows users to search for and fetch images of various dog breeds. Users can enter a breed name into a form and choose whether they want to retrieve a random image or all available images for that breed. Upon submitting the form, the application will fetch the requested image(s) from the Dog API (https://dog.ceo/dog-api/) and display them on the page, if requested image is not present in the api then display the default not found image.

### Technologies Used:

- Ruby on Rails
- Bootstrap
- Jquery

### Setup Instructions:

- Clone the repository:
`https://github.com/Nitesh-Mishra/dog_breed_image_fetcher_App.git`

- Navigate to the project directory:
`cd dog_breed_image_fetcher_App`

- Install the required dependencies:
`bundle install`

- Start the Rails server:
`rails s`

- Open your web browser and navigate to `http://localhost:3000` to access the application.

### Running Tests:
- To execute the test cases, follow these commands:

  - For testing the controller:
    - `rspec test/controllers/home_controller_test.rb`

  - For testing the service:
    - `rspec test/services/dog_breed_image_fetcher_service_test.rb`


### Deployment instructions:
- Update the `deploy_to` and `base_path` variables in the `config/deploy.rb` file.
- Update the ip address of the server for the `app` and `web` role in `config/deploy/production.rb` file.
- Update the SSH keys within the `ssh_options` section in the `config/deploy/production.rb` file.
- Execute the following command to deploy the changes to the server: 
  - `cap production deploy`

