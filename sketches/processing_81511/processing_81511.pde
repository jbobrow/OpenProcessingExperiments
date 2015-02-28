
//je définis la taille de mon dessin : 200x200
size(200,200);

//je définis la couleur du fond, noir
background(0);

//Je dessine un cercle blanc
ellipse(100,100,20,20);
//je dessine 4 cercles blanc autour de mon cercle central
//cercle en bas à droite
ellipse(120,120,20,20);
//cercle en haut à gauche
ellipse(80,80,20,20);
//cercle en bas à gauche
ellipse(80,120,20,20);
//cercle en haut à droite
ellipse(120,80,20,20);

//cercle au dessus du cercle central
ellipse(100,60,20,20);
//cercle en haut à gauche du cercle précédent
ellipse(80,40,20,20);
//cercle à droite du cercle précédent
ellipse(120,40,20,20);
//cercle en haut, au dessus des deux précédents cercles
ellipse(100,20,20,20);
//cercle en haut à gauche
ellipse(80,0,20,20);
//cercle en haut à droite
ellipse(120,0,20,20);

//cercle en dessous, sur la même ligne que le tout premier cercle
ellipse(100,140,20,20);
//cercle en bas à gauche du cercle précédent
ellipse(80,160,20,20);
//cercle en bas à droite du cercle central précédent
ellipse(120,160,20,20);

//nouveau cercle "central"
ellipse(100,180,20,20);
//cercle en bas à gauche du cercle précédent
ellipse(80,200,20,20);
//cercle en bas à droite
ellipse(120,200,20,20);

//tracer une ligne qui traverse l'image verticalement entre les cercles, à gauche
stroke(255);
line(90,0,90,200);
//tracer une ligne qui traverse l'image verticalement entre les cercles, à droite
stroke(255);
line(110,0,110,200);
//tracer une ligne qui délimite les cercles à gauche
stroke(255);
line(70,0,70,200);
//tracer une ligne qui délimite les cercles à droite
stroke(255);
line(130,0,130,200);

//tracer une ligne qui traverse l'image horizontalement
stroke(255);
line(0,10,200,10);
//tracer une ligne qui travers l'image horizontalement, sous la ligne précédente
stroke(255);
line(0,30,200,30);

//tracer une ligne qui traverse les cercles en diagonale et la dédoubler
stroke(255);
line(30,0,200,180);
line(20,0,200,190);

//tracer une ligne horizontale dans la partie inférieure de l'image

stroke(255);
line(0,130,200,130);



