# README

## Dog Breed Image Fetcher App

This Ruby on Rails application enables users to search for images of dog breeds. Users can simply enter the breed name into a form and select whether they want to fetch a random image or all images of that breed. Upon submission of the form, the application retrieves the specified breed's image from the Dog API (https://dog.ceo/dog-api/) based on the user's selection, and displays it on the page."


### Technologies Used

- Ruby on Rails
- Bootstrap (for styling)
- Git (for version control)

### Setup

- Clone the repository:
`https://github.com/Nitesh-Mishra/dog_breed_image_fetcher_App.git`

- Navigate to the project directory

- Install the dependencies:
`bundle install`

- Start the Rails server:
`rails s`

- Open your web browser and navigate to `http://localhost:3000`.

### Testcases
- Execute the test cases with the following command:

- To test the service run:
  - `rspec test/controllers/home_controller_test.rb`

- To test the service run:
  - `rspec test/services/dog_breed_image_fetcher_service_test.rb`


### Deployment instructions:
- Update `deploy_to` and `base_path` variables in the `config/deploy.rb` file.
- Update the ip address of the server for `app` and `web` role in `config/deploy/production.rb` file.
- Update the SSH keys within the `ssh_options` section in the `config/deploy/production.rb` file.
- Execute `cap production deploy` to deploy the changes to the server.

