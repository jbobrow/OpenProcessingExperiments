
// Travail de rattrapage - Boutons et boucles - Marc-André Brault

// Variables de base

int btCercleW = 50; // Taille
int btCercleH = 50;
int posXbtCercle = 100; // Position
int posYbtCercle = 200;

int btCarreW = 50; // Taille
int btCarreH = 50;
int posXbtCarre = 300; // Position
int posYbtCarre = 200;

// Variables etats
float i;
float compteurCarre;
float compteurCercle;
int etatCarre;
int etatCercle;
final int ON = 1;  // final quand on veut déterminer des mots-clés (ON au lieu de 1)
final int OFF = 0;

int nombreDeRayons = 20;
int longueurDesRayons = 50; 
float tranche = TWO_PI / nombreDeRayons;
float rads = 0;
float ratio = 0.75;
float x1, y1, x2, y2;

void setup () {
  size(400, 400);
  smooth();  
  
  etatCercle = OFF;
  etatCarre = OFF;
}

void draw() { 
  background(193, 205, 193); 
  
  // BtCarre
  
  if ( etatCarre == ON ) { 
    
    // Boucles des barres qui descendent
    i = 0;
    while ( i < compteurCarre ) {
      strokeWeight(5);
      stroke(#000000);
      line (0, i*20, width, i*20) ;
      i++;
    }
    compteurCarre = compteurCarre + 1 ;
    compteurCarre = constrain(compteurCarre, 0, 20);
    
    fill(255, 20, 147);
  }
  else {
    fill(0, 0, 255);

    if (compteurCarre > 0) {
      compteurCarre--;
    }
    
    // Boucle des barres qui remontent
    i = 0;
    while ( i < compteurCarre ) {
      strokeWeight(5);
      stroke(#000000);
      line (0, i*20, width, i*20);
      i++;
    }
  }  

  noStroke();
  rectMode(CENTER);
  rect(posXbtCarre, posYbtCarre, btCarreW, btCarreH); 

  // BtCercle

  strokeWeight(5);
  stroke(#000000);
  rads = 0; // Réinitialisation de la variable rads
  while ( rads < compteurCercle ) {
    x1 = posXbtCercle + cos(rads) * longueurDesRayons * ratio;
    y1 = posYbtCercle + sin(rads) * longueurDesRayons * ratio;
    x2 = posXbtCercle + cos(rads) * longueurDesRayons;
    y2 = posYbtCercle + sin(rads) * longueurDesRayons;
    line(x1, y1, x2, y2);
    rads = rads + tranche ;
  }

  if ( etatCercle == ON ) {
    if (compteurCercle < TWO_PI) {
      compteurCercle = compteurCercle + 0.3; // Création du cercle de droite à gauche
    }    
    fill(255, 20, 147);
  }
  else {
    if (compteurCercle > 0) {
      compteurCercle = compteurCercle - 0.3; // Création du cercle de gauche à droite, retour à zéro
    }     
    fill(0, 0, 255);
  }  

  noStroke();
  ellipse(posXbtCercle, posYbtCercle, btCercleW, btCercleH);  
}

void mousePressed() {
  // Bt cercle

  float distanceCercle = dist(mouseX, mouseY, posXbtCercle, posYbtCercle);

  if ( distanceCercle < 25 ) {
    if (etatCercle == OFF) {
      etatCercle = ON;
    }
    else if (etatCercle == ON) {
      etatCercle = OFF;
    }
  }

  // BtCarre

  if ( mouseX > posXbtCarre-btCarreW/2 && mouseX < posXbtCarre+btCarreW/2 && mouseY > posYbtCarre-btCarreH/2 && mouseY < posYbtCarre+btCarreH/2 ) {
    if (etatCarre == OFF) {
      etatCarre = ON;
    }
    else if (etatCarre == ON) {
      etatCarre = OFF;
    }
  }
}

void mouseReleased() {
  if ( mouseX > posXbtCarre-btCarreW/2 && mouseX < posXbtCarre+btCarreW/2 && mouseY > posYbtCarre-btCarreH/2 && mouseY < posYbtCarre+btCarreH/2 ) {
    etatCarre = OFF;
  }  
}


