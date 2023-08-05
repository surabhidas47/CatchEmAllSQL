--What is each pokemon's primary type?

    SELECT p.name,p.id, t.name
        -> FROM pokemons p
        -> JOIN types t
        -> ON t.id= p.primary_type;

--What is Rufflet's secondary type?

    SELECT p.name AS pokemon_name , t.name AS secondary_name
    FROM pokemons p
    JOIN types t
    ON t.id =p.secondary_type
    WHERE p.name = ('Rufflet');

--What are the names of the pokemon that belong to the trainer with trainerID 303?
--
-- Wailord
-- Vileplume

    SELECT p.name AS trainer303_poky
    FROM pokemons p
    JOIN pokemon_trainer pt
    ON pt.pokemon_id = p.id
    WHERE pt.trainerID = 303;
--
--How many pokemon have a secondary type Poison

    SELECT count(p.secondary_type = 'Poison') AS Poison_Poky
    FROM pokemons p;
--
--What are all the primary types and how many pokemon have that type?

    SELECT t.name AS primary_type, COUNT(*) AS num_of_pokemon
    FROM pokemons p
    JOIN types t
    ON p.primary_type = t.id
    GROUP BY p.primary_type;




--How many pokemon at level 100 does each trainer with at least one
--level 100 pokemone have? (Hint: your query should not display a trainer

SELECT pt.trainerID AS trainers, COUNT(*) AS count
FROM pokemon_trainer pt
WHERE pt.pokelevel >=100
GROUP BY pt.trainerID;

--How many pokemon only belong to one trainer and no other?
--
--//this results in 13 rows, all the pokemons having 1 trainer
--SELECT COUNT(pt.pokemon_id)
--FROM pokemon_trainer pt
--GROUP BY pt.pokemon_id
--HAVING COUNT(pt.trainerID) = 1;
--
--
--//outer query that wraps around counts the rows of inner query
SELECT COUNT(*) AS count
FROM (
    SELECT pokemon_id
    FROM pokemon_trainer
    GROUP BY pokemon_id
    HAVING COUNT(trainerID) = 1
) AS single_trainer_pokemon;