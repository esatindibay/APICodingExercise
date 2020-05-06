Feature: Validating the sample response

  Background:
    # in the background we defined url which we read from karate-config.js file
    # we can also define any global settings for our scenarios in the background section
    * url endPoint
    * method get
    #after using get call above, whatever the service returns will be stored in 'response' keyword
    # since I make the call in background, I can use same 'response' for all scenarios

  Scenario: verify HTTP status code is 200 OK for GET method

      #below two statements are checking the status code
      * status 200
      * match responseStatus == 200
      * print responseTime
      * assert responseTime < 500
      # if respose time is greater than 500 ms this scenario will fail

  Scenario: display the response body

      # there are different ways to check status code as I did below
      * assert responseStatus == 200
      # in karate I can print entire response body with print keyword
      * print response

    Scenario: validate id is positive
      # i  can parse the json response using jsonpath, i can also assign specific fields into variables using def keyword
      * def getId = response.id
      * print 'id = ' + getId
      * assert getId > 0

      Scenario: validate name length is smaller than 11
      * string getName = response.name
      * def nameLength = getName.length
      * print 'name length: ' + nameLength
      * assert nameLength < 11

      Scenario: validate lastname length is smaller than 11
        * string getLast = response.last
        * def lastLength = getLast.length
        * print 'lastname length: ' + lastLength
        * assert lastLength < 11

    Scenario: validate that age is between 0 and 120
      * def getAge = response.age
      * assert getAge > 0 && getAge < 120

      Scenario: validate gender is nothing but F or M
        * string getGender = response.gender
        * assert getGender == "M" || "F"


        # also I created schema structure 
        Scenario: validating the response data structure
          * def getSchema = read('classpath:examples/schema/personSchema.json')
          * match response == getSchema

      
      

