# Design Document

By Anshul Singh

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
* Which people, places, things, etc. are you including in the scope of your database?
* Which people, places, things, etc. are *outside* the scope of your database?

In this evolving world, esports is also evolving with a much greater phase, so to assist the gamers and help them keep track of their statistics of the games in which they have invested their time and money, this database will help them organize the efforts and have a check on how much time, money and achievements they have spent while playing several games.
I assume i am including people who are inclined towards gaming industry and do make purchases on daily basis or invest a significant amount of time in playing the games available on the web and also purchase from stores like steam, epic games etc. this user base is significantly underestimated and uncared about till date.
The people who don't play many games, like people to just play 1-2 games and not invest significantly are outside the scope of this database, it is meant to serve people who are intrested in gaming and esports. Mainly the teens of 12-20 years of age. Also it doesn't serves to people who aren't willing to track their time on games or not taking the esports sceneraio seriously.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
* What's beyond the scope of what a user should be able to do with your database?

With the provided database and fed data correctly and efficiently, a user must be able to keep track of their spendings of money behind a particular game, and also the total money spent during specific times. Also one can keep track of the no. of hours he/she might spend playing the games in a day and in total, encouraging them to take the games which they spend most of time with seriously, this data could also be used to diagnose several mental issues and treat them under the supervision of a doctor.
A user can't buy/sell games using a database and cannot also expect the database to autoupdate as of now, it needs manual updation to keep the data at par with the current situation and keep updating, it goes to be the responsiblity of the user/ caretaker to keep the data updated. Also it is not a full fletched finance tracking application, so one may not intend to do so.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

The entities i chose to represent in this database are - Game, Playtime, Purchase information, Achievements as these are the entities I think which are most important to create such basic database. These are the bare minimum entities and the minimalistic and most careful approach in order to not overcomplicate the things, keeping it good and simple but at the same time easy to use and effective.
Each of the entity will have different attributes namely, For the "Game" we have an 'id', which is the primary key and tracks the games which are in here. 'name' which is a TEXT, and contains the name of the game mentioned , 'genre' it is also a TEXT and contains the genre of the game as one may need to sort it that way. 'removed' it is a column used for soft deletion, which over the course has been important and great to add as an add on to the database.
Next is the "playtime" table, which includes the "game_id" which is a foreign key, linking the games table to this table and 'time' column which indicates the amount of hours spent in a particular game, it is of type REAL.
Next is the "Purchase" table, which keeps track of all the 'costs' in the columns for a particular game, impling it to have a Foreign Key 'game_id' and 'purchase_date' which indicates the date on which the game was purchased.
Next and last we have the "Achievements" Table , which keeps track of the total and completed achievements of the user using the 'game_id' foreign key, it is crucial in informing the users their progress in a particular game.
The choosing of types was done by assuming the data which could be put their at the max and min requirements. i.e. using real for storing playtime ensures that no minute of playtime goes unregistered into the database.
Constraints were pretty straight forward, implying the min amount of data which could be stored and was not stored in there putting NOT NULL constraints helps prevent faulty and bad entries in the database.

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.
![ER Diagram](./ER-Diagram.png)
In this Diagram, Game has a many to one relationship with playtime and purchase which signifies that there could be many games having the same playtime and also many games having same purchase dates and prices but there cannot be any game having more than one Playtime and also no game can have more than one playtime for a particular user.
And game has a one to many connection with the achievements, which again signify that there can be games having multiple achievements but no common achievements can be there in between the games, which might not be totally true in real world, but was considered as true for the sake of this project.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
I created Multiple views (e.g. game_playtime and game_cost) which improve the user experience and contain almost everything a user needs to most of the time, also these views help in soft deletion and these views show only the info which is not deleted, keeping the deleted info intact and of further use. It also reduces the chances of Corruption of the database as serveral checked and predefined queries are only used, maintaining the integrity of the database.
Also , Several indexes on Games and Playtime tables were created, taking in to consideration that these are the most commonly used tables and data retrival from these columns must be fast and efficient, trading off with space of the database. nevertheless, these indexes are of most use when there is a huge amount of data present in it.
From these optimizations, we came across some pretty impressive read and lookup times.

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
There are several limitations of this design, to name some, it is just compitable with a single user as of now, but this funcitionality can be included very easily by adding a new table called users and using its primary key as foreign key in rest of the tables , so that the games and their playtimes are distributed according to the users. It might also not be able to represent the games which have many genres in one, due to the constraints as discussed earlier in the document. It might also not be able to represent the connections between the subtables like playtime and dates as they are not connected by any relations.
This database, while considering all the goods, might represent almost all the games well, but might not be able to represent itself as a transaction calculator or expense tracker, which can track all the expenses easily. It could also not represent various users at once, which might be a issue if its being used at a cyber cafe or a game zone. Rest assured, it works well with single user defined case init.
