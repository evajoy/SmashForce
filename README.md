# SmashForce
SmashForce is a wikia and a tool that could be used by individual users, or users who are parts of tournament leagues. The wikia allows users to view characters in game, and the data around the character itself and their moves. Users can filter what they see based on categories, and sort by multiple fields. For tournaments, users can input tournament data, and then see tournament results.

## Getting Started
There are two main sections within SmashForce. One is the wikia, which stores Character data for Super Smash Bros. Characters, and their moves. The other is a tournament tool for managers of tournament leagues to insert their league's tournament information, and have others view the data.

### Character Wikia
Players launching this Wikia will be greeted by images of all the characters in the database, with filtering and sorting options above. Players can discover which character is perfect for them, sorting by Weight, Speed, or Play Style. Also they can sort the characters they've searched by Most Played and Least Played.

Clicking on a Character they want to play / learn more about, they're greeted with more information about that character. Specifically, we store data about what Series the character is from, their First Smash Appearance, Fighter Number, Speed, Weight, Style, Fighting Description, and Notable Players.

* Note: The Notable Players field is populated by the Most Played Character field on the Player object.

Scrolling down, a player will have access to all of the move data related to the Character they selected. We have tabs housing data of every move type, including All Moves, Normals, Aerials, Smash Attacks, Specials, Grabs, and Throws.

Each of these moves has information about the Start Up Frame, First Active Frame, Damage.

### Tournament Tool
In the Tournament Section of the app, Users will be greeted by a list of the tournaments within the database. These are input by a league Administrator / Moderator. Upon putting in this data, they insert the data via putting in individual Sets, where two players fight each other. Their wins, losses, and characters played are all stored in our database.

Upon clicking an individual tournament, a User will be brought to the visual representation of the tournament. Clicking the other tabs available, they can view all of the placements of the players within the tournament. Next to the rank the players received will be the player's overall rank within the league itself. The most played character of the player will also be displayed as a column next to these rankings. The last tab is the description of all of the sets, showing all of the data for the sets in text format. This includes Round, the Playes' Names, their Characters, Wins, Losses, and who Won and who Lost.

## Built With
* Salesforce
* Apex - Controllers / Extensions
* Visualforce - Pages / Components
* HTML
* CSS

## Authors
* Eva Lahtinen
* Stephen Shekailo
