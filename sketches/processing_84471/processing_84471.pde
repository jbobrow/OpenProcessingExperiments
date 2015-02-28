
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
strokeWeight(12);
stroke(#FFD812,75);
line(100,100,200,200);
line(200,100,100,200);
strokeWeight(5);
stroke(#FFD812,80);
line(100,100,200,200);
line(200,100,100,200);

//droit
noStroke();
fill(#FFD812,95);
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
strokeWeight(30);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);
strokeWeight(5);
stroke(#FFD812,80);
line(100,100,200,200);
line(200,100,100,200);

//3
translate(0,150);
//droit
noStroke();
fill(#FFD812,80);
stroke(#E34800,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

stroke(#E34800,80);
//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();


strokeWeight(5);
stroke(#FFD812,75);
line(100,100,200,200);
strokeWeight(12);
stroke(#E34800,80);
line(200,100,100,200);











//4
translate(-150,0);

strokeWeight(12);
stroke(#1AB404,80);
line(100,100,200,200);
line(200,100,100,200);


//droit
stroke(#FFD812,95);
strokeWeight(15);
fill(#FFD812,95);
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


