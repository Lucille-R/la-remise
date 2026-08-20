-- Active: 1787135471709@@127.0.0.1@5435@la-remise
CREATE TYPE mode_paiement AS ENUM ('especes', 'carte', 'cheque');
CREATE TYPE lieu_depot AS ENUM ('boutique', 'domicile');
CREATE TYPE etat AS ENUM ('bon etat', 'a reparer' ,'HS');
CREATE TYPE statut AS ENUM ('arrive', 'en reparation', 'en rayon', 'vendu', 'recycle');


CREATE TABLE categorie (
	id SERIAL PRIMARY KEY,
	intitule VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE vente (
	id SERIAL PRIMARY KEY,
	date DATE NOT NULL,
	paiement mode_paiement NOT NULL
);

CREATE TABLE usager (
	id SERIAL PRIMARY KEY,
	nom VARCHAR(50) NOT NULL,
	tel VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL
);

CREATE TABLE competence (
	id SERIAL PRIMARY KEY,
	intitule VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE depot (
	id SERIAL PRIMARY KEY,
	lieu lieu_depot NOT NULL,
	date DATE NOT NULL,
	usager_id INTEGER NOT NULL REFERENCES usager(id)
);

CREATE TABLE benevole (
	id SERIAL PRIMARY KEY,
	date_adhesion DATE NOT NULL,
	usager_id INTEGER NOT NULL REFERENCES usager(id)
);

CREATE TABLE objet (
	num SERIAL PRIMARY KEY,
	type VARCHAR(50) NOT NULL,
	poids NUMERIC(10,2) NOT NULL,
	etat_arrivee etat NOT NULL,
	statut statut NOT NULL,
	date_rayon DATE,
	prix_affiche NUMERIC(10,2),
	prix_paye NUMERIC(10,2),
	depot_id INTEGER NOT NULL REFERENCES depot(id),
	categorie_id INTEGER NOT NULL REFERENCES categorie(id),
	vente_id INTEGER REFERENCES vente(id)
);

CREATE TABLE atelier (
	id SERIAL PRIMARY KEY,
	intitule VARCHAR(50) NOT NULL,
	date DATE NOT NULL,
	duree NUMERIC(10,2) NOT NULL,
	nb_places INTEGER NOT NULL,
	benevole_id INTEGER NOT NULL REFERENCES benevole(id)
);

CREATE TABLE maitrise (
	benevole_id INTEGER NOT NULL REFERENCES benevole(id),
	competence_id INTEGER NOT NULL REFERENCES competence(id),
	PRIMARY KEY (benevole_id, competence_id)
);

CREATE TABLE reparation (
	id SERIAL PRIMARY KEY,
	date DATE NOT NULL,
	resultat BOOLEAN NOT NULL,
	duree NUMERIC(10,2) NOT NULL,
	objet_num INTEGER NOT NULL REFERENCES objet(num),
	benevole_id INTEGER NOT NULL REFERENCES benevole(id)
);

CREATE TABLE inscription (
	atelier_id INTEGER NOT NULL REFERENCES atelier(id),
	usager_id INTEGER NOT NULL REFERENCES usager(id),
	date DATE NOT NULL,
	presence BOOLEAN NOT NULL,
	PRIMARY KEY (atelier_id, usager_id)
);