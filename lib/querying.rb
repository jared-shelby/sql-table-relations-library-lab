def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year 
  FROM books 
  WHERE books.series_id = (SELECT MIN(id) FROM series) 
  ORDER BY books.year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  WHERE characters.id = (SELECT characters.id FROM characters ORDER BY LENGTH(characters.motto) DESC LIMIT 1);"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) 
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series ON authors.id = series.author_id
  JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series 
  JOIN books ON series.id = books.series_id
  JOIN character_books ON books.id = character_books.book_id
  JOIN characters ON characters.id = character_books.character_id
  WHERE species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  # selects all of the character names 
  # and the number of books they have appeared in, 
  # grouped by character name, 
  # in descending order by number of books and 
  # ascending order by character name
  "SELECT characters.name, COUNT(*)
  FROM characters
  JOIN character_books ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY COUNT(*) DESC, characters.name ASC;"
end
