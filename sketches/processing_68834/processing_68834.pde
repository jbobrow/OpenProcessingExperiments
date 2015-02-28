
// Valeurs bouton Rectangle
float x1;
float y1;
int w1;
int h1;
int state1;

// Valeurs bouton Cercle
float x2;
float y2;
int w2;
int h2;
int state2;

// Valeurs Rayons Cercle
float x = 111; //position x des rayons
float y = 182; //position y des rayons
int nombreDeRayons = 20; 
int longueurDesRayons = 49;

float x3, y4, x5, y6;

// Mouvement lignes cercle
float a ;

// Mouvement lignes carré
float i = 0;
float v ;

// ON - OFF
final int ON = 1;
final int OFF = 0;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  //Bouton Maintenu valeurs
  x1 = width/1.7;
  y1 = height/2.5;
  w1 = 45;
  h1 = 45;
  state1 = OFF;

  //Bouton click valeurs
  x2 = width/3.6;
  y2 = height/2.2;
  w2 = 50;
  h2 = 50;
  state2 = OFF;
}

void draw() {
  background(113);

  // Bouton Maintenu + mouvement des lignes horizontales
  if ( state1 == ON ) {
    i = 0;
    while ( i < v ) {
      strokeWeight(5);
      stroke(0);
      line (0, i*20, width, i*20) ;
      i = i + 1 ;
    }
    v += 1 ;
    v = constrain(v, 1, 40);

    fill(245, 15, 203);
  } 
  else {

    fill(5, 255, 3);

    if (v > 0) {
      v -= 1 ;
    }
    i = 0;
    while ( i < v ) {
      strokeWeight(5);
      stroke(0);
      line (0, i*20, width, i*20);
      i = i + 1;
    }
  }

  noStroke();
  rect(x1, y1, w1, h1);


  // Bouton click  + mouvement des rayons
  float tranche = TWO_PI/nombreDeRayons;
  float rads = 0;
  float ratio = 0.6;
  stroke(0);
  strokeWeight(5);
  while ( rads < a ) {
    x3 = x+cos(rads) * longueurDesRayons * ratio;
    y4 = y + sin(rads) * longueurDesRayons * ratio;
    x5 = x+cos(rads) * longueurDesRayons;
    y6 = y + sin(rads) * longueurDesRayons;
    line(x3, y4, x5, y6);
    rads = rads + tranche ;
  }
  if ( state2 == ON ) { 

    if ( a < 7 ) { 
      a = a + 0.3;
    }
    fill(245, 15, 203);
  } 
  else {

    if ( a > 0 ) {
      a = a - 0.3;
    }
    fill(5, 255, 3);
  }
  noStroke();
  ellipse(x2, y2, w2, h2);
}

void mousePressed() {

  if ( mouseX>x1 && mouseX<x1+w1 && mouseY>y1 && mouseY<y1+h1 ) {

    if (state1 == OFF) {
      state1 = ON ;
    }
    else {
      state1 = OFF;
    }
  }

  float distance = dist(mouseX, mouseY, width/3.6, height/2.5);
  if ( distance < 50 ) {
    if (state2 == OFF) {  
      state2 = ON;
    } 
    else {

      state2 = OFF;
    }
  }
}

void mouseReleased() {
  state1 = OFF;
}
