
size(400,600);
background(255);

int pointeTriangle= 100;
pointeTriangle=100;

int baseForme1=200;
baseForme1=200;
//création de formes simples
//TRIANGLE
//Contours de 5 a 65 px

//triangle haut gauche
strokeWeight(50);
fill(31,12,144);
triangle(pointeTriangle,pointeTriangle,150,baseForme1,50,baseForme1);

//triangle haut droite
stroke(0);
strokeWeight(55);
fill(31,12,144);
triangle(300,pointeTriangle,350,baseForme1,250,baseForme1);

//triangle bas gauche
stroke(0);
strokeWeight(60);
fill(31,12,144);
pointeTriangle =100+200;
baseForme1=200+200;
triangle(100,pointeTriangle,150,baseForme1,50,baseForme1);

//triangle bas droit
stroke(0);
strokeWeight(65);
pointeTriangle =100+250;
baseForme1=200+250;
triangle(290,pointeTriangle,340,baseForme1,240,baseForme1);






