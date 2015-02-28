
SnowFlake mySnowFlake;
void setup() {
  frameRate(15);
  size(800, 800);
  background(0);
}

void draw() {

}

void mousePressed() {
  
  mySnowFlake = new SnowFlake(mouseX, mouseY, int(random(3, 12)));
  mySnowFlake.display(); 
}



class SnowFlake {

  int radius;
  int spokeLength;
  int cx;
  int cy;
  int rotated;
  int howComplex;
  int speed;

  SnowFlake(int centerX, int centerY, int theSpeed) {

    cx = centerX;
    cy = centerY;
    rotated = int(random(0, 55));
    radius = int(random(2, 10));
    spokeLength = int(random(2, 25));
    howComplex = int(random(3, 9));
    speed = theSpeed;
  }

  void display() {

    ellipseMode(CENTER);
    stroke(255);
    fill(255);
    for (int i = 0; i < howComplex; i++) {
      rotated = int(random(0, 55));
      radius = int(random(3, 10));
      spokeLength = int(random(10, 30));
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
}



