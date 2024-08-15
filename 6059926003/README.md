# Senior Software Engineer, Kubernetes
Interview hacking session with 45m duration. 

## Rules

* Six knights start a game
* Each one has 10 health points
* Moves are made in clockwise order
* Every knight hits the next one for a random number of health points (between 1 and 6)
* When a knight loses all his life points, he dies and is excluded from the game
* The winner is the last surviving knight

## Output
```text
KNIGHT1 (HP=10) hit KNIGHT2 (HP=10) with damage 4
KNIGHT2 (HP=6) hit KNIGHT3 (HP=10) with damage 2
KNIGHT3 (HP=8) hit KNIGHT4 (HP=10) with damage 4
KNIGHT4 (HP=6) hit KNIGHT5 (HP=10) with damage 1
KNIGHT5 (HP=9) hit KNIGHT6 (HP=10) with damage 4
KNIGHT6 (HP=6) hit KNIGHT1 (HP=10) with damage 3
---
KNIGHT1 (HP=7) hit KNIGHT2 (HP=6) with damage 5
KNIGHT2 (HP=1) hit KNIGHT3 (HP=8) with damage 5
KNIGHT3 (HP=3) hit KNIGHT4 (HP=6) with damage 1
KNIGHT4 (HP=5) hit KNIGHT5 (HP=9) with damage 3
KNIGHT5 (HP=6) hit KNIGHT6 (HP=6) with damage 5
KNIGHT6 (HP=1) hit KNIGHT1 (HP=7) with damage 5
---
KNIGHT1 (HP=2) hit KNIGHT2 (HP=1) with damage 3
KNIGHT3 (HP=3) hit KNIGHT4 (HP=5) with damage 5
KNIGHT5 (HP=6) hit KNIGHT6 (HP=1) with damage 5
KNIGHT2 died
KNIGHT4 died
KNIGHT6 died
---
KNIGHT1 (HP=2) hit KNIGHT3 (HP=3) with damage 3
KNIGHT5 (HP=6) hit KNIGHT1 (HP=2) with damage 4
KNIGHT1 died
KNIGHT3 died
---
KNIGHT5 (HP=6) won the game
```