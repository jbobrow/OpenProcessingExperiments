
//  R.A. Robertson 2011.10 "Jigsaw" ~ www.rariora.org ~

float x, y, cp1X, cp1Y, cp2X, cp2Y, endX, endY, distX, distY, stretch;
int num = 5;
float contain = 100; //  Limit cp2 distance from endpoint

void setup() {
  size(600, 600);
  background(250);
  noFill();
  smooth();
}

void draw() {
  beginShape();

  vertex(0, 0);

  x = width/2;  //  Setup first segment of bezier.
  y = 0;
  vertex(x, y); // First point
  cp1X = x + random(-contain, contain); //  First control point.
  cp1Y = y + random(contain);
  endX = width/2;  // First end point.
  endY = height/num;
  cp2X = endX + random(-contain, contain); //  Second control point.
  cp2Y = endY + random(-contain, contain);

  for (int i = 0; i < num; i++) { //  Loop the remaining segments.
    //  Get distance from endpoint and last control point.
    distX = endX - cp2X;
    distY = endY - cp2Y;
    stretch = random(0.5, 1); //  (See notes below.)

    if (i != 0) {
      //  Set next control point same distance opposite endpoint, plus offset.
      //  This straight line from cp2, endpoint, and cp1 smoothes the joint.
      cp1X = endX + (distX * stretch);
      cp1Y = endY + (distY * stretch);

      endX = width/2;
      endY += height/num;

      cp2X = endX + random(-contain, contain);
      cp2Y = endY + random(-contain, contain);
    }

    bezierVertex(cp1X, cp1Y, cp2X, cp2Y, endX, endY);
  }
  vertex(0, height);
  fill(0);
  endShape(CLOSE);
  noLoop();
}

void mousePressed() {
  loop();
  setup();
}

