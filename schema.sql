-- to store the name of games and their genre along with soft deletion
CREATE TABLE "Games" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "genre" TEXT,
    "removed" INTEGER DEFAULT 0,
    PRIMARY KEY ("id")
);

--to store no. of hours played by ME, and linked to each game
CREATE TABLE "Playtime" (
    "game_id" INTEGER NOT NULL,
    "time" REAL DEFAULT 00.00,
    FOREIGN KEY ("game_id") REFERENCES "Games"("id")
);

--to store when i purchased a specific game and at what cost, linked with id, so each game can be bought only once
CREATE TABLE "Purchase" (
    "id" INTEGER NOT NULL,
    "game_id" INTEGER NOT NULL,
    "purchase_date" TEXT NOT NULL DEFAULT '24-08-2023',
    "cost" REAL NOT NULL DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("game_id") REFERENCES "Games"("id")
);

--to store the total achievements of a particular game
CREATE TABLE "Achievements" (
    "id" INTEGER NOT NULL,
    "game_id" INTEGER NOT NULL,
    "total_achievements" INTEGER DEFAULT 0,
    "completed_achievements" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("game_id") REFERENCES "Games"("id")
);

--inserting some data of games (10 games)

INSERT INTO "Games" ("name", "genre")
VALUES
('Counter-Strike-2','FPS'),
('Dota-2','MOBA'),
('Minecraft','Sandbox'),
('Valorant','FPS'),
('Fall-Guys','Party-Royale'),
('Grand-Theft-Auto-V','Open-World'),
('Raft','Adventure'),
('Red-Dead-Redemption-2','Open-World'),
('Rust','Survival'),
('Forza-Horizon-5','Racing'),
('Among-Us','Party-Royale');

INSERT INTO "Playtime" ("game_id","time")
VALUES
('1','69'),
('2','5'),
('3','1000'),
('4','501.3'),
('5','21.5'),
('6','150'),
('7','30'),
('8','59.5'),
('9','101.2'),
('10','105'),
('11','70.1');

INSERT INTO "Purchase" ("game_id","purchase_date","cost")
VALUES
('3','2013-02-20','2123'),
('5','2022-04-09','572'),
('6','2021-05-31','981'),
('7','2024-01-03','475'),
('8','2024-03-28','1019'),
('9','2024-02-29','1799'),
('10','2023-12-31','1499'),
('11','2022-09-06','173');

INSERT INTO "Purchase" ("game_id","purchase_date")
VALUES
('1','2020-03-17'),
('2','2023-09-08'),
('4','2019-04-28');

INSERT INTO "Achievements" ("game_id","total_achievements","completed_achievements")
VALUES
('1','21','14'),
('2','140','80'),
('3','125','125'),
('4','45','12'),
('5','19','16'),
('6','109','39'),
('7','50','15'),
('8','123','21'),
('9','78','23'),
('10','164','59'),
('11','13','4');

-- view which shows game name and playtime
CREATE VIEW "game_playtime" AS
    SELECT "id","name","time" FROM "Games"
        JOIN "Playtime" ON "Games"."id" = "Playtime"."game_id"
        WHERE "removed" = 0;

-- view which shows game name and cost with purchase-date
CREATE VIEW "game_cost" AS
    SELECT "Games"."id","name","purchase_date","cost" FROM "Games"
        JOIN "Purchase" ON "Games"."id" = "Purchase"."game_id"
        WHERE "removed" = 0
        ORDER BY "cost";

--view to show delted games
CREATE VIEW "deleted" AS
    SELECT "id","name","genre" FROM "Games"
    WHERE "removed" = 1;

--creating index on Games table to increase lookup speed
CREATE INDEX "games_index"
ON "Games" ("id","name","removed");

--creating index on Playtime table to increase lookup speed
CREATE INDEX "Playtime_index"
ON "Playtime" ("game_id","time");
