Feature: Hear a shout

  Rules:
    - Listener must be within a 1000 metres
    - Shouts must be 140 characters or less

    Scenario: James doesn't hear Chris' shout
      Given James is at "Manchester Picadilly"
      And Chris is at "On the Beach"
      When Chris shouts "Donuts in the breakout area"
      Then James doesn't hear Chris' shout
