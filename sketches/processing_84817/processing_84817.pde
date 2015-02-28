
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

//Déformation
//triangle(250,pointeTriangle,300,baseForme1,baseForme1,baseForme1);

triangle(pointeTriangle,pointeTriangle,300,baseForme1,200,250);

//Défomation du triangle car oublie cahngement données
pointeTriangle =100+150;
baseForme1=200+150;
triangle(pointeTriangle,pointeTriangle,150,baseForme1,50,baseForme1);

noFill();
stroke(0);
strokeWeight(12);

/*déformation triangle allongé
stroke(0);
strokeWeight(5);
pointeTriangle =100+150;
baseForme1=200+250;
triangle(pointeTriangle,pointeTriangle,300,baseForme1,200,baseForme1);*/

//déformation
stroke(0);
strokeWeight(5);
pointeTriangle =100+150;
baseForme1=200+250;
triangle(pointeTriangle,pointeTriangle,300,350,250,baseForme1);

//TRIANGLE EQUILATERAL
stroke(0);
strokeWeight(5);
pointeTriangle =100+150;
baseForme1=200+250;
triangle(pointeTriangle,400,300,baseForme1,200,baseForme1);



