@ignore
Feature:

    Scenario: number to string
        # Fails due to type difference.
        # * match 10 == '10' 

        # Cannot call toString on a plain number. Fails.
        # * match 10.toString() == '10' 

        * def foo = 10

        # number converted to string: ''+foo
        * def json = { "bar": #(''+foo) }
        # OR this works too:
        * def json2 = { "bar": #(foo+'') }
        * match json == { "bar": '10' }
        * match json2 == { "bar": '10' }

    Scenario: string to number
        * def foo = '10'
        # JS way multiply by 1
        * def json = { "bar": #(foo*1) }
        # OR this Java way works too - parseInt():
        * def json2 = { "bar": #(parseInt(foo)) }
        * match json == { "bar": 10 }
        * match json2 == { "bar": 10 }

    # Convert double into an integer 
    # * def a = 10.0
    # ~~10.0 == 10