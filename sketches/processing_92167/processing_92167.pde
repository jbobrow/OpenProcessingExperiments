
// Une paire de coordonnées pour le centre du carré.
float x;
float y;

// Une variable pour l'état courant:
// est-ce que le carré à été cliqué?
int etat = 0;

// Une variable pour le fondu.
float blend;

void setup() {
  // Initialisation de la scène
  size(400, 400);
  smooth();
  frameRate(30);

  // Placer les coordonnées au centre de la scène.
  x = width*0.5;
  y = height*0.5;
}


void draw() {
  // Dessiner un arrière plan gris.
  background(127);

  // Dessiner les contours en noir.
  stroke(0);


  // Colorer le carré selon l'etat courant et la position de la souris.
  // L'état est modifié par mousePressed() à la fin du code.
  // etat == 0 : le carré n'a pas été cliqué.
  // etat == 1 : le carré a été cliqué.
  if ( etat == 0 ) {
    // Vérifier si la souris est à l'intérieur des limites du carré.
    if ( mouseX > x-15 && mouseX < x+15 && mouseY > y-15 && mouseY < y+15 ) {
      fill(200);
    } 
    else {
      fill(255);
    }
  } 
  else {
    // etat == 1.
    // Vérifier si la souris est à l'intérieur des limites du carré.
    if ( mouseX > x-15 && mouseX < x+15 && mouseY > y-15 && mouseY < y+15 ) {
      fill(55);
    } 
    else {
      fill(0);
    }
  }


  // Dessiner le carré.
  rect(x-15, y-15, 30, 30);

  // Désactiver les contours.
  noStroke();

  // Placer le système de coordonnées
  // au centre de la scène.
  translate(x, y);

  // Une première rotation initiale.
  rotate(radians(30));


  // Boucle pour dessiner les 6 cercles.
  for ( int i =0; i < 6; i++ ) {
    // Emmagasiner la matrice pour que les changements
    // suivants ne soient pas permanents.
    pushMatrix();
    translate(100, 0);
    // Une deuxième boucle pour le dégradé intérieur
    // de chaque ellipse.
    // Les ellipses sont dessinées avec une opacité
    // contrôlée par la variable «blend».
    for ( int j =60; j > 0; j-- ) {
      fill(map(j, 0, 60, 255, 0), blend);
      ellipse(map(j, 0, 60, 10, 0), 0, j, j);
    }
    // Remettre la matrice emmagasinée.
    popMatrix();
    // Décaler de 60 degrés (cette transformation
    // est accumulée.
    rotate(radians(60));
  }
  
  
  // Effectuer le fondu en modifiant la valeur
  // de la variable «blend» selon l'état.
  if ( etat == 1 ) {
    blend = blend +5;
    if ( blend > 255) blend = 255;
  } 
  else {
    blend= blend - 10;
    if ( blend < 0) blend = 0;
  }
}

// Code à exécuter lors d'un clique de souris.
void mousePressed() {
 // Vérifier si la souris est à l'intérieur du carré.
  if ( mouseX > x-15 && mouseX < x+15 && mouseY > y-15 && mouseY < y+15 ) {
    // Alterner la valeur de l'etat.
    if (etat == 0 ) etat =1;
    else etat =0;
  }
}
