-- Q1 : Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?
SELECT COUNT(depot.id) AS nb_depot,
	SUM(objet.poids) AS poids_total
FROM depot
JOIN objet ON depot.id = objet.depot_id
WHERE date BETWEEN '2026-07-01' AND '2026-07-31';
-- Donc 3 dépôts le mois dernier (juillet 2026) pour un poids total de 23,50 kg


-- Q2 : Quels objets sont actuellement en rayon, et depuis combien de temps ?
SELECT type, statut,
	date_rayon, CURRENT_DATE, 
	AGE(CURRENT_DATE, date_rayon) AS duree_rayon
FROM objet
WHERE statut = 'en rayon';


-- Q3 : Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?
SELECT categorie.intitule,
	COUNT(objet.categorie_id) AS nb_vendu
FROM objet
JOIN categorie ON categorie.id = objet.categorie_id
WHERE statut = 'vendu'
GROUP BY categorie.intitule
ORDER BY nb_vendu DESC;
-- La catégorie 'hightech' se vend le mieux


-- Q4 : Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?
-- Je considère l'année courante 2026 comme "cette année", donc à partir du 2026-01-01 
SELECT SUM(duree) AS total_h
FROM reparation
WHERE date > '2026-01-01';
-- Donc 6,50h consacrées à la réparation depuis le début de l'année


-- Q5 : Quel est le taux de réussite des réparations, par bénévole et globalement ?
-- Taux de réussite global :
SELECT COUNT(*) FILTER(WHERE resultat = true) AS rep_reussies,
	COUNT(*) AS rep_totales,
	ROUND( (COUNT(*) FILTER(WHERE resultat = true))::NUMERIC / COUNT(*)  * 100 , 2) AS taux_reussite_global
FROM reparation;

-- Taux de réussite individuel :
SELECT usager.nom,
	COUNT(reparation.id) FILTER(WHERE reparation.resultat = true) AS rep_reussies,
	COUNT(reparation.id) AS rep_totales,
	ROUND( (COUNT(reparation.id) FILTER(WHERE reparation.resultat = true))::NUMERIC / COUNT(reparation.id)  * 100 , 2) AS taux_reussite_individuel
FROM reparation
JOIN benevole ON reparation.benevole_id = benevole.id
JOIN usager ON benevole.usager_id = usager.id
GROUP BY usager.nom;


-- Q6 : Quelles personnes nous ont fait plus de trois dépôts ?
SELECT usager.nom,
	COUNT(depot.usager_id) AS nb_depot
FROM depot
JOIN usager ON depot.usager_id = usager.id
GROUP BY usager.nom
HAVING COUNT(depot.usager_id) > 3
ORDER BY nb_depot DESC;


-- Q7 : Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?
SELECT SUM(poids) AS poids_total_detourne
FROM objet
WHERE statut != 'recycle';


-- Q8 : Quel est le taux de présence réelle sur nos ateliers ?
SELECT COUNT(*) FILTER (WHERE presence = true) AS presences_reelles,
	COUNT(*) AS nb_inscriptions,
	ROUND((COUNT(*) FILTER (WHERE presence = true))::NUMERIC / COUNT(*) * 100, 2) AS taux_presence
FROM inscription;


-- Q9 : Quels bénévoles ont la compétence « électricité » et sont disponibles pour animer un atelier ?
-- Je n'ai pas géré la disponibilité des bénévoles...
SELECT competence.intitule,
	maitrise.benevole_id,
	usager.nom
FROM competence
JOIN maitrise ON competence.id = maitrise.competence_id
JOIN benevole ON maitrise.benevole_id = benevole.id
JOIN usager ON benevole.usager_id = usager.id
WHERE competence.intitule = 'electricite';


-- Q10 : Quels objets sont en rayon depuis plus de six mois et devraient être sortis ?
SELECT type, date_rayon, statut, CURRENT_DATE
FROM objet
WHERE statut = 'en rayon'
	AND AGE(CURRENT_DATE, date_rayon) > INTERVAL '6 months';