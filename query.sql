use gestion_club_jeux_video ;
/*Requêtes de Base*/
/*Lister les informations de tous les membres (pseudo, e-mail, date d'inscription).*/
select * from membre ;
/*Afficher la liste des jeux disponibles, avec leur titre, genre, et studio de développement.*/
select id , titre , studio_developement , genre from Jeu ;
/*Afficher les détails d'un tournoi spécifique à partir de son nom.*/
select * from tournoi where nom_tournoi = "winter Cup";
/*Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu.*/
select distinct jeu.titre, membre.pseudo from
membre , emprunter , jeu 
where membre.id = emprunter.member_id 
AND jeu.id = emprunter.jeu_id ;
/* Requêtes avec Jointures*/
/*Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final.*/
 select * from membre ;
 select * from tournoi ;
 show tables;
select * from participe ;

-- Trouver les membres qui ont souscrit à un abonnement annuel.
select * from membre left join abonnement on membre.abonnement_id = abonnement.id where abonnement.type_abonnement = 'annuel';


-- Trouver les jeux empruntés par un membre spécifique (via son pseudo)
select distinct jeu.id ,jeu.titre  from jeu 
inner join emprunter on jeu.id = emprunter.jeu_id 
inner join membre on membre.id = emprunter.member_id 
where membre.pseudo = 'ProPlayer';
-- Lister tous les emprunts, en incluant le pseudo du membre et les informations sur le jeu (titre et studio de développement).
select distinct jeu.titre , jeu.studio_developement , membre.pseudo , emprunter.*
from emprunter 
left join jeu on jeu.id = emprunter.jeu_id 
inner join membre on membre.id = emprunter.member_id ;
select * from emprunter ;
-- Afficher la liste des membres et le type d'abonnement auquel ils sont associés.
select membre.* , abonnement.type_abonnement
from membre left join abonnement on membre.abonnement_id = abonnement.id ;
-- Requêtes avec Agrégation
-- Calculer le nombre total de jeux disponibles par genre.
select genre , count(genre) from jeu 
group by genre ;
-- Trouver le tournoi avec le plus grand nombre de participants.
SELECT tournoi_id, COUNT(tournoi_id) AS participe_total
FROM participe
GROUP BY tournoi_id
HAVING COUNT(tournoi_id) = (
    SELECT MAX(cnt) 
    FROM (
        SELECT COUNT(tournoi_id) AS cnt
        FROM participe
        GROUP BY tournoi_id
    ) AS subquery
);
-- Afficher le nombre d'emprunts réalisés par chaque membre.
select * from emprunter ;
select  member_id , count(id) from emprunter group by member_id ;


select * from participe ;
select * from membre ;
select * from tournoi ; 


