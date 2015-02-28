
/* --------------------------------------------------------------------------
Cours EDM4600 .Travail I.
-Théme: Dessin d'un montre.
------BigEyedMonster.
------Réalisé par Abbaci Hocine.
------Sous la direction de monsieur Thomas O Fredericks.
------chargé de cours-Algorithme de base et intéractivité.
------programme médias interactifs----UQAM--Février 2012.
-------------------------------------------------------------------------- */


/*REMARQUE¨-POUR RESPECT DES CONSIGNES UTILISATION JUSTE DES 
SCRIPTS VUS ET ETUDIES EN CLASSE*/



// Déclaration des variables pour contrôler  la position du monstre .

float y=width *0.25;
float x= height *0.25;

/* Déclaration d'une variable pour changer l'apparence du monstre ;
valeurs intéressantes entre  85 et 135 */

float Aspect=105;

// Déclaration d'une variable "conditionnelle" pour contrôler  la boucle "while".

float d = 200;
float difference =1;

/* Control de la couleur de certaines parties du corps du monstre ainsi, C1,C2 et C3 
sont respectivement liées aux canaux,R,G et B.*/

float C1 = 105;
float C2 = 15;
float C3 = 15;

// Control du torso et du manteau  noir enveloppant le monstre.

float h=25; 

// Control de l'aspect de la coupe de cheveux;

float T1= 28;
float T2= 35;


/*-----------------Fin de la déclaration des variables----------------*/


// Configuration de la la scene
size(400,400);
smooth();
noStroke();

/* Arrière  plan avec un joli ciel bleu et un pavé blanc.Le rectangle 
blanc masque mes ellipses blanches : à défaut de l'existence
d’opérations booléennes  pour des formes plus élaborées ,un trompe-l'œil s'impose pour dessiner les pinces et les dents ....*/

// Ciel bleu.

background(#7394F2);

// Pavé blanc surtout pour masquer certaines ellipses blanches .

rectMode(CENTER);
rect(200,400,400,400);

/*-----------------Fin de la configuration de la scene----------------*/

ellipseMode(CENTER);
noStroke();

// Dessin du monstre.

//Pied gauche.

  pushMatrix(); // Sauvegarder la matrice de transformation
  translate(x, y); // Déplacer la forme a dessiner
  rotate(radians(-105)); // Effectuer la rotation
  fill(C1-27,C2,C3);
  ellipse(-185, 10, 46, 95);
  rotate(radians(-4)); // Effectuer la rotation
  fill(C1+4,C2,C3);
  ellipse(-185, 20, 46, 95);
  translate(-130, -285);
  rotate(radians(-66.5));
  fill(C1-27,C2,C3);
  ellipse(-240, -5, 65, 95); 
  fill(C1+14,C2,C3);
  ellipse(-250, -14, 47, 87);  
  ellipse(-230, -14, 47, 87);
  fill(C1-27,C2,C3);
  ellipse(-240, -26, 39, 69);
  fill(255);
  ellipse(-240, -30, 37, 67);
  popMatrix(); 


//Pied droit.

  pushMatrix(); // Sauvegarder la matrice de transformation
  translate(x, y); // Déplacer la forme a dessiner
  rotate(radians(-105)); // Effectuer la rotation
  translate(-280, -25);
  rotate(radians(-85.0));
  fill(C1-27,C2,C3);
  ellipse(-230, 85, 55, 95);
  ellipse(-240, -5, 65, 95); 
  fill(C1+14,C2,C3);
  ellipse(-250, -14, 47, 87);
  ellipse(-230, -14, 47, 87);
  fill(C1-27,C2,C3);
  ellipse(-240, -26, 39, 69);
  fill(255);
  ellipse(-240, -30, 32, 70);
  popMatrix(); 

//Cheveux.
   
   fill ( d / width * 044);
   ellipse( x+180 , y+4, T1 , T2 );
   ellipse( x+165 , y+6, T1 , T2 );
   ellipse( x+150 , y+8, T1 , T2 );
   ellipse( x+135 , y+14, T1-2 , T2 );  
   ellipse( x+135 , y+20, T1-4 , T2 );
   ellipse( x+195 , y+6, T1 , T2 );
   ellipse( x+210 , y+8, T1 , T2 );
   ellipse( x+225 , y+14, T1-2 , T2 );


/*Dessin des autres parties du corps du monstre avec le souci d'appliquer des dégradés
pour une meilleur esthétique d'ou l'usage de la boucle "while" */

while ( d > Aspect) {
  
 //  Torso avec dégradé  rouge.
 
   fill ( d / width * 255,0,0 );
   ellipse( x+180 , y+120 , d+h , d );
   d = d - difference;
   fill ( d / width * 255,d / width * 122,d / width * 114 );
   ellipse( x+180 , y+120 , d+14 , d-17 ); 
   fill ( d / width * 844);
   ellipse( x+180 , y+130 , d+10 , d-35 );
   fill (14);
   ellipse( x+180 , y+130 , d+60 , d-30 );
      
   // Oeil-Iris.
   
   fill ( d / width * 444);
   ellipse( x+180 , y+119 , d , d-40 );
   fill ( d / width * 744);
   ellipse( x+180 , y+130 , d , d-47 );
   
   // Oeil-Pupille.
   fill ( d / width * 044);
   ellipse( x+180 , y+130 , 45 , 45 );
   
   
    // Bouche.
   fill ( 155);
   ellipse( x+180 , y+200 , 90 , 37);
   fill ( 255);
   ellipse( x+180 , y+204 , 90 , 41);
   
   // Dents.
   
   fill(C1-17,C2,C3);
   ellipse( x+180 , y+194 , 66 , 35);
   fill ( 255);
   ellipse( x+180 , y+200 , 36 , 35);
   
}


/*--------------------------Fin du script-------------------------*/
  
/* --------------------------------------------------------------------------
Travail I-Théme: Dessin d'un montre.
Par Abbaci Hocine------médias interactifs----UQAM--Février 2012.
-------------------------------------------------------------------------- */
  
