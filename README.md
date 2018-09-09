# tic-tac-toe

Simple ruby implementation of Tic-tac-toe (without AI).

Game accepts gameboards widths greater than 3. The winning condition is
when a player connects 3 markers in a row.

### Running

This assumes you have Ruby 2.0 or above installed. To play, run the following command:

```bash
ruby game.rb
```

### Testing

Tests are written in `test.rb`. To run tests, run the following command:

```bash
ruby test.rb
```


### Sample Run

```
Please enter the number of rows for the tic-tac-toe game (defaults to 3 if there is no input).

Enter name for Player 1:
Andy

Enter name for Player 2:
Barry

 1 | 2 | 3
-----------
 4 | 5 | 6
-----------
 7 | 8 | 9

Andy, choose a box to place an 'X' into:
1

 X | 2 | 3
-----------
 4 | 5 | 6
-----------
 7 | 8 | 9

Barry, choose a box to place an 'O' into:
2

 X | O | 3
-----------
 4 | 5 | 6
-----------
 7 | 8 | 9

Andy, choose a box to place an 'X' into:
5

 X | O | 3
-----------
 4 | X | 6
-----------
 7 | 8 | 9

Barry, choose a box to place an 'O' into:
3

 X | O | O
-----------
 4 | X | 6
-----------
 7 | 8 | 9

Andy, choose a box to place an 'X' into:
9

 X | O | O
-----------
 4 | X | 6
-----------
 7 | 8 | X

Congratulations Andy! You have won.
```
