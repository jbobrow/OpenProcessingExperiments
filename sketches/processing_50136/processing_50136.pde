
/* -------------------------------------------------------------------------- 
Monstre 
Par Thomas Ouellet Fredericks
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

// Arriere plan
background(127);

// Dessiner la tete
rectMode(CENTER);
noStroke();
fill(0);
// La taille de la tete est proportionnelle
// a la scene
float largeurTete = width/2;
float hauteurTete = height/4;
rect(x,y,largeurTete,hauteurTete);

// Dessiner les yeux
float tailleOeil = hauteurTete / 3;
fill(255);
rect(x - tailleOeil , y - tailleOeil *0.9 , tailleOeil, tailleOeil);
rect(x + tailleOeil , y - tailleOeil *0.9, tailleOeil, tailleOeil);

// Dessiner la bouche
arc(x,y+hauteurTete/5,hauteurTete/4,hauteurTete/4,0,PI);

// Dessiner les jambes
rectMode(CORNER);
float largeurJambe = 20;
float yJambe = y+hauteurTete/2;
float basJambe = yJambe + 100;
float hauteurSegment = 10;

while ( yJambe < basJambe ) {
  fill(random(255));
  rect(x-largeurTete*0.25,yJambe,largeurJambe,hauteurSegment);
  rect(x+largeurTete*0.25-largeurJambe,yJambe,largeurJambe,hauteurSegment);
  yJambe = yJambe + hauteurSegment;
}

 // Dessiner le noeud
fill(255,0,0);
float xNoeud = x; 
float yNoeud = y + hauteurTete / 2;
float largeurNoeud = largeurTete / 6;
float hauteurNoeud = hauteurTete / 5;
beginShape();
curveVertex(xNoeud, yNoeud-hauteurNoeud*0.25);
curveVertex(xNoeud-largeurNoeud, yNoeud-hauteurNoeud);
curveVertex(xNoeud-largeurNoeud, yNoeud+hauteurNoeud);
curveVertex(xNoeud, yNoeud+hauteurNoeud*0.25);
curveVertex(xNoeud+largeurNoeud, yNoeud+hauteurNoeud);
curveVertex(xNoeud+largeurNoeud, yNoeud-hauteurNoeud);
curveVertex(xNoeud, yNoeud-hauteurNoeud*0.25);
curveVertex(xNoeud-largeurNoeud, yNoeud-hauteurNoeud);
curveVertex(xNoeud-largeurNoeud, yNoeud+hauteurNoeud);
endShape();
stroke(0);
rectMode(CENTER);
rect(xNoeud,yNoeud,largeurNoeud/2,hauteurNoeud);
