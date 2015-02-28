
// Variables de la scène
int x;
int y;

// Variables d'incrémentation
int n;
float c;

// Variables du carré
int carreX;
int carreY;
int carreW = 50;
int carreH = 50;
int stateCarre;

// Variables du cercle
int cercleX;
int cercleY;
int cercleDim = 50;
int stateCercle;
int nombreDeRayons = 20;
int longueurDesRayons = 60; 
float x1;
float y1;
float x2;
float y2;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  strokeWeight(2);
}

void draw() {
  background(100, 100, 100);
  // Position du carré
  carreX = 270 - carreW/2;
  carreY = 200 - carreH/2;

  // Position du cercle
  cercleX = 130;
  cercleY = 200;
  // Initialisation de la couleur du carré
  if (stateCarre == 1) {
    // Icrémentation et décrémentation des lignes horizontales sur la scène
    y = 0;
    
    while (y < n) {
      stroke(0);
      line(0, y, width, y); // bloc de code
      y = y + 15; // incrementation
    }
    
    if (y < height) {
      n = n + 15;
    } 
    
    fill(255, 0, 255);
  } 
  else if (stateCarre == 0) {
    if (n > 0){
      y = 0;
      while (y <= n) {
        stroke(0);
        line(0, y, width, y); // bloc de code
        y = y + 15; // incrementation
      }
      n = n - 15;
    }
    
    fill(0, 255, 0);
  }

  // Carré
  noStroke();
  rect(carreX, carreY, carreW, carreH);
  
  
  // Dessin des rayons autour du cercle;
  float tranche = TWO_PI / nombreDeRayons;
  float rads = 0;
  float ratio = 0.50;    
    
  strokeWeight(2);
  stroke(0);
    
  while ( rads < c ) {
     float x1 = cercleX + cos(rads) * longueurDesRayons * ratio;
     float y1 = cercleY + sin(rads) * longueurDesRayons * ratio;
     float x2 = cercleX + cos(rads) * longueurDesRayons;
     float y2 = cercleY + sin(rads) * longueurDesRayons;
     line(x1, y1, x2, y2);
     rads = rads + tranche;
  }

  // Initialisation de la couleur du cercle
  if (stateCercle == 1) {
    fill(255, 0, 255);
    
    if (c < TWO_PI) {
      c = c + 0.3;
    }

  }
  else {    
    if (c > 0) {
      c = c - 0.3;
    }
    fill(0, 255, 0);
  }

  // Cercle
  noStroke();
  ellipse(cercleX, cercleY, cercleDim, cercleDim);
}

void mousePressed() {
  // Vérification de la zone cliquable du carré  
  if (mouseX>carreX && mouseX<carreX+carreW && mouseY>carreY && mouseY<carreY+carreH) {
    stateCarre = 1;
  }

  // Vérification de la zone cliquable du cercle 
  float distance = dist(mouseX, mouseY, cercleX, cercleY);

  if (distance < cercleDim) {
    if (stateCercle == 0) { 
      stateCercle = 1;
    }
    else {
      stateCercle = 0;
    }
  }
}

// Release pour le carré
void mouseReleased() {
  if (mouseX>carreX && mouseX<carreX+carreW && mouseY>carreY && mouseY<carreY+carreH) {
    stateCarre = 0;
  }
}
