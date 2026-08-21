-- Suppression des tables d'abord, et dans l'ordre inverse de leur création :
DROP TABLE IF EXISTS inscription;
DROP TABLE IF EXISTS reparation;
DROP TABLE IF EXISTS maitrise;
DROP TABLE IF EXISTS atelier;
DROP TABLE IF EXISTS objet;
DROP TABLE IF EXISTS benevole;
DROP TABLE IF EXISTS depot;
DROP TABLE IF EXISTS competence;
DROP TABLE IF EXISTS usager;
DROP TABLE IF EXISTS vente;
DROP TABLE IF EXISTS categorie;

-- Suppression des types ensuite :
DROP TYPE IF EXISTS statut;
DROP TYPE IF EXISTS etat;
DROP TYPE IF EXISTS lieu_depot;
DROP TYPE IF EXISTS mode_paiement;