
// Variables de base

float x, y;
int centreX = 200;
int centreY = 200;
int oeilW = 70;
int oeilH = 70;
int pupilleW = 20;
int pupilleH = 20;

// Variables assouplisement

float cibleX, cibleY, facteur;

void setup() {
  size( 400, 400);
  smooth();
  noStroke();
    
  x = centreX; // Position initiale de l'oeil en x
  y = centreY; // Position initiale de l'oeil en y
    
  facteur = 0.1;
}

void draw() {
  background(0); 
   
  x = (cibleX - x) * facteur + x;
  y = (cibleY - y) * facteur + y;  
  
  // Fond oeil
  
  fill(255);
  ellipse(x, y, oeilW, oeilH); // Création de l'oeil
  
  // Pupille
  
  float radians = atan2(mouseY-y, mouseX-x); // L'angle
  float distance = dist(mouseX, mouseY, x, y); // La distance entre la position cible et la position actuelle
  float distanceX = constrain(distance, 0, oeilW/2 - pupilleW/2); // On limite la distance en x
  float distanceY = constrain(distance, 0, oeilH/2 - pupilleH/2); // On limite la distance en y
  float pupilleX = cos(radians) * distanceX + x; // Position en x de la pupille
  float pupilleY = sin(radians) * distanceY + y; // Position en y de la pupille
  
  fill(0);
  ellipse(pupilleX, pupilleY, pupilleW, pupilleH); // Création de la pupille
}

void mousePressed() {
  cibleX = mouseX;
  cibleY = mouseY;
}


