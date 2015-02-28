
int etatRond = 0;
int etatCarre = 0;
int v = 0;
float x = 150;
float y = 200;
int nombreDeRayons = 40;
float rads = 0;
float maxv = 0;
float facteur1 = 40;
float facteur2 = 60;
float tranche = TWO_PI / nombreDeRayons;


void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(255, 224, 46);
  strokeWeight(3);
  stroke(255);
  fill(0);

  if (etatCarre == 0 ) {
    int i = 0;
    while ( i < v ) { 
      line(0, i, height, i); 
      i = i + 15;
    }
    if (v > 0)
      v = v - 5;
  }
  else if (etatCarre == 1) {
    fill(59, 21, 234);
    int i = 0;
    while ( i < v ) { 
      line(0, i, height, i); 
      i = i + 15;
    }
    if (v < height)
      v = v + 5;
  }
  
  strokeWeight(5);
  stroke(17, 88, 6);
  rectMode(CENTER);
  rect(250, 200, 60, 60);
  
  fill(0);
  strokeWeight(4);
  stroke(0);

  if (etatRond == 0 ) {

    rads = 0;

    while ( rads < maxv ) {
      line(x+cos(rads) * facteur1, y + sin(rads) * facteur1, x+cos(rads) * facteur2, y + sin(rads) * facteur2);
      rads = rads + tranche;
    }
    if (maxv > 0)
      maxv = maxv - 0.2 ;
  }

  else if (etatRond == 1) {
    
    fill(203, 12, 51);
   
    rads = 0;

    while ( rads < maxv ) {
      line(x+cos(rads) * facteur1, y + sin(rads) * facteur1, x+cos(rads) * facteur2, y + sin(rads) * facteur2);
      rads = rads + tranche;
    }
    if (maxv < TWO_PI)
      maxv = maxv + 0.2 ;
  }
  
  strokeWeight(5);
  stroke(17, 88, 6);
  ellipse(150, 200, 60, 60);
}

//Section des actions de la souris
//Ici la section est dépendante des ''feedback'' de la souris
//Lorsque la sourie est dans une zone circulaire comprise entre 150 et 200
//

void mousePressed() {

  float distance = dist(mouseX, mouseY, 150, 200);

  if (distance < 30) {
    if (etatRond == 0) etatRond = 1;
    else etatRond = 0;
  }

  float distance2 = dist(mouseX, mouseY, 250, 200);

  if ( mouseX > 220 && mouseX < 280 && mouseY > 170 && mouseY < 230 ) {
    if (etatCarre == 0) etatCarre = 1;
    else etatCarre = 0;
  }
}

//ici sont les actions dépendantes de du relâchement du bouton de la souris
// Quand la souris est relâché, l'état du carré retourne à zéro

void mouseReleased() {
  etatCarre = 0;
}


