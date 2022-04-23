/************************************************************************
 * Création des tables de dimensions
 ************************************************************************
 */
Create table DimActor
(
IdActor int primary key identity,
star varchar(50)
)
INSERT INTO DimActor (star) SELECT distinct star FROM MovieData ;

Create table DimCompany
(
IdCompany int primary key identity,
company varchar(max)
)

Create table DimDirector
(
IdDirector int primary key identity,
director varchar(50)
)
INSERT INTO DimDirector (director) SELECT distinct director FROM MovieData ;

Create table DimWriter
(
IdWriter int primary key identity,
writer varchar(50)
)
INSERT INTO DimWriter(writer) SELECT distinct writer FROM MovieData ;

Create table DimMovie
(
IdMovie int primary key identity,
nameMovie varchar(max),
genre varchar(50),
yearMovie varchar(50),
released varchar(50),
rating varchar(50),
country varchar(50)
)
/**utiliser MS SSIS pour remplir DimMovie **/

/************************************************************************
 * Création table de fait
 ************************************************************************
 */
Create table FactMovie
(
IdFact int primary key identity,
IdMovie int foreign key references DimMovie(IdMovie),
IdActor int foreign key references DimActor(IdActor),
IdCompany int foreign key references DimCompany(IdCompany),
IdDirector int foreign key references DimDirector(IdDirector),
IdWriter int foreign key references DimWriter(IdWriter),
score float,
vote float,
gross float,
budget float,
runtime float
)

/** Remplir la table des faits **/ 

insert into FactMovie(idMovie, IdActor, IdCompany, IdDirector, IdWriter, score, vote, gross, budget) 
select idMovie, IdActor, IdCompany, IdDirector, IdWriter, score, vote, gross, budget
from MovieData

/************************************************************************
 * table qui regroupe les données pour remplir la table de fait
 ************************************************************************
 */
Create table MovieData
(
Id int primary key identity,
IdMovie int ,
IdActor int ,
IdCompany int ,
IdDirector int,
IdWriter int ,
director varchar(50),
writer varchar(50),
star varchar(50),
company varchar(max),
nameMovie varchar(max),
genre varchar(50),
yearMovie varchar(50),
released varchar(50),
rating varchar(50),
country varchar(50),
score float,
vote float,
gross float,
budget float,
runtime float
)

/**Remplit IdActor**/
UPDATE MovieData
SET IdActor = (select IdActor from DimActor where MovieData.star = DimActor.star)

/**Remplit IdMovie**/
UPDATE MovieData
SET IdMovie = (select IdMovie from DimMovie where MovieData.nameMovie = DimMovie.nameMovie and MovieData.yearMovie = DimMovie.yearMovie)

/**Remplit IdCompany**/
UPDATE MovieData
SET IdCompany = (select IdCompany from DimCompany where MovieData.company = DimMovie.company)

/**Remplit IdDirector**/
UPDATE MovieData
SET IdDirector = (select IdDirector from DimDirector where MovieData.director = DimDirector.director)

/**Remplit IdWriter**/
UPDATE MovieData
SET IdWriter = (select IdWriter from DimWriter where MovieData.writer = DimWriter.writer)
