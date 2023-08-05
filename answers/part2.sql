--What are all the types of pokemon that a pokemon can have?
--    18 different types

    SELECT *
    FROM types;


--What is the name of the pokemon with id 45?
--    Eevee

    SELECT * FROM pokemons
     WHERE id = 45;

-- How many pokemon are there?
--     656

    SELECT count(name) AS pokemon_name
     FROM pokemons;

--How many types are there?
--    18

    SELECT count(name) AS pokemon_typesnum
        -> FROM types;

--How many pokemon have a secondary type?
--    316

    SELECT COUNT(secondary_type) AS st
        -> FROM pokemons
        -> WHERE pokemons.secondary_type IS NOT NULL;