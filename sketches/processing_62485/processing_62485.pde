
boolean negative = false;
char backColorR = 255;
char backColorG = 255;
char backColorB = 255;
char ellColorR = 0;
char ellColorG = 0;
char ellColorB = 0;
char pointColorR = 0;
char pointColorG = 0;
char pointColorB = 0;

void setup() {
  size(800, 800);
}

void draw() {
  background(backColorR, backColorG, backColorB);
  stroke(pointColorR, pointColorG, pointColorB);
  for (int i = 0; i < 800; i = i+5) {
    for (int j = 0; j < 800; j = j+5) {
      point(i, j);
    }
  }
  noStroke();
  fill(ellColorR, ellColorG, ellColorB);
  ellipseMode(CORNERS);
  ellipse(width/2, height/2, mouseX, mouseY);
}

void mousePressed() {
  if(negative == false) {
    backColorR = 0;
    backColorG = 0;
    backColorB = 0;
    ellColorR = 255;
    ellColorG = 255;
    ellColorB = 255;
    pointColorR = 255;
    pointColorG = 255;
    pointColorB = 255;
    negative = true;
  } else {
    backColorR = 255;
    backColorG = 255;
    backColorB = 255;
    ellColorR = 0;
    ellColorG = 0;
    ellColorB = 0;
    pointColorR = 0;
    pointColorG = 0;
    pointColorB = 0;
    negative = false;
  }
}

