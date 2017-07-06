# ABOUT ME


* This project is used to view hotel offers that are being consumed from Expedia API:

  https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel

When the user visits the website, he'll be redirect to the offer page which contains query param search filters that will allow the user to find the best deals based on the required search filter and then when he clicks search, the request will be sent to the Ruby on Rails application:

1- The request will be routed to the offers controller.

2- QueryParam model will be called from the offers controller to validate all the given query params filter.

3- If the query params are not valid an error message will be shown to indicate all the errors.

4- If the query params are valid, then the offer model will be called to get all the deals that match the given query params.

5- In the Offer model, Services::HotelService will be called to get the response.

6- Services::HotelService will read API URL from config/services.rb file and then call the API.

7- All the returned data will be validated and then stored into array to be sent to the controller.

8- The controller will send the data to the index view.

9- If the data contains values the data will be shown to the user, otherwise "
No Data avaliable with the given search" text will be shown.

* This project has been implemented using Ruby on Rails framework.

I have been working with this framework for one year now as a Back End engineer and I think it's one of the most effective fremeworks that could be used to build web applications, especially if you want to implement your website without any complications and with a short time of period.

This framework has tow main features that will help you to build web applications easily:
1- DRY: Don't repeat yourself.
  A- you don't need to re-write things so if you need to create a setter and getter
    method to your attribute you only need to use attr_accessor method with the attribute name:

  If you want to create those methods to region_id atribute you only need to do the following: 

    ```
      attr_accessor :region_id
    ```
    And the two methods will be crated to be used:

    * Getter Method
    ```
      def region_id
        @region_id
      end
    ```

    * Setter Method
    ```
      def region_id= value
        @region_id = value
      end
    ```

  B- This the same for validating the attribute you need to use validates method
     with the attribute name and the validation.

     Ex: validate region_id to be number only:

     validates :region_id, numericality: { greater_than: 0 }, allow_blank: true

2- Convention over configuration.
  if you want to creat a new table (users) your model name will be User and it will create the table as plural in the database   for you.


* The main problem that faced me in this application was building the Front End side (User interface), because I've been working with ROR as a Back End Engineer where all the responses I've created was JSON APIs and I never worked with HTML pages or CSS to build user interface.
