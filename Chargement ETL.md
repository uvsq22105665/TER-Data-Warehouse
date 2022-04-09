Fadi Mechri 

Fanoa Razafimbelo 



# **Chargement de données dans l’ETL Pentaho**

**Charger les données dans l’ETL :**

-Nous allons charger le fichier movies.csv dans le logiciel Pentaho afin de remplir une table movies créée préalablement dans PostgreSQL.

Nous créons, tout d’abord, une nouvelle Transformation qui va contenir les différentes étapes du traitement des données. Le premier outil à utiliser, correspondant à la première étape, est DataGrid.

Cette étape est configurée en renseignant le dossier où est stocké le fichier à charger.

Puis on appuie sur le bouton Run pour valider l’étape.

-La deuxième étape consiste à lire les données du fichier en utilisant l’outil CSV file input, l’étape précédente et la nouvelle étape sont connectées par un connecteur pour indiquer le processus à suivre.

Nous allons maintenant éditer cette nouvelle étape en renseignant les colonnes du fichier et leur type. Le type de chaque fichier est d’abord définie en tant que String. Dans notre cas, le fichier movies.csv contient 15 colonnes. En exécutant les étapes de cette transformation, les données peuvent maintenant être prévisualisées.

-La prochaine étape consiste à transformer les données en convertissant leur type.
En exécutant la prévisualisation on peut vérifier que les données ont bien été converti.


**Préparation de l’importation dans PostgreSQL :**

On crée un serveur localhost sur PostgreSQL avec un mot de passe que l’on définit. 
Ici on définit le nom sur "localhost" dans l'onglet "General"
Et dans l'onglet Connection : les informations à remplir sont :

 - Host name : localhost 
 - Port : 5432 
 - Maintenance database : postgres
 - Username : postgres 
 - et le mot de passe à renseigner

Ensuite, dans l’onglet localhost > Databases > postgres > Schémas > public > Tables, on créé la table movies qui va recevoir les données.
Dans l’onglet columns on spécifie les noms des colonnes du fichier csv avec leur type :

**Remplissage de la table avec Pentaho :**

On rajoute l’étape « Table output » sur Pentaho que l’on lie aux précédentes étapes pour se connecter à PostgreSQL 

On configure cette étape en créant une nouvelle connexion en appuyant sur le bouton « Wizard » et on définit le nom de la connexion puis on choisit de se connecter à une database de PostgreSQL en native. 

On renseigne le nom de l’hôte et le nom de la base de données à laquelle on veut se connecter (définie précédemment dans PostgreSQL).

On renseigne ensuite l’username et le mot de passe pour se connecter à la base de données et on vérifie que la connexion a bien été effectuée. 


On spécifie la table à remplir dans Target table et on coche « Specify database Fields » pour afficher les colonnes à remplir. On valide la configuration de l’étape et on Run l’ensemble des étapes

On peut maintenant vérifier dans PostgreSQL que la table a bien été remplie en utilisant l’outils « Query tool » qui va permettre d’exécuter une requête sur la table movies, on peut lancer la requête « select \* from movies »

L’exécution de la requête retournent bien des résultats indiquant que la table a bien été remplie

**Remarque :** 

- Sous l’ETL Pentaho, il est possible d’analyser les données, par exemple, l’outil Get Files Rows Count permet de connaitre le nombre de lignes dans le fichier considéré. Dans notre cas, le dataset movies contient 7669 lignes.
- L’outils Univariate Statistics permet d’afficher des mesures du dataset :

Cette étape est configurée en choisissant une mesure à considérer, prenons par exemple le score. Pentaho permet d’afficher la valeur moyenne, le min, le max etc.


De nombreux autres outils sont disponible afin de transformer le dataset comme Row Normaliser, Calculator, sort Rows etc.