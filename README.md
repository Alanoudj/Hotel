# README

This project is used to view hotel offer that is being consumed from:

https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel

Note the following:

* The data is being viewed without any pagination (the whole list is being shown).

* No caching level is provided (each time the user tries to view the data, we will call the API to retrieve the data from.)
