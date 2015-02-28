
int anzahl = 40;
float drehung = 0;
float pX, pY = 0;
float[] posX;
float[] posY;

void setup() {
  size(600, 600);
  smooth();
  stroke(255);
}

void draw() {
  background(50);
  drehung += TWO_PI/360/4;
  posX = new float[anzahl];
  posY = new float[anzahl];
  for (int i=0;i<anzahl;i++) {
    float winkel = map(i, 0, anzahl, 0, TWO_PI);
    winkel += drehung;

    float faktorX = map(mouseX, 0, width, 1, 2);
    float faktorY = map(mouseY, 0, width, 1, 3);

    float x=width/2 + sin(winkel*faktorX)*200;
    float y=height/2 - cos(winkel*faktorY)*200; 

    posX[i] = x;
    posY[i] = y;
  }


  for (int d=0;d<anzahl;d++) {
    for (int j=d;j<anzahl;j++) {
      float abstand = dist(posX[d], posY[d], posX[j], posY[j]);
      float alphawert = map(abstand, 0, 200, 255, 0);
      stroke(255, alphawert);

      if (alphawert > 1) line(posX[d], posY[d], posX[j], posY[j]);
    }
  }
  stroke(255);

  for (int d=0;d<anzahl-1;d++) {  
    line(posX[d], posY[d], posX[d+1], posY[d+1]);
  }

  noStroke();
  fill(255);
  for (int d=0;d<anzahl;d++) {  
    ellipse(posX[d], posY[d], 8, 8);
  }
}

void keyPressed() {
  if (key == '+') anzahl*=2;
  if (key == '-') anzahl/=2;
  anzahl = min(100,anzahl);
  anzahl = max(4,anzahl);
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
// http://www.generative-gestaltung.de
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


