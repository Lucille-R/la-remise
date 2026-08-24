# Ressourcerie La Remise

La Remise est une ressourcerie associative. Le principe : au lieu de partir à la déchetterie, les objets dont les gens n'ont plus l'usage sont collectés, triés, réparés quand c'est possible, puis revendus à petit prix dans la boutique de l'association. Ce qui ne peut pas être sauvé part en filière de recyclage.

L'association fonctionne avec deux salariées et une trentaine de bénévoles. Elle organise aussi des ateliers ouverts au public : réparer son grille-pain, retaper un meuble, apprendre à recoudre.


## 📝 Description
Ce projet consiste à concevoir et implémenter la base de données relationnelle de La Remise.  

Le travail suit quatre phases : recensement des données et décisions de conception, schéma entité-association, passage au schéma relationnel, puis implémentation SQL (migrations, jeu de données, requêtes).  

Cette base sert de socle au projet fullstack AdaRemise, développé ultérieurement en React et Express.


## ✨ Fonctionnalités

### La conception
- [x] Dictionnaire des données (.md)
- [x] Liste des décisions (.md)
- [x] Schéma entité-association (.png)
- [x] Arbre des dépendances (.png)
- [x] Schéma relationnel (.md)

### La base de données
- [x] Fichier migration_up.sql
- [x] Fichier migration_down.sql
- [x] Fichier seed.sql avec : au minimum 8 catégories, 10 personnes, 12 bénévoles, 40 objets à différents statuts, 15 réparations, 10 ventes, 4 ateliers et leurs inscriptions.
- [x] Fichier queries.sql avec : les 10 questions de la section 04, une requête chacune, commentée.


## 🛠️ Technologies utilisées
- draw.io *(schéma entité-association et arbre des dépendances)*
- PostgreSQL 16
- Docker / Docker Compose
- SQL (DDL, DML)


## 📂 Structure du projet

```
la-remise/
  ├── README.md
  ├── docker-compose.yml
  ├── conception/
  │   ├── dictionnaire.md
  │   ├── decisions.md
  │   ├── schema-ea.png
  │   ├── schema-relationnel.md
  │   └── arbre-dependances.png
  ├── migration_up.sql
  ├── migration_down.sql
  ├── seed.sql
  └── queries.sql
```

## 🚀 Installation
1. Cloner le repository :
   ```bash
   git clone git@github.com:Lucille-R/la-remise.git
   ```

2. Se rendre dans le dossier du projet :
   ```bash
   cd la-remise
   ```

3. Lancer le conteneur PostgreSQL :
```bash
   docker compose up -d
```
   Au premier démarrage, `migration_up.sql` est exécuté automatiquement (création des types ENUM et des tables).  

4. Charger le jeu de données de test :
```bash
   docker exec -i la-remise-db psql -U lr -d la-remise < seed.sql
```

Pour repartir de zéro :
```bash
docker compose down -v
docker compose up -d
```
(le volume est supprimé, `migration_up.sql` est rejoué automatiquement au prochain démarrage - il faut ensuite recharger `seed.sql`)


## 💻 Utilisation

Une fois la base initialisée et le seed chargé, les requêtes répondant aux besoins de La Remise (section 04 du cahier des charges) sont disponibles dans `queries.sql` :

```bash
docker exec -i la-remise-db psql -U lr -d la-remise < queries.sql
```

Chaque requête est commentée avec la question métier à laquelle elle répond.


## 🌳 Workflow Git

Ce projet suit une organisation en branches inspirée de Git Flow :

- `main` : version stable du projet
- `dev` : branche d'intégration des fonctionnalités
- `feature/nom-de-la-feature` : une branche par fonctionnalité développée

## 👤 Auteur

- **Lucille** — Étudiante chez Ada Tech School

## 📄 Licence

Projet réalisé dans un cadre pédagogique — Ada Tech School.