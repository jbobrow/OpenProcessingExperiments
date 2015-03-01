
float[] xPos = null;
float[] yPos = null;
float[] radius = null;

int maxAnzahlDerPunkte = 1000; // Anzahl der Elemente, die jedes Array aufnehmen kann
int fuellStand = 0;  // anzahl der Elemente, die zum aktuellen Zeitpunkt tatsächlich in den Arrays liegen 

int minRad = 1;
int maxRad = 6;


void setup() {
  size(600, 200);
  smooth();

  xPos = new float[ maxAnzahlDerPunkte];
  yPos = new float[ maxAnzahlDerPunkte];
  radius = new float[ maxAnzahlDerPunkte];

  // ersten Punkt in die Arrays legen
  xPos[0] = width/2;
  yPos[0] = height/2;
  radius[0] = 10;

  // fuellestand um 1 erhoehen, damit beim nächsten Hinzufügen die nächsten Arrayeinträge befüllt werden
  fuellStand = fuellStand + 1;
}


void draw() {

  background(#57385c);
  noStroke();
  fill (#ffedbc);

  if (fuellStand < xPos.length) {
    addPoint();
  }
  drawPoint();
}

void drawPoint() {
  // alles zeichnen
  int j = 0;
  while (j < fuellStand) {

    ellipse( xPos[j], yPos[j], 2 * radius[j], 2 * radius[j]);
    j = j + 1;
  }
}

void addPoint() {
  float newR = random(minRad, maxRad);
  float newX = random(newR, width-newR);
  float newY = random(newR, height-newR);

  float closestDist = 100000000;
  int closestIndex = 0;

  // which circle is the closest?
  int i = 0;
  while (i < fuellStand) {
    float distance = dist(newX, newY, xPos[i], yPos[i]);
    if (distance < closestDist) {
      closestDist = distance;
      closestIndex = i;
    }
    i = i + 1;
  }

  // berechnung des Winkels zwischen gefundenen, nähsten Punkt und dem neuem Punkt
  float angle = atan2(newY-yPos[closestIndex], newX-xPos[closestIndex]);

  // berechnung des abstandes zu neuem Punkt, so dass keine Überschneidung entsteht
  float noIntersectionDistance = newR + radius[closestIndex];

  // aktualisierung des standorts des neuen Punktes
  newX = xPos[closestIndex] + cos(angle) * noIntersectionDistance * 0.8;
  newY = yPos[closestIndex] + sin(angle) * noIntersectionDistance * 0.8;

  // hinzufügen des neuen Punktes zu den Arrays
  xPos[fuellStand] = newX;
  yPos[fuellStand] = newY;
  radius[fuellStand] = newR;

  // fuellestand um 1 erhoehen, damit beim nächsten Hinzufügen die nächsten Arrayeinträge befüllt werden
  fuellStand = fuellStand + 1;
}

void mousePressed ()
{
  xPos[fuellStand] = random(maxRad, width-maxRad);
  yPos[fuellStand] = random(maxRad, height-maxRad);
  radius[fuellStand] = random(minRad, maxRad);
  fuellStand = 1;
}



