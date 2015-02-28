
size(500,500);
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

//1
strokeWeight(30);
stroke(#1AB404,80);
line(100,100,150,150);
line(150,150,200,100);

//bas
strokeWeight(15);
stroke(#1AB404,80);
line(100,200,150,150);
line(150,150,200,200);

//droit
noStroke();
fill(#001EAF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();













//2
translate(150,0);
strokeWeight(10);
stroke(#1AB404,80);
line(100,100,150,150);
line(150,150,200,100);

//bas
strokeWeight(35);
stroke(#1AB404,80);
line(100,200,150,150);
line(150,150,200,200);


//1
strokeWeight(30);
stroke(#1AB404,80);
line(100,100,150,150);
line(150,150,200,100);

//bas
strokeWeight(15);
stroke(#1AB404,80);
line(100,200,150,150);
line(150,150,200,200);


//droit
noStroke();
fill(#FFD812,90);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();


//encore une fois
//droit
noStroke();
fill(#FFD812,90);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();







//3
translate(0,150);
strokeWeight(30);
stroke(#004AFF,80);
line(100,100,150,150);
line(150,150,200,100);

//bas
strokeWeight(5);
stroke(#001EAF,80);
line(100,200,150,150);
line(150,150,200,200);

//carrég
line(150,150,125,125);
line(125,125,100,150);
line(100,150,125,175);
line(125,175,150,150);
//carrédroite
line(150,150,175,125);
line(175,125,200,150);
line(200,150,175,175);
line(175,175,150,150);














//3
translate(-150,0);
strokeWeight(5);
stroke(#004AFF,80);
line(100,100,150,150);
line(150,150,200,100);

//bas
strokeWeight(30);
stroke(#001EAF,80);
line(100,200,150,150);
line(150,150,200,200);


strokeWeight(5);
//carrég
line(150,150,125,125);
line(125,125,100,150);
line(100,150,125,175);
line(125,175,150,150);
//carrédroite
line(150,150,175,125);
line(175,125,200,150);
line(200,150,175,175);
line(175,175,150,150);


