
//G. multiple rings (each an object) circling center

Ring[] myRings;
int numRings = 12;

void setup() {
  size(400, 400);
  myRings = new Ring[numRings];
  float radius = 5;
  float speed = 1;
  float diameter = 3;
  for (int i = 0; i < numRings; i++) {
    myRings[i] = new Ring(radius, speed, diameter);
    radius+=90/diameter;
    speed-= 0.3;
    diameter+=5;
  }
  noStroke();
  fill(#9999FF);
}

void draw() {
  background(#9900FF);
  for (int i = 0; i < numRings; i++) {
    myRings[i].ringTurn();
  }
}


class Ring {
  float radius;
  float speed;
  float diameter;
  float startDeg;

  Ring(float tempRadius, float tempSpeed, float tempDiameter) {
    radius = tempRadius;
    speed = tempSpeed;
    diameter = tempDiameter;
    startDeg = 0;
  }

  void ringTurn() {
    for (float n = startDeg; n < 360+startDeg; n+=20) {
      float xPos = width/2 + sin(radians(n))* radius;
      float yPos = height/2 + cos(radians(n))* radius;
      ellipse(xPos, yPos, diameter, diameter);
    }
    startDeg += speed;
    startDeg = startDeg % 360;
  }
}



