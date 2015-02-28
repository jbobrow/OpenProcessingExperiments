
void setup() {
  size(800, 600);
  background(220, 220, 225);

}
//end void setup()

int rot = 100;
int gruen = 100;
int blau = 100;

// aenderungsschritte farbe
int rotBack = 9;
int gruenBack = 6;
int blauBack = 3;

float xStart = 0;
float yStart = 0;
float xZug = 0;
float yZug = 0;

void draw() {


  // linie zur mausposition 
  stroke(rot, gruen, blau, 5);//niedriger wert-> schraffurähnlich
  for (int i=-50; i <50; i++) {
    line(xStart, yStart, mouseX+random(-i, i)*0.2, mouseY+random(-i, i)*0.2);
  }

  // wenn voller farbwert erreicht ist - skala rückwerts durchlaufen
  if (rot > 255) {
    rotBack *= -1;
  }
  if (rot < 80) {
    rotBack *= -1;
  }
  if (gruen > 255) {
    gruenBack *= -1;
  }
  if (gruen < 80) {
    gruenBack *= -1;
  }
  if (blau > 255) {
    blauBack *= -1;
  }
  if (blau < 80) {
    blauBack *= -1;
  }

  rot = rot + rotBack;
  gruen = gruen + gruenBack;
  blau = blau + blauBack;

  // position aendern pow erster wert: base of the exponential expression, 2.= power by which to raise the base
  float distanz = pow(pow(mouseX - xStart, 2) + pow(mouseY - yStart, 2), 0.5);
  xZug += (mouseX > xStart ? 1 : -1) * distanz/1000;
  yZug += (mouseY > yStart ? 1 : -1) *  distanz/1000;


  xStart += xZug;
  yStart += yZug;  

  //rahmen
  if (xStart > 800) {
    xStart = 799;
    xZug = -xZug/1.5;
  }
  if (xStart < 0) {
    xStart = 1;
    xZug = -xZug/1.5;
  }
  if (yStart > 600) {
    yStart = 599;
    yZug = -yZug/1.5;
  }
  if (yStart < 0) {
    yStart = 1;
    yZug = -yZug/1.5;
  }

  strokeWeight(1);
  fill(255, 255, 255); 
  ellipse(xStart, yStart, 3.7, 3.7);
}//end void draw()
