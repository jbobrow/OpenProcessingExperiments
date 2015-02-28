
int radius;
int spokeLength;
int cx;
int cy;
int rotated;
int howComplex;

void setup() {
  size(800, 600);
  background(0);
  stroke(255);
  fill(255);
}

void draw() {
}

void mouseClicked() {
  ellipseMode(CENTER);

  cx = mouseX;
  cy = mouseY;
  howComplex = int(random(3, 6));
  for (int i = 0; i < howComplex; i++) {
  rotated = int(random(0, 55));
  radius = int(random(2, 10));
  spokeLength = int(random(2, 25));
  
  
    for (int j = 0; j < 7; j++) {
      float elbowX = cx + cos(radians(60*j+rotated)) * spokeLength;
      float elbowY = cy+ sin(radians(60* j+rotated))* spokeLength;
      float wristX = elbowX + cos(radians(60*j+rotated)) * spokeLength * 1.5;
      float wristY = elbowY + sin(radians(60*j+rotated)) * spokeLength * 1.5;

      ellipse(cx, cy, radius, radius);

      line(cx, cy, elbowX, elbowY);
      ellipse(elbowX, elbowY, radius, radius);
      line(elbowX, elbowY, wristX, wristY);
      ellipse(wristX, wristY, radius, radius);
    }
  }
}



