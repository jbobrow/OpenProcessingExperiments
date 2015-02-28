

// je met la taille de l'image

size(200,200);

//peindre le fond 

background(123321);

//dessiner un point

point(100,100);
point(20,180);

//couleur de la ligne

stroke(155,102,0); 

//dessiner des lignes
line(50,100,150,100);
line(100,50,100,150);
/*
line(150,50,50,150);
line(50,50,150,150);
line(50,50,150,50);
line(150,50,150,150);
line(150,150,50,150);
line(50,150,50,50);
*/

//ELLIPSE dessiner des cercles, accompagné des traits qui les relie

stroke(155,102,0);


// ne pas remplir les formes à venir: noFill, remplir: Fill


line(50,50,100,100);
line(100,100,150,50);
line(50,50,150,50);

fill(#065571);
noStroke();
ellipse(100,100,20,20);
ellipse(50,50,20,20);
ellipse(150,50,20,20);



