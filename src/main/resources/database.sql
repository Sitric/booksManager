CREATE SCHEMA IF NOT EXISTS test DEFAULT CHARACTER SET utf8;
USE test;
-- Table

CREATE TABLE IF NOT EXISTS book (
  id            INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title         VARCHAR(100) NOT NULL,
  description   VARCHAR(255) NOT NULL,
  author        VARCHAR(100) NOT NULL,
  isbn          VARCHAR(20)  NOT NULL,
  printYear     INT          NOT NULL,
  readAlready   tinyint NOT NULL DEFAULT 0
)
  ENGINE = InnoDB;

-- Insert data

INSERT INTO book VALUES (1,
                         'To Kill a Mockingbird',
                         'The unforgettable novel of a childhood in a sleepy Southern town and the crisis
                         of conscience that rocked it, To Kill A Mockingbird...',
                         'Harper Lee',
                         '978-0446310789',
                         1988,
                         0);

INSERT INTO book VALUES (2,
                         'Romeo and Juliet',
                         'One of Shakespeare most popular and accessible plays, Romeo and Juliet tells the story
                          of two star-crossed lovers and the unhappy fate that befell them as a result...',
                         'William Shakespeare',
                         '978-0486275574',
                         1993,
                         0);

INSERT INTO book VALUES (3,
                         'The Great Gatsby',
                         'Here is a novel, glamorous, ironical, compassionate – a marvelous fusion into unity
                         of the curious incongruities of the life of the period – which reveals a hero...',
                         'F. Scott Fitzgerald',
                         '978-0743273565',
                         2004,
                         0);

INSERT INTO book VALUES (4,
                         'The Catcher in the Rye',
                         'The hero-narrator of The Catcher in the Rye is an ancient child of sixteen,
                         a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult,
                         secondhand description...',
                         'J.D. Salinger',
                         '978-7543321724',
                         1991,
                         0);

INSERT INTO book VALUES (5,
                         'The Scarlet Letter',
                         'In Nathaniel Hawthornes dark novel, The Scarlet Letter, a single sinful act ruins
                         the lives of three people. None more so than Hester Prynne, a young, beautiful,
                          and dignified...',
                         'Nathaniel Hawthorne',
                         '978-0486280486',
                         1994,
                         0);

INSERT INTO book VALUES (6,
                         'Animal Farm',
                         'As ferociously fresh as it was more than a half century ago, this remarkable allegory
                         of a downtrodden society of overworked, mistreated animals, and their quest
                         to create...',
                         'George Orwell',
                         '978-8187138754',
                         2004,
                         0);

INSERT INTO book VALUES (7,
                         'Lord of the Flies',
                         'At the dawn of the next world war, a plane crashes on an uncharted island, stranding
                         a group of schoolboys. At first, with no adult supervision, their freedom is something
                         to celebrate...',
                         'William Golding',
                         '978-0399501487',
                         2003,
                         0);

INSERT INTO book VALUES (8,
                         'The Crucible',
                         'I believe that the reader will discover here the essential nature of one of the strangest
                         and most awful chapters in human history," Arthur Miller wrote of his classic play about...',
                         'Arthur Miller',
                         '978-0142437339',
                         2003,
                         0);

INSERT INTO book VALUES (9,
                         'Of Mice and Men',
                         'The compelling story of two outsiders striving to find their place in an unforgiving world.
                         Drifters in search of work, George and his simple-minded friend Lennie have nothing...',
                         'John Steinbeck',
                         '978-0140177398',
                         1993,
                         0);

INSERT INTO book VALUES (10,
                         'Hamlet',
                         'Among Shakespeares plays, "Hamlet" is considered by many his masterpiece. Among actors,
                         the role of Hamlet, Prince of Denmark, is considered the jewel in the crown of...',
                         'William Shakespeare',
                         '978-1980760078',
                         2018,
                         0);

INSERT INTO book VALUES (11,
                         'The Grapes of Wrath',
                         'First published in 1939, Steinbeck’s Pulitzer Prize winning epic of the Great Depression
                          chronicles the Dust Bowl migration of the 1930s and tells the story of one Oklahoma farm
                          family, the Joads...',
                         'John Steinbeck',
                         '978-0143039433',
                         2006,
                         0);

INSERT INTO book VALUES (12,
                         'Macbeth',
                         'Folger Shakespeare Library: the world''s leading center for Shakespeare studies.
                          Each edition includes: Freshly edited text based on the best early printed
                          version of the play;...',
                         'William Shakespeare',
                         '978-0743477109',
                         2003,
                         0);
