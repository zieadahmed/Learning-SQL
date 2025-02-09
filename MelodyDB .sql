create database MelodyDB
use MelodyDB
CREATE TABLE musician (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    phone VARCHAR(20),
    St VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE instrument (
    Name VARCHAR(255) PRIMARY KEY,
    Key_Type VARCHAR(255) 
);

CREATE TABLE song (
    ID INT PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(100),
    author VARCHAR(100)
);

CREATE TABLE album (
    ID INT PRIMARY KEY,
    title VARCHAR(255),
    cr_date DATE
);

CREATE TABLE musician_instrument (
    musician_ID INT,
    instrument_Name VARCHAR(255),
    PRIMARY KEY (musician_ID, instrument_Name),
    FOREIGN KEY (musician_ID) REFERENCES musician(ID),
    FOREIGN KEY (instrument_Name) REFERENCES instrument(Name)
);

CREATE TABLE musician_song (
    musician_ID INT,
    song_ID INT,
    PRIMARY KEY (musician_ID, song_ID),
    FOREIGN KEY (musician_ID) REFERENCES musician(ID),
    FOREIGN KEY (song_ID) REFERENCES song(ID)
);

CREATE TABLE musician_album (
    musician_ID INT,
    album_ID INT,
    PRIMARY KEY (musician_ID, album_ID),
    FOREIGN KEY (musician_ID) REFERENCES musician(ID),
    FOREIGN KEY (album_ID) REFERENCES album(ID)
);

CREATE TABLE album_song (
    album_ID INT,
    song_ID INT,
    PRIMARY KEY (album_ID, song_ID),
    FOREIGN KEY (album_ID) REFERENCES album(ID),
    FOREIGN KEY (song_ID) REFERENCES song(ID)
);
