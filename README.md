# README

# Fattesh Hotels

Fattesh Hotels is used to view hotel offers that is being consumed from:
https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel

And it has been hosted in heroku:
https://fattesh-hotel.herokuapp.com/

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before using this project , you will need:

```
The Ruby language (version 2.3.3)
Rails (versions 5.0.2)
```
To install Ruby on Rails in your local machine, it is better to use Ruby Version Manager (RVM):

RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems(you can find all instruction in this link: https://rvm.io/).

Install GPG keys, As a first step install mpapis public key used to verify installation package to ensure security:

```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

Install RVM stable with ruby:

```
$ \curl -sSL https://get.rvm.io | bash -s stable --ruby
```
### Installing

This installation assume that you're working on Linux OS.

1- You need to download this application from github.com or using git command:

```
$ git clone git@github.com:Alanoudj/Hotel.git
```

2- Change your current eorking directory:

```
$ cd Hotel
```

3- Install Rails at the command prompt:

```
$ gem install rails
```

4- Install all required ruby gems and their dependancies:

```
$ bundle install
```

5- Start the web server:

```
$ rails server
```

6- To see your application in action, open a browser window and navigate to http://localhost:3000/.

## Running the tests

We have used rspec ruby gem to write the model unit testing: https://github.com/rspec/rspec

RSpec is a testing tool for Ruby, created for behavior-driven development (BDD). It is the most frequently used testing library for Ruby in production applications. 

To run the unit test you need to run the following command inside the rails directory:

```
$ bundle exec rspec ./spec --color --format documentation
```
After running the above command something like the following should be shown in your terminal:

```
Offer
  validations
    is valid with valid attributes
    is not valid without hotel_url
    is not valid if hotel_url is not a valid URL
    is not valid if image_url is not a valid URL
    is not valid without image_url
    is not valid without hotel_name
    is not valid without hotel_destination
    is not valid without hotel_description
    is not valid without currency
    is not valid without booked_people_count
    is not valid if booked_people_count is not numeric value
    is not valid without viewing_people_count
    is not valid if viewing_people_count is not numeric value
    is not valid without original_price
    is not valid if original_price is not numeric value
    is not valid without average_price
    is not valid if average_price is not numeric value
  #get_deals
    returns array of deals that match the given query

QueryParams
  validations
    is valid with valid attributes
    is not valid if region_id is not numeric value
    is not valid if length_of_stay is not numeric value
    is not valid if max_star_rating is not numeric value
    is not valid if min_star_rating is not numeric value
    is not valid if min_star_rating is larger than max_star_rating
    is not valid if min_start_date is not a date
    is not valid if max_start_date is not a date
    is not valid if min_start_date is larger than max_start_date
  #invalid_date?
    returns true if the given string is not a valid date
    returns flase if the given string is a valid date
  #get_query_params
    returns a query string that contains the given query param
    returns an empty query string if you didn't send any query params

Finished in 21.41 seconds (files took 1.75 seconds to load)
31 examples, 0 failures

```
All the passed tests will be shown in green colors and if any failure happend the lines will be shown in red color.
