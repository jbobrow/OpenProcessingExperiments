
size(800,600);

//Fond de couleur gris
background(230);

//Épaisseur des contours des 5 premiers triangles
strokeWeight(10);

//Contours de couleur noir
stroke(25);

//Remplissage de toutes les formes créées
fill(100, 50);

//Création de 5 nouveaux triangles
triangle(220,180,400,300,220,420); // n°1

triangle(580,180,400,300,580,420); // n°2

triangle(250,200,550,200,400,390); // n°3

triangle(250,400,550,400,400,210); // n°4

triangle(220,300,400,210,580,300); // n°5


//Épaisseur des contours des 5 triangles suivants
strokeWeight(9);

//Contours de couleur noir, transparence activée
stroke(25, 100);

//Triangles 6 à 10
triangle(400,390,400,205,590,300); // n°6
triangle(400,390,400,205,210,300); // n°7
triangle(400,390,400,205,280,300); // n°8
triangle(400,390,400,205,520,300); // n°9
triangle(220,180,380,300,220,420); // n°10

//Épaisseur des contours des 5 triangles suivants
strokeWeight(8);

//Contours de couleur noir, transparence activée
stroke(25, 90);

//Triangles 11 à 15
triangle(580,180,420,300,580,420); // n°11
triangle(220,180,360,300,220,420); // n°12
triangle(580,180,440,300,580,420); // n°13
triangle(220,180,340,300,220,420); // n°14
triangle(580,180,460,300,580,420); // n°15

//Épaisseur des contours des 5 triangles suivants
strokeWeight(7);

//Contours de couleur noir, transparence activée
stroke(25, 80);

//Triangles 16 à 20
triangle(220,180,320,300,220,420); // n°16

//Épaisseur des contours du rectangle
strokeWeight(10);

//Contours de couleur noir forme rectangle
stroke(25);

//Création rectangle aux angles ronds
rect(200,200,400,200,100);


