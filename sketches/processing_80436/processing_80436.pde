
size (650,500);
background(255);


/*
MES COULEURS
Rose
#DE0051,80
ligne violet
stroke(#DE0051,80);
violet gris
#8076BC,80
BLEU FONCE
(#001EAF,80);
BLEU CLAIR
 #004AFF,80
Orange
#E85900,80
orange foncé
#E34800,80
jaune
#FFD812,90
vert
#1AB404
*/

//FORMEs se suivent en colonne de gauche à droite
//1
strokeWeight(4);
rect(50,50,100,100);
line(50,50,150,150);
line(150,50,50,150);
ellipse(100,100,30,45);


//2
strokeWeight(4);
rect(50,200,100,100);
line(100,250,50,300);
line(100,250,150,300);
line(100,250,50,200);
line(100,250,150,200);
line(100,250,150,250);
//ligne côté droit
line(100,250,150,212.5);
line(100,250,150,225);
line(100,250,150,262.5);
line(100,250,150,285);
//ligne côté gauche
line(100,250,50,250);
line(100,250,50,212.5);
line(100,250,50,225);
line(100,250,50,262.5);
line(100,250,50,285);
ellipse(100,250,45,30);


//3
strokeWeight(4);
rect(50,350,100,100);
//ligne haut
line(80,350,100,375);
line(120,350,100,375);
//ligne bas
line(80,450,100,425);
line(120,450,100,425);
//ligne gauche
line(50,380,85,400);
line(50,420,85,400);
//ligne droite
line(150,420,115,400);
line(150,380,115,400);
ellipse(100,400,30,45);

//2ème ligne
//1
rect(200,50,100,100);
line(225,75,200,50);
line(225,125,200,150);
line(275,125,300,150);
line(275,75,300,50);
line(225,75,200,100);
line(200,100,225,125);
line(275,75,300,100);
line(300,100,275,125);
line(225,75,275,125);
line(275,75,225,125);

//2
rect(200,200,100,100);

line(225,225,200,200);
line(225,275,200,300);
line(275,275,300,300);
line(200,250,225,275);
line(275,225,300,250);
line(300,250,275,275);
line(225,225,200,250);
line(300,200,275,225);
//linge horizontale
line(225,225,275,225);
line(225,275,275,275);

//3
rect(200,350,100,100);
//ligne centre
line(250,350,250,450);
//ligne côté gauche
line(200,350,225,375);
line(225,375,200,400);
line(200,400,225,425);
line(225,425,200,450);
//ligne côté droit
line(300,350,275,375);
line(275,375,300,400);
line(300,400,275,425);
line(275,425,300,450);
//carré centre
line(250,375,225,400);
line(225,400,250,425);
line(250,425,275,400);
line(275,400,250,375);


//3ème ligne
//1
//rect(346,48,107,107);

//ligne bleu
strokeWeight(6);
stroke(#256293,80);
line(375,75,350,50);
line(375,75,425,125);

line(425,75,375,125);
//line(425,125,450,150);
line(450,100,425,125);

//ligne violet
strokeWeight(8);
stroke(#DE0051,80);
line(375,125,350,150);
//haut droit
line(425,75,450,50);
line(375,75,350,100);
line(350,100,375,125);
line(425,75,450,100);
//line(450,100,425,125);
line(425,125,450,150);



stroke(0);
strokeWeight(4);
//2
strokeWeight(8);
stroke(#001EAF,80);
rect(350,200,100,100);
strokeWeight(8);
stroke(#004AFF,80);
//ligne côté
line(375,225,350,200);
line(450,200,425,225);
line(425,275,450,300);
line(375,275,350,300);
//ligne centre
strokeWeight(8);
stroke(#E85900,80);
line(350,250,375,275);
line(425,225,450,250);
line(450,250,425,275);
line(375,225,350,250);
//linge horizontale
strokeWeight(8);
stroke(#001EAF,80);
line(375,225,425,225);
line(375,275,425,275);


stroke(0);
strokeWeight(1);
//3
stroke(#E34800,80);
rect(350,350,100,100);
//ligne centre
strokeWeight(1);
stroke(#8076BC,80);
line(400,380,400,420);
stroke(#FFD812,90);

strokeWeight(20);
//ligne côté gauche
line(350,350,375,375);
line(375,375,350,400);
line(350,400,375,425);
line(375,425,350,450);
//ligne côté droit
strokeWeight(20);
line(450,350,425,375);
line(425,375,450,400);
line(450,400,425,425);
line(425,425,450,450);
//carré centre
strokeWeight(2);
stroke(#3412FF,80);
//line(400,375,375,400);
//line(375,400,400,425);
//line(400,425,425,400);
//line(425,400,400,375);

noStroke();
fill(#FFD812,90);
quad(400,375,425,400,400,425,375,400);

noFill();
//4ème ligne
//1
//rect(500,50,100,100);

//ligne bleu
strokeWeight(6);
stroke(#256293,80);
line(525,75,500,50);
line(525,125,500,150);
line(575,125,600,150);
line(575,75,600,50);
//ligne violet
strokeWeight(8);
stroke(#DE0051,80);
line(525,75,500,100);
line(500,100,525,125);
line(575,75,600,100);
line(600,100,575,125);
line(525,75,575,125);
line(575,75,525,125);

strokeWeight(4);
stroke(0);
//2
//rect(500,200,100,100);
//ligne côté
strokeWeight(10);
stroke(#004AFF,80);
line(525,225,500,200);
line(525,275,500,300);
line(575,275,600,300);
line(600,200,575,225);

//ligne centre
strokeWeight(15);
stroke(#E85900,80);
//bas droit
line(600,250,575,275);
//bas gauche
line(500,250,525,275);
//haut gauche
line(525,225,500,250);
//haut droite
line(575,225,600,250);

//linge horizontale
strokeWeight(5);
stroke(#001EAF,80);
line(525,225,575,225);
line(525,275,575,275);







stroke(0);
strokeWeight(4);
//3
//rect(500,350,100,100);
stroke(#1AB404);
//ligne côté gauche

line(500,350,525,375);
line(525,375,500,400);
line(500,400,525,425);
line(525,425,500,450);

//ligne côté droit
line(600,350,575,375);
line(575,375,600,400);
line(600,400,575,425);
line(575,425,600,450);

//carré centre
stroke(#1AB404,40);
strokeWeight(10);
line(550,375,525,400);
line(525,400,550,425);
line(550,425,575,400);
line(575,400,550,375);

//ligne centre
strokeWeight(4);
stroke(#1AB404);
line(550,350,550,450);






