
/**
Monstre: Un monstre qui rebondit. Cliquez
pour le déplacer. Par Thomas Ouellet Fredericks 
*/

/* --------------------------------------------------------------------------
Monstre
Une face de monstre qui rebondit. Elle montre les bras lorsqu'elle tombe.
Et les descend lorsqu'elle monte. Sa bouche réagit aussi au déplacement.
Lorsqu l'utilisateur clique la souris, le monstre apparaît vis à vis celle-ci
Écrit par Thomas Ouellet Fredericks
Creative Commons Attribution-Noncommercial-Share Alike 2.5 Canada
Version 1
--------------------------------------------------------------------------*/



float y; // Variable pour la position verticale
float x; // variable pour la position horizontale
float speed = 1; // Vitesse verticale
float wMonstre = 60; // largeur du monstre
float hMonstre = 30; // hauteur du monstre

void setup() {
  size(255,255); // Créer la scéne avec une dimension de 256x256 pixels
  smooth(); // Activer l'antialiasing
  // Placer le monstre au milieu et en haut de la scène
  x = width/2;
  y = 0;
}

void draw() {
  background(255); // Remplir la scène de blanc
  move(); // Déplacer le monstre
  bounce(); // Faire rebondir le monstre
  face(x,y,wMonstre,hMonstre,speed); // Dessiner le monstre
}


// Fonction pour déplacer le monstre
void move() { 
  // Augmenter la vitesse vers le bas (simile la gravité)
  speed = speed + 0.2;
  // Ajouter la vitesse à la position verticale
  y = y + speed;
}


void bounce() {
  // Vérifier si le monstre sort de la limite du bas de la scène
  if (y > height - hMonstre) {
    // Si oui...
    // ...changer la direction de la vitesse (simule le rebondissement)
    speed = speed * - 0.9;
    // ...placer le monstre sur la limite
    y = height - hMonstre;
  }

}



void face(float x, float y, float w, float h, float vitesse) {
  // Calculer un cinquième de la hauteur et de la largeur
  // Tout les éléments seront placés grâce à ces repères
  float cinquiemeW = w/5;
  float cinquiemeH = h/5;
  noStroke(); // Ne pas dessiner de contour
  // Dessiner la tête avec du noir
  fill(0);
  rect(x,y,w,h); 
  fill(255); // Remplir le yeux avec du blanc
  // Dessiner chaque oeil à partir des positions x,y et
  // des grangeurs w,h
  rect(x+cinquiemeW , y+cinquiemeH , cinquiemeW , cinquiemeH);
  rect(x+w-cinquiemeW-cinquiemeW , y+cinquiemeH , cinquiemeW , cinquiemeH);
  // Remplir la bouche avec du rouge
  fill(255,0,0); 
  // Dessiner la bouche
  float hauteurBouche = constrain(vitesse*-2,5,10);
  rect(x+cinquiemeW*2,y+cinquiemeH*3,cinquiemeW,hauteurBouche);
  // Dessiner les bras
  fill(0);
  if ( vitesse > 0) {
    // la face descend, monter les bras
    rect(x-cinquiemeW/2,y-cinquiemeH*5,cinquiemeW/2,cinquiemeH*6);
    rect(x+w,y-cinquiemeH*5,cinquiemeW/2,cinquiemeH*6);
  } 
  else {
    // la face monte, descendre les bras
    rect(x-cinquiemeW/2,y,cinquiemeW/2,cinquiemeH*6);
    rect(x+w,y,cinquiemeW/2,cinquiemeH*6);
  }
}


// Si jamais le bouton de la souris est appuyé...
void mousePressed() {
  // ...placer le centre du monstre vis à vis la souris
  x = mouseX-wMonstre/2 ;
  y = mouseY-hMonstre/2;
  // ...annuler sa vitesse accumulée
  speed = 0;
}


