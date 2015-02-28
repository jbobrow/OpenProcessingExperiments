
/*Verwende Variablen. 
Zeichne eine einfache Form (z.B. Kreis, Rechteck). 
Die Form soll bei gedrückter Maustaste immer größer werden. 
Bei Tastendruck soll die Grösse auf den initialen Wert zurück gesetzt werden.*/ 


int circleSize = 20;
int xPos;
int yPos;

void setup(){
  size(400,400);
  background(200);
  smooth();
  xPos = width/2;
  yPos = height/2;
}



void draw(){
  background(200);
  noStroke();
  fill(152,21,56);
  ellipse(xPos,yPos,circleSize,circleSize);
}

void mousePressed(){
  circleSize = circleSize + 15;
}

void keyPressed(){
  circleSize = 20;
}

