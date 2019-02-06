# SmashForce
SmashForce is a wikia and a tool that could be used by individual users, or users who are parts of tournament leagues. The wikia allows users to view characters in game, the data around the character itself and their moves. Users can filter what they see based on categories, and sort by multiple fields. For tournaments, users can input tournament data, and then see tournament results.

## Getting Started
There are two main sections within SmashForce. One is the wikia, which stores Character data for Super Smash Bros. Characters, and their moves. The other is a tournament tool for managers of tournament leagues to insert their league's tournament information, and have others view the data.

### Character Wikia
Players launching this Wikia will be greeted by images of all the characters in the database, with filtering and sorting options above. Players can discover which character is perfect for them, sorting by Weight, Speed, or Play Style. Also they can sort the characters they've searched by Most Played and Least Played.

* Note: The Most Played and Least Played are determined by data from the tournament tool

Clicking on a Character they want to play / learn more about, they're greeted with more information about that character. Specifically, we store data about what Series the character is from, their First Smash Appearance, Fighter Number, Speed, Weight, Style, Fighting Description, and Notable Players.

* Note: The Notable Players field is populated by the Most Played Character field on the Player object.

Scrolling down, a player will have access to all of the move data related to the Character they selected. We have tabs housing data of every move type, including All Moves, Normals, Aerials, Smash Attacks, Specials, Grabs, and Throws.

Each of these moves has information about the Start Up Frame, First Active Frame, Damage.

### Tournament Tool
In the Tournament Section of the app, Users will be greeted by a list of the tournaments within the database. These are input by a league Administrator / Moderator. Upon putting in this data, they insert the data via putting in individual Sets, where two players fight each other. Their wins, losses, and characters played are all stored in our database.

Upon clicking an individual tournament, a User will be brought to the visual representation of the tournament. Clicking the other tabs available, they can view all of the placements of the players within the tournament. Next to the rank the players received will be the player's overall rank within the league itself. The most played character of the player will also be displayed as a column next to these rankings. The last tab is the description of all of the sets, showing all of the data for the sets in text format. This includes Round, the Playes' Names, their Characters, Wins, Losses, and who Won and who Lost.

## File Breakdown / Descriptions
Descriptions about the use / purpose of the files found in the project.

### Pages
* **StartPage -** <br/>
The main landing page. Options to click to the Character Wikia or Tournament Tool section.
* **AllCharactersPage -** <br/>
Displays all of the characters available to sort, filter, and click to get more information about.
* **CharacterPage -** <br/>
Displays information related to a specific Character.
* **TournamentsPage -** <br/>
Displays all of the tournaments available to get more information about.
* **TournamentPage -** <br/>
Displays all of the information related to a specific Tournament.
### Controllers
* **pagesController -** <br/>
Stores the PageReference functions used by the headerComponent to transfer between the main pages. 

* **AllCharactersController -** <br/>
Stores information related to the characters being displayed on the AllCharactersPage. Also enables the filtering and sorting by Weights, Speeds, Styles, and Most/Least Played. Passes the parameter of the character clicked to the CharacterPageController.

* **CharacterPageController -** <br/>
Stores information about the character, grabbing data from the database using the ID received from the AllCharactersController. The moves will be grabbed related to the character, then stored in multiple lists. The lists store All of the Moves, Normal Moves, Aerial Moves, Smash Attacks, Specials, Grabs, and Throws to be displayed in tabs on the CharacterPage.

* **TournamentsPageController -** <br/>
Stores the information about the tournaments. 
  - *SortByDate()* allows the user  to click on the Tournament Date column header to sort by the most recent or the last tournament.

### Triggers
* **SetTrigger -** <br/>
This trigger calls the getMostCharactersPlayed() function after insert, update, or undelete. The IDs of the players is added into a set to preserve uniqueuness. This set is passed to the helper function, which will update the players referenced. 

* **PlacementTrigger -** <br/>
This trigger calls the updatePlacementAverage() function after Insert, Update, Delete, or Undelete. First it will check if the rank on the placement deleted was not null before calling the function on the relevant placements.

* **PlayerTrigger -** <br/>
This trigger calls the updateNotablePlayers() function after Insert, Update, or Undelete. It will first make sure the mostPlayedCharacter field on the Player has a name before passing the list of players to the helper function.  

### Components
* **headerComponent -** <br/>
A navigation component to go to the Start, Tournaments, or All Characters pages.
* **bracketComponent -** <br/>
Takes in a list of sets as a parameter, displays it visually with conditional class styling to denote the Winner & Loser.

### Extensions / Helpers
* **SetTriggerHelper -** <br/>
*getMostCharactersPlayed(Set<Id> playerIds)* Sets the Most Played Character Field on the Player object. <br/>
  - This assumes that each set will have two players, and their characters are set.

* **PlacementCalculatorHelper -** <br/>
*updatePlacementAverage(List<Placement__c> placement)* Sets the Overall Rank field on the Player object. <br/>
  - Uses the average of all of the ranks the players have played in to calculate the overall ranking.
 
* **PlayerTriggerHelper -** <br/>
*updateNotablePlayers(List<Player__c> playerList>) Sets the Notable Players field on the Character object.* <br/>
  - As of right now, this does not remove the name from the Notable Players field on the Character they previously were in. It only adds people to the new field.


## Built With
* Salesforce
* Apex - Controllers / Extensions
* Visualforce - Pages / Components
* HTML
* CSS

## Authors
* Eva Lahtinen
* Stephen Shekailo
