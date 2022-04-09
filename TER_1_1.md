Fadi Mechri

Fanoa Razafimbelo

**TER : Entrepôt de données open source**

## **Logiciels identifiés :**

- **Apache Kafka [1] :** Software pour manipuler les flux de données, permet le traitement de données en temps réel
  Apache Kafka se base sur l’enregistrement d'événement (ex : un utilisateur s’enregistre avec son nom, prénom, adresse électronique). Les évènements sont créés par des **producteurs**, (serveurs web, appareil connecté…) et écrivent ces évènements pour les transmettre à Kafka.
  Les **consommateurs** (base de données, Data Lake…) utilise les événements stockés par Kaka pour les exploiter
  **cas d’usage :** 
  finance : bloquer immédiatement les transactions frauduleuse
  sécurité : surveiller continuellement des équipements connectés et donner une alerte en cas d’anomalie
- **MonetDB [2] :** Système de gestion de base de données relationnelle open source orienté colonnes** (similaire à PostgreSQL)
- **Cloudera CDH [3] :** open source
- **Talend Open Studio [4]:** outil ETL open source
- **Pentaho [5] :** outil ETL open source (compatible MonetDB, PostgreSQL etc.)
- **Ora2pg :** outil ETL pour migrer des données d’Oracle vers PostgreSQL ([Ora2pg](https://ora2pg.darold.net))
- **Autre liste d’ETL pour PostgreSQL :** 
  - Pglogical → Copie et insert une base de données PostgreSQL dans un autre système.
  - Panoply  → Extrait automatiquement des données de PostgreSQL.
  - Stitch      → Copie des données de la base de données PostgreSQL à un autre entrepôt de données PostgreSQL.

(cf: <https://blog.panoply.io/10-best-etl-tools-for-postgres>)

## **Importer dataset dans PostgreSQL** :

- **Fichier csv :** 

Il faut tout d’abord créer une table (exemple : la table d’une personne) avec différents attribut (comme l’ID, le nom, le prénom etc …) , puis préparer un fichier de données CSV.

Une fois dans PostgreSQL on utilise les commandes suivante 

**COPY persons(first\_name, last\_name, dob, email)**

**FROM 'C:\sampledb\persons.csv'**

**DELIMITER ','**

**CSV HEADER;**



En fonction du nombre de ligne que vous aurez insérer dans le fichier CSV PostgreSQL renverra le nombre de lignes qu’il a réussi à copier. 

(cf: <https://www.postgresqltutorial.com/import-csv-file-into-posgresql-table/>)



## **Concepts identifiés :**

**Data Lake ou Data Warehouse:**

- **Data Lake** : méthode de stockage massive de données qui peuvent être structuré ou non, filtré ou non et dont le but n’a pas encore été précisé
- **Data Warehouse** : méthode de stockage massive de données filtrés et structuré dans un but spécifique

**ETL :**

- **Extract** : identifie et extrait des données depuis plusieurs sources hétérogènes (fichier, application base de données etc.)
- **Transform** : nettoyer puis standardiser les données, en définissant le format et le mode de stockage ainsi que supprimer les doublons, les anomalies et les données inutilisables. (Pour résumer les deux étapes : convertir les données dans un format exploitable puis les triés et les regroupées par la suite) 
- **Load** : charger les données exploitables vers le DATAWAREHOUSE Pour conclure l’ETL va centraliser toutes les données vers le même endroit (donc vers l'entrepôt de données) et ces données vont être accessibles via les requêtes qui permettent des analyses de type business intelligence. A partir de ces données des rapports pourront être créés. On peut aussi à l’aide de l’ETL migrer des données depuis un ancien système d’information à un nouveau système d’information ce qui facilitera l’exploitation des données.

**Dataset intéressant à exploiter :**

- **Movie Industry:** <https://www.kaggle.com/danielgrijalvas/movies>
- **UEFA Euro Cup (1960-2016) :** contient 4 dataset : les matchs, nombre de fois où chaque équipe a participer à cette compétition, statistiques de chaque équipe, meilleurs buteur de la compétition

<https://www.kaggle.com/jaykumar1607/uefa-euro-cup-19602016?select=Top+Goal+Scorers.csv>

**Documentation :**

[Kafka](https://datascientest.com/apache-kafka)[1]

[MonetDB](https://www.monetdb.org)[2]

[Cloudera CDH](https://www.cloudera.com/products/open-source/apache-hadoop/key-cdh-components.html)[3]

[Talend](https://www.talend.com/fr/products/talend-open-studio/)[4]

[Pentaho](https://www.monetdb.org/documentation-Jan2022/user-guide/client-interfaces/client-tools/pentaho/)[5]

[postgre](https://severalnines.com/database-blog/running-data-warehouse-postgresql)[5]

<https://www.narrator.ai/blog/using-postgresql-as-a-data-warehouse/>
