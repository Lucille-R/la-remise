# Dictionnaire des données

| Nom | Description | Type | Taille | Contraintes | Remarques |
| --- | ----------- | ---- | ------ | ----------- | --------- |
|lieuDépôt | lieu de dépôt des objets récupérés | Enum | ... | Obligatoire | 'boutique', 'domicile' |
| dateDépôt | date du dépôt | Date | ... | Obligatoire | ... |
|nomUsager | nom de l'usager | Texte | 50 | Obligatoire | ...|
| télUsager | N° tél de l'usager | Texte | Min 13 | Obligatoire | ... |
| numObjet | Numéro de l'étiquette de l'objet | Numérique | ... | Identifiant, Obligatoire | ... |
| typeObjet | ce qu'est l'objet | Texte | ... | Obligatoire | ... |
| intituléCatégorie | Catégorie de classement de l'objet | Texte | ... |Obligatoire | ... |
| étatArrivée | état de l'objet à son arrivée | Enum | ... |Obligatoire | 'Bon état', 'A réparer', 'HS' |
| poids | poids de l'objet | Numérique | ... | Obligatoire | En kg |
| dateRayon | date de la mise en rayon de l'objet | Date | ... | Obligatoire | ... |
| statutObjet | statut de l'objet | Enum | ... | Obligatoire | 'arrivé', 'en réparation', 'en rayon', 'vendu', 'recyclé' |
| duréeRéparation | durée de la réparation | Numérique | ... | Obligatoire | En heure |
| dateRéparation | date de la réparation | Date | ... | Obligatoire | ... |
| résultatRéparation | réparation réussie ou non | Booléen | ... | Obligatoire | Réussie ou échouée |
| prixAffiché | prix affiché de l'objet | Numérique | ... | Obligatoire | En euro |
| dateVente | date de la vente | Date | ... | Obligatoire | ... |
| prixPayé | prix de vente réellement payé | Numérique | ... | Obligatoire | En euro |
| modePaiement | mode de paiement | Enum | ... | Obligatoire | 'espèces', 'carte', 'chèque' |
| mailUsager | coordonnées mail de l'usager adhérent | Texte | ... | Obligatoire | ... |
| dateAdhésion | date d'adhésion de l'adhérent | Date | ... | Obligatoire | ... |
| intituléCompétence | intitulé de la compétence | Texte | ... | ... | ... |
| intituléAtelier | intitulé de l'atelier proposé | Texte | ... | Obligatoire | ... |
| dateAtelier | date de l'atelier | Date | ... | Obligatoire | ... |
| duréeAtelier | durée de l'atelier | Numérique | ... | Obligatoire | En heure |
| nbPlaces | nombre de places de l'atelier | Numérique | ... | Obligatoire | ... |
| présence | présence effective à l'atelier | Booléen | ... | Obligatoire | ... |
| dateInscription | date de l'inscription à l'atelier| Date | ... | Obligatoire | ... |