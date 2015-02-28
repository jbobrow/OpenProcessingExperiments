
/* --------------------------------------------------------------------------
TP1 Monstre
Par Jean-François Bourbeau
-------------------------------------------------------------------------- */
  
// Variables pour la position
float y;
float x;
 
// Configurer la scene
size(400,400);
smooth();
 
// Placer au centre de la scene
x = width/2;
y = height/2;


// Arrière plan
background(255);


// Dessiner la tête
stroke(0);
strokeWeight(30);
fill(#4CFA32);

beginShape();
curveVertex(x-200,  y+50);

curveVertex(x,  y-140);
curveVertex(x+130,  y-140);
curveVertex(x+130,  y+140);
curveVertex(x,  y+140);
curveVertex(x-130,  y+140);
curveVertex(x-130,  y-140);
curveVertex(x,  y-140);

curveVertex(x+200,  y+50);
endShape();


// Dessiner le nez
triangle(x,y-10,x-10,y,x+10,y);


// Dessiner la bouche
rect(x-77,y+70,155,10);


// Dessiner les dents
stroke(255);
triangle(x-60,y+69,x-50,y+69,x-55,y+90);
triangle(x+60,y+69,x+50,y+69,x+55,y+90);


// Dessiner les yeux
strokeWeight(10);
stroke(0);
fill(#FF0009);
ellipse(x-60, y-80, 55, 55);
ellipse(x+60, y-80, 55, 55);
fill(255);
ellipse(x-70,y-70,19,19);
ellipse(x+70,y-90,19,19);



// Dessiner les cheveux
// Avec l'aide du livre:
// Learning Processing, Daniel SHIFFMAN, Morgan Kaufmann, 2008, p.84

//Cheveux #1:

float spacing = 18; // Distance entre les lignes
float end = x+190; // Une variable pour indiquer où les lignes se terminent
float len = -160;// Longueur des lignes

while (x <= end ) {
strokeWeight(8);
stroke(random(255));
line(x-100, y-190, x - 90, y+ len);
x = x + spacing;
}

//Cheveux #2:


float spacing2 = 18; // Distance entre les lignes
float end2 = x+190; // Une variable pour indiquer où les lignes se terminent
float len2 = -160;// Longueur des lignes

while (x <= end2 ) {
strokeWeight(8);
stroke(random(255));
line(x-280, y-190, x - 288, y+ len2);
x = x + spacing2;
}
