
float globalAngle;
int isometryCount, depthStop;

//================================================================

void setup() {
  size(400,400, P2D);
  smooth();
  noStroke();
  textSize(9);
  textMode(SCREEN);
  
  globalAngle = 0.0;
  isometryCount = 6;
  depthStop = 2;
}

//================================================================

void draw() {
  background(0);
  fill(128, 255, 128, 32);
  recurse(width/2, height/2, height/4, 0.0, 0);
  globalAngle += .01;
  fill(64, 128, 64);
  text("Recursion Depth: " + depthStop, 10, 20);
}

//================================================================

void mouseReleased() {
  depthStop++;
  if (depthStop >= 7) depthStop = 1;
}

//================================================================

void recurse(float posX, float posY, float rad, float ang, int depth) {
  if (depth < depthStop) {
    float angleSegment = TWO_PI/isometryCount;
    for (int i=0; i < isometryCount; i++) {
      float newRad = rad/2;
      float newAng = ang + i*angleSegment - globalAngle;
      float newX = cos(newAng)*rad + posX;
      float newY = sin(newAng)*rad + posY;
      recurse(newX, newY, newRad, newAng, depth + 1);
    }
  }
  else
    if(rad < 2) ellipse(posX, posY, 4.0, 4.0);
    else  ellipse(posX, posY, rad*2.0, rad*2.0);
}

