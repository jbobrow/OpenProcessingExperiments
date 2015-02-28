
//  R.A. Robertson 2011.10 "Smoothly Joined Bezier" ~ www.rariora.org ~
float x, y, cp1X, cp1Y, cp2X, cp2Y, endX, endY, distX, distY, stretch;
int num = 5;
float d = 20; // Diameter.
float contain = 100; //  Limit cp2 distance from endpoint

void setup() {
  size(600, 600);
  background(250);
  noFill();
  smooth();
}

void draw() {
  beginShape();

  x = width/2;  //  Setup first segment.
  y = 0;
  vertex(x, y); // First point
  stroke(0, 100, 0);
  ellipse(x, y, d, d); // Show start.
  cp1X = x + random(-contain, contain); //  First control point.
  cp1Y = y + random(-contain, contain);
  stroke(100, 0, 0, 100);
  ellipse(cp1X, cp1Y, 20, 20);
  line(x, y, cp1X, cp1Y);
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
      stroke(100, 0, 0, 75);  // Show Control Points 1.
      ellipse(cp1X, cp1Y, d/2, d/2);
      line(endX, endY, cp1X, cp1Y);

      endX = width/2;
      endY += height/num;

      cp2X = endX + random(-contain, contain);
      cp2Y = endY + random(-contain, contain);
    }

    stroke(0, 0, 100, 75);  //  Show Control Points 2.
    ellipse(cp2X, cp2Y, d/2, d/2);
    line(endX, endY, cp2X, cp2Y);

    stroke(0, 100, 0);
    ellipse(endX, endY, d/2, d/2); //  Show End points.

    bezierVertex(cp1X, cp1Y, cp2X, cp2Y, endX, endY);
  }

  stroke(0);
  endShape();
  noLoop();
}

void mousePressed() {
  loop();
  setup();
}
                                
