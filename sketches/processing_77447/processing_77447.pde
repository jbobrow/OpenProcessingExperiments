
//SIZE : taille en pixels du papier est 200x200
size(200,200);

//Background : mettre en couleur le fond (0= noir, 127= gris moyen)
background(0);

//dessiner un point de 1 pixel dont les coordonnées sont x=100, y=100)
point(30,180);

//STROKE : attribuer une couleur à un trait
stroke(#51B5B9);

//line : dessiner une ligne, lui attribuer un point de départ et un point d'arrivée
line(100,0,100,200);
line(200,100,0,100);

line(100,50,150,100);
line(150,100,100,150);
line(100,150,50,100);
line(50,100,100,50);

//noFill: ne pas remplir formes à venir
noFill();

//enlever contours ellipse
noStroke();
//ELLIPSE
//dessiner un rond dont le centre est situé aux coordonnées x=20,y=20
//couleurs des ellipses
fill(#51B5B9);
ellipse(100,100,70,70);
ellipse(170,170,50,50);

//line: dessiner une ligne entre les ellipses
line(100,100,170,170);
//troisième ellipse
ellipse(170,30,50,50);
//line:deuxième ligne
line(170,170,170,30);
//line: troisième ligne
line(170,30,100,100);




