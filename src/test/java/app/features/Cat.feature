Feature: Testing JSON object

  Scenario: Basic json assertions
    * print "Hello William"
    Given def cat =
    """
    {
      name: 'Billie',
      kittens: [
          { id: 23, name: 'Bob' },
          { id: 42, name: 'Wild' }
      ]
    }
    """
    # normal 'equality' match. the wildcard '*' in the json-path returns an array
    Then match cat.kittens[*].id == [23, 42]

    # 'contains' just checks if the expected items exist
    Then match cat.kittens[*].id contains [42, 23]

    # and yes, you can assert against nested objects within JSON arrays !
    Then match cat.kittens contains [{ id: 42, name: 'Wild' }, { id: 23, name: 'Bob' }]

    # ... and even ignore fields at the same time !
    Then match cat.kittens contains { id: 42, name: '#string' }