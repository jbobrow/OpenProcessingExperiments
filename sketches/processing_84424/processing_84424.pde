
size (500,500);
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
// RECTANGLE 1
//rect(100,100,100,100);

//losange de droite
noStroke();
fill(#DE0051,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//diagonal
stroke(#256293,80);
strokeWeight(1);
line(100,100,200,200);
line(200,100,100,200);
















// RECTANGLE 2
//rect(100,100,100,100);
translate(150,0);
//triangle haut
noStroke();
fill(#DE0051,80);
beginShape();
vertex(100,100);
vertex(150,150);
vertex(200,100);
vertex(100,100);
endShape();

//triangle bas
beginShape();
vertex(100,200);
vertex(200,200);
vertex(150,150);
vertex(100,200);
endShape();

//diagonal
stroke(#256293,80);
strokeWeight(1);
line(100,100,200,200);
line(200,100,100,200);

//ligne centre
line(125,125,100,150);
line(100,150,125,175);

line(175,125,200,150);
line(200,150,175,175);

//ligne droite gauche (inv)
stroke(#256293,80);
strokeWeight(1);
line(100,100,100,200);
line(200,100,200,200);















// RECTANGLE 3
//rect(100,100,100,100);
translate(0,150);
//triangle haut
noStroke();
fill(#DE0051,80);
beginShape();
vertex(100,100);
vertex(150,150);
vertex(200,100);
vertex(100,100);
endShape();

//triangle bas
beginShape();
vertex(100,200);
vertex(200,200);
vertex(150,150);
vertex(100,200);
endShape();

//diagonal
stroke(#256293,80);
strokeWeight(1);
line(100,100,200,200);
line(200,100,100,200);

//losange de droite
noStroke();
fill(#DE0051,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//ligne droite gauche (inv)
stroke(#256293,80);
strokeWeight(1);
line(100,100,100,200);
line(200,100,200,200);














// RECTANGLE 4
//rect(100,100,100,100);
translate(-150,0);


//diagonal
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,200,200);
line(200,100,100,200);

//losange de droite
noStroke();
fill(#E34800,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//ligne droite gauche (inv)
stroke(#256293,80);
strokeWeight(1);
line(100,100,100,200);
line(200,100,200,200);















// RECTANGLE 4
//rect(100,100,100,100);
translate(0,125);


//diagonal
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,200,200);
line(200,100,100,200);

//losange de droite
noStroke();
fill(#E34800,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//ligne droite gauche (inv)
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,100,150);
line(200,150,200,200);


















// RECTANGLE 4
//rect(100,100,100,100);
translate(125,0);


//diagonal
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,200,200);
line(200,100,100,200);

//losange de droite
noStroke();
fill(#E34800,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//ligne droite gauche (inv)
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,100,150);
line(200,150,200,200);

//ligne horizontale
stroke(#004AFF,80);
strokeWeight(1);
line(150,150,200,150);
strokeWeight(4);
line(150,150,100,150);
 
//ligne verticale
stroke(#004AFF,80);
strokeWeight(4);
line(100,150,100,200);
strokeWeight(1);
line(200,150,200,100);
















// RECTANGLE 4
//rect(100,100,100,100);
translate(125,0);


//diagonal
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,200,200);
line(200,100,100,200);

//losange de droite
noStroke();
fill(#E34800,80);
beginShape();
vertex(125,125);
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(125,125);
endShape();

//losange de gauche
beginShape();
vertex(175,125);
vertex(150,150);
vertex(175,175);
vertex(175,175);
vertex(200,150);
endShape();

//deuxième couche
//losange de gauche
beginShape();
vertex(150,150);
vertex(175,175);
vertex(200,150);
vertex(150,150);
endShape();


//deuxième couche
fill(#E34800,80);
beginShape();
vertex(150,150);
vertex(125,175);
vertex(100,150);
vertex(150,150);
endShape();

//rectbas
//losange de gauche
beginShape();
vertex(150,150);
vertex(175,175);
vertex(150,200);
vertex(150,150);
endShape();


//ligne droite gauche (inv)
stroke(#FFD812,90);
strokeWeight(5);
line(100,100,100,150);
line(200,150,200,200);

//ligne horizontale
stroke(#004AFF,80);
strokeWeight(4);
line(150,150,200,150);
line(150,150,100,150);
 
//ligne verticale
stroke(#004AFF,80);
strokeWeight(1);
line(100,150,100,200);
line(200,150,200,100);







