
size(400,600);
background(255);

int pointeTriangle= 100;
pointeTriangle=100;

int baseForme1=200;
baseForme1=200;
//création de formes simples
//TRIANGLE

//triangle bleu
noStroke();
fill(31,12,144);
triangle(pointeTriangle,pointeTriangle,150,baseForme1,50,baseForme1);

//triangle contour épais bleu(31,12,144)
fill(0);
triangle(250,pointeTriangle,300,baseForme1,baseForme1,baseForme1);

/*Défomation du triangle car oublie cahngement données
pointeTriangle =100+150;
baseForme1=200+150;
triangle(pointeTriangle,pointeTriangle,150,baseForme1,50,baseForme1);*/

noFill();
stroke(31,12,144);
strokeWeight(12);
pointeTriangle =100+150;
baseForme1=200+150;
triangle(100,pointeTriangle,150,baseForme1,50,baseForme1);

//Déformation
//triangle(250,pointeTriangle,300,baseForme1,baseForme1,baseForme1);

//triangle(pointeTriangle,pointeTriangle,300,baseForme1,200,250);

/*Variation du triangle
contour12 noir fond bleu
stroke(0);
strokeWeight(12);
pointeTriangle =100+150;
baseForme1=200+150;
triangle(pointeTriangle,pointeTriangle,300,baseForme1,200,baseForme1);*/

noFill();
stroke(0);
strokeWeight(12);

pointeTriangle =100+150;
baseForme1=200+150;
triangle(pointeTriangle,pointeTriangle,300,baseForme1,200,baseForme1);


pointeTriangle=100+300;
baseForme1=200+350;

noFill();
stroke(31,12,144);
strokeWeight(2);
pointeTriangle =100+300;
baseForme1=200+300;
triangle(100,pointeTriangle,150,baseForme1,50,baseForme1);

stroke(0);
strokeWeight(2);
pointeTriangle =100+150;
baseForme1=200+300;
triangle(pointeTriangle,400,300,baseForme1,200,baseForme1);




