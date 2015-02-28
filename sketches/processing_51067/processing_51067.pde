
/*
------------------------------------------------
TP1 - Monstre
Par : Zachary Labrosse Rémillard

------------------------------------------------
*/


//Déclaration des variables de position
float x;
float y;

//Configuration de la scène
size(400,400);
smooth();

//Positionner au centre de la scène
x = width/2;
y = width/2;

//Couleur d'arriere plan
background(255);

//Épaosseur du trait
strokeWeight(3);

//######################################
//Dessiner les bras
//######################################
//Déclaration de variables de centre pour les bras
float xBras=x-35;
float yBras=y+185;
fill(0,180,0);
ellipse(xBras,yBras,150,200);
ellipse(xBras+70,yBras,150,200);


//######################################
//Dessiner le corps
//######################################
//Déclaration de variables de centre pour le corps
float xCorps=x;
float yCorps=y+200;

fill(0,180,0);
ellipse(xCorps,yCorps,175,300);

//Dessin du ventre
noStroke();  //Retrait du contour
fill(255,255,0);
ellipse(xCorps,yCorps,125,225);




//######################################
//Dessiner la forme de la tête
//######################################
fill(0,180,0);
stroke(0);

beginShape();
curveVertex(x-80,  y+110);
curveVertex(x,     y+110);
curveVertex(x+70,  y+80);
curveVertex(x+80,  y);
curveVertex(x+45,  y-100);
curveVertex(x-45,  y-100);
curveVertex(x-80,  y);
curveVertex(x-70,  y+80);
curveVertex(x,     y+110);
curveVertex(x+80,  y+110);
endShape();


//######################################
//Dessiner les yeux
//######################################
//Déclaration du diamètre des yeux
float d = 100;
float step = 5;

//Déclaration de variables de centre pour les yeux
float xOeil=x-50;
float yOeil=y-20;
noStroke();


//Boucle for pour dessiner les deux yeux
for(int i=0;i<2;i++){
   while ( d > 5 ) { //Boucle créant un effet de dégradé pour les yeux 
     fill (325-d / 200 * 255 ); //Calcul permettant d'avoir la teinte de dégradé voulue
     ellipse( xOeil , yOeil , d , d );
     d = d - step;
  }
  d=100;
  xOeil= xOeil+d;
}

//Dessin des pupilles
//Réinitialiser x et y de l'oeil
xOeil=x-50;
yOeil=y-20;
stroke(0);
strokeWeight(0);


//Oeil gauche
fill(0);
ellipse(xOeil, yOeil, 25, 25);
fill(255);
ellipse(xOeil, yOeil, 10, 10);


//Oeil droit
fill(0);
ellipse(xOeil+d, yOeil, 25, 25);
fill(255);
ellipse(xOeil+d, yOeil, 12, 12);

//Contour des yeux
noFill();
strokeWeight(3);
ellipse(xOeil, yOeil, d, d);
ellipse(xOeil+d, yOeil, d, d);


//######################################
//Dessiner les narines
//######################################
//Déclaration de variables de centre pour les narines
float xNarine=x;
float yNarine=y+20;
fill(0);
noStroke();
ellipse(xNarine-6, yOeil+50, 7, 7);
ellipse(xNarine+6, yOeil+50, 7, 7);


//######################################
//Dessiner la bouche
//######################################
//Déclaration de variables de centre pour la bouche
float xBouche=x;
float yBouche=y+80;
stroke(0);
strokeWeight(7);

line(xBouche-67,yBouche,xBouche+67,yBouche);


//######################################
//Dessiner le chapeau
//######################################
float xChapeau=x-6;
float yChapeau=y-86;
float xCheveux = -42;
float cptCheveux = 1;
strokeWeight(3);


//Dessin et rotation de tous les éléments constituants le chapeau et les cheveux
pushMatrix(); 
translate(xChapeau,yChapeau);
rotate(TWO_PI-PI/20);

//Cheveux
noStroke();
fill(0,100,0);
//Boucle dessinant les cheveux avec longueur aléatoire
while(cptCheveux<=10){
  ellipse(xCheveux, random(-10),10,40);
  xCheveux+=10;
  cptCheveux++;
}


stroke(0);
//Partie bleue
fill(0,0,255);
arc(0, 0, 115, 110, PI, TWO_PI);

//Partie rouge
fill(255,0,0);
arc(0, 0, 70, 110, PI, PI*1.5);

//Partie jaune
fill(255,255,0);
arc(0, 0, 70, 110, PI*1.5, TWO_PI);

//Lignes pour compléter les contours
line(-57.5, 0, 57.5, 0);
line(0,0,0,-55);

//Hélice
fill(175);
ellipse(-20,-70,40,10);
ellipse(20,-70,40,10);

//Tige de l'hélice
rectMode(RADIUS);
rect(0,-68,4,12);

popMatrix();                
