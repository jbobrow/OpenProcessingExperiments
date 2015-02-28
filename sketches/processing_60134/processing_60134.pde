
/*Verwende Variablen. Zeichne eine einfache Form (z.B. Kreis, Rechteck). 
Die Form soll bei gedrückter Maustaste immer größer werden. Bei Tastendruck 
soll die Grösse auf den initialen Wert zurück gesetzt werden. */


int width = 5;
int height = 5;


void setup() {
  size(500,500);
  smooth(); 
}


void draw() {
  background(0);
  
  noStroke();
  fill(200,0,50);
  ellipse(255,255,width,height);
}


void mousePressed() {
  width = width + 20;
  height = height + 20;
}

  
void keyPressed() {
  width = 20;
  height = 20;  
}


