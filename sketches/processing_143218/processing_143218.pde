
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song YoungJun
// ID: 201420083

float angle;

void setup() {
  //setupAudio();
  size (600, 600);
  smooth();
}
float r = random(-5, 5);
float cX = 5;

void draw() {
  background(0);
  noStroke();
  angle += 0.001;
  translate(width/2, height/2);

  /*
  //Center ellipse
   getVolume();
   float X = map(volume, 0, 200, 2, 150);
   float Y = map(volume, 0, 200, 2, 150);
   */

  fill (255, 30);
  ellipse(0, 0, X, Y);
  ellipse(-200, -200, X, Y);
  ellipse(-200, 200, X, Y);
  ellipse(200, 200, X, Y);
  ellipse(200, -200, X, Y);

  //Pattern - Rect
  for (int i = -300; i <= height/2; i = i +30) {
    for (int j = -300; j <= width/2; j = j +30) {
      fill(random(255), 70);
      rectMode(CENTER);
      rect (i, j, cX, cX);
    }
  }  

  //Rotate - Rect
  for (int i=0; i<80; i++) {
    fill (255, 80);

    rotate(angle);
    rect(150, 150, 50, 50);
    if (mousePressed) {
      scale(0.95);
    }
  }
  cX = cX + 0.5;
  if (cX == 100) {
    cX = 0;
  }
}

