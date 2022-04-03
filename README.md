# Projet TER Entrepot de données Open Source

L'objectif de ce projet est d'étudier quelques solutions open source pour construire un entrepôt de données et effectuer des analyses sur ces données.

# Tâches à réaliser
 - Effectuer un panorama des principaux outils open source 
 - Selectionner un ensembe d'outils 
 - Réaliser un démonstrateur à partur d'un jeu de
   données
   
# Identification des logiciels et préliminaires
Le fichier TER_1_1.md résume la phase préliminaire du projet qui consiste à identifier quelques logiciels open source, définit les mots-clés du projet et contient les datasets intéressant à étudier.
Pour la réalisation et le succès de ce projet nous avons dans un premier temps re-grouper toute les information qui concernent Les entrepôts de données. 
Nous avons identifié les logiciels suivants:
* Apache Kafka
* MonetDB
* Cloudera
* Talend Open Stuido
* pentaho
* Ora2pg

Dans la suite du projet, nous avons décidé d'utiliser l'ETL open-source Pentaho et PostgreSQL
# Présentation du jeu de données

Le jeu de données que nous allons utiliser à travers ce projet provient du site kaggle, un site qui regroupe des jeu de données créées par des utilisateurs.
Le jeu de données se nomme "Movie Industry" et a été créé à partir de données fournit par le site "Internet Movie Datase" (IMDb).
Ce jeu de données regroupe 7669 films de 1986 à 2020. Pour chaque année, il y a environ 220 films enregistrés.
Le fichier est composé de 15 colonnes :

 - name : nom du film
 - rating : classification du film
 - genre : genre du film
 - year : l'année de sortie
 - released : la date de sortie 
 - score : la note IMDb
 - votes : le nombre de note donné par les utilisateur de IMDb
 - director : nom et prénom du réalisateur
 - writer : auteur du film
 - star : acteur/actrice principale
 - country : pays d'origine
 - budget
 - gross : profit
 - company : société de production
 - runtime : longueur du film

# Processus utilisé

Le processus d'extraction des données des systèmes sources et de leur transfert dans l'entrepôt de données est communément appelé ETL, qui signifie extraction, transformation et chargement. 

## LES différentes étapes de l'ETL

### Extraction

* La première étape de l'ETL est l'extraction. Au cours de l'extraction, les données sont spécifiquement identifiées et ensuite prélevées à de nombreux endroits différent. Ces données peuvent provenir d’une variété de choses, comme des fichiers, des feuilles de calcul, des systèmes de bases de données et des applications, etc. 

* Dans notre cas on se basera sur un fichier .csv

### Transformation

* La prochaine étape du processus ETL est la transformation. Une fois les données extraites, elles doivent être physiquement transportées vers la destination cible et converties dans le format approprié. Cette transformation de données peut inclure des opérations telles que le nettoyage, l'assemblage et la validation des données.

### Chargement

La dernière étape du processus ETL consiste à charger les données transformées dans la cible de destination. Cette cible peut être une bases de données ou un Data Warehouse.

La transformation applique les règles définies en interne. Les normes qui garantissent la qualité des données et leur accessibilité doivent tenir compte des pratiques suivantes :

* Standardisation : Définir les données à traiter, leur format et leur mode de stockage ainsi que d'autres considérations de base qui définiront les étapes qui suivent.
* Déduplication : Transmettre un rapport sur les doublons aux personnes chargées de la gouvernance des données ; exclure et/ou supprimer les données redondantes
* Vérification : Effectuer des vérifications automatisées pour comparer des données similaires telles que durée de transaction ou suivi des accès. Les tâches de vérification permettent d'éliminer les données inutilisables et de signaler les anomalies des systèmes, des applications ou des données.
* Tri : Maximiser l'efficacité des data Warehouse en regroupant et stockant les objets par catégorie (données brutes, données audio, mails, etc.). Vos règles de transformation ETL conditionnent la catégorisation de chaque objet et sa prochaine destination. Le processus ETL est parfois utilisé pour générer des tables d'agrégation qui sont ensuite proposées dans des rapports de base ; dans ce cas, vous devez trier puis agréger les données.

