
float rad = 20;
float baseRad = 40;
float angle = 0;
float angleStep = 10;
int gridStep = 100;

float circleRes = 2;


void setup() {
  size(400, 400);
  smooth();
  strokeWeight(0.5);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 60);
}

void draw() {
  //  noStroke();
  //  fill(0,0,100);
  //  rect(0, 0, width, height);

  if (angle >=360) {
    angle = 0;
  } 
  else {
    angle += angleStep;
  }

  stroke(0);
  for (int gridX = gridStep; gridX<=width-gridStep; gridX +=gridStep) { 
    for (int gridY = gridStep; gridY<=height-gridStep; gridY +=gridStep) {


      float x = gridX + cos(radians(angle)) * rad;
      float y = gridY + sin(radians(angle)) * rad;

      for (float angle = 0; angle <= 360; angle += circleRes) {
        stroke(360-angle, 100, 100);
        float x2 = gridX + cos(radians(angle)) * baseRad;
        float y2 = gridY + sin(radians(angle)) * baseRad;
        line(x, y, x2, y2);
      }
    }
  }
}


