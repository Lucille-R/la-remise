# Schéma relationnel

## Niveau 0 de l'arbre des dépendances
```sql
CATEGORIE(idCategorie, intituleCategorie)
VENTE(idVente, dateVente, modePaiement)
USAGER(idUsager, nomUsager, telUsager, mailUsager)
COMPETENCE(idCompetence, intituleCompetence)

-- La règle R1 est appliquée sur ces 4 premières tables car elles se situent tout en haut de l'arbre des dépendances. 
```


## Niveau 1 de l'arbre des dépendances

```sql
DEPOT(idDepot, lieuDepot, dateDepot, #idUsager)
-- USAGER 0,N - Faire - DEPOT 1,1
-- Cas 1,1 donc R2 : DEPOT porte le max=1 donc reçoit la FK
```

```sql
BENEVOLE(idBenevole, dateAdhesion, #idUsager)
-- USAGER 0,1 - Etre - BENEVOLE 1,1
-- Cas 1,1 donc R2 : BENEVOLE porte le min=1 et le max=1 donc reçoit la FK
```


## Niveau 2 de l'arbre des dépendances

```sql
OBJET(numObjet, typeObjet, poids, etatArrivee, statut, dateRayon, prixAffiche, prixPaye, #idDepot, #idCategorie, #idVente)
-- DEPOT 1,N - Contenir - OBJET 1,1
-- Cas 1,1 donc R2 : OBJET porte le max=1 donc reçoit la FK

-- CATEGORIE 0,N - Classer - OBJET 1,1
-- Cas 1,1 donc R2 : OBJET porte le max=1 donc reçoit la FK

-- OBJET 0,1 - Concerner - VENTE 1,N
-- Cas 0,1 donc R2 : OBJET porte le max=1 donc reçoit la FK
```

```sql
ATELIER(idAtelier, intituleAtelier, dateAtelier, dureeAtelier, nbPlaces, #idBenevole)
-- BENEVOLE 0,N - Animer - ATELIER 1,1
-- Cas 1,1 donc R2 : ATELIER porte le max=1 donc reçoit la FK
```

```sql
MAITRISE(#idBenevole, #idCompétence)
-- BENEVOLE 0,N - Maîtriser - COMPETENCE 0,N
-- Cas N,N donc R3 : BENEVOLE et COMPETENCE porte un max=N, on crée alors la nouvelle table, au nom de l'association, avec une clé primaire composite
```

## Niveau 3 de l'arbre des dépendances

```sql
REPARATION(idReparation, dateReparation, dureeReparation, resultatReparation, #numObjet, #idBenevole)
-- OBJET 0,N - Nécessiter - REPARATION 1,1
-- Cas 1,1 donc R2 : REPARATION porte le max=1 donc reçoit la FK

-- BENEVOLE 0,N - Effectuer - REPARATION 1,1
-- Cas 1,1 donc R2 : REPARATION porte le max=1 donc reçoit la FK
```

```sql
INCRIPTION(#idAtelier, #idUsager, dateInscription, presence)
-- USAGER 0,N - Inscription - ATELIER 0,N
-- Cas N,N donc R3 : USAGER et ATELIER porte un max=N, on crée alors la nouvelle table, au nom de l'association, avec une clé primaire composite : #idAtelier et #idUsager
```