--insert game (Replace the required fields to insert your data)
INSERT INTO "Games" ("name", "genre")
VALUES ('game_name','game_genre');
INSERT INTO "Playtime" ("game_id","time")
VALUES ('game_id','timeplayed');
INSERT INTO "Purchase" ("game_id","purchase_date","cost")
VALUES ('game_id','buyingdate','sellingdate');
INSERT INTO "Achievements" ("game_id","total_achievements","completed_achievements")
VALUES ('game_id','achievements','completed-achievements');

--delete game (Replace Gameid, with id of game you want to delete)
UPDATE "Games" SET "removed" = 1
WHERE "id" = Gameid;

--search for a particular game using name (Replace name with name of game you want to search for)
SELECT "id","name" FROM "Games"
WHERE "removed" = 0 AND "name" = name;

--search using view for games with diffrent playtimes (Replace time with the playtime you are searching for)
SELECT * FROM "game_playtime"
WHERE "time" = time;

--search using view for games with diffrent costs (replace cost with the cost you want to search for)
SELECT * FROM "game_cost"
WHERE "cost" = cost;

--search for deleted games
SELECT * FROM "deleted";
