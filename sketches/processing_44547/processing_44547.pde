
float x, y, cp1X, cp1Y, cp2X, cp2Y, endX, endY, distX, distY, stretch;
int num = 25;  // Number of bezier segments in chain.
int iterations = 2;  // Scaler based on width.
float contain = 15; //  Limit curviness of beziers.
color shade = color(0);
int alphaVal = 155;  // Alpha value variance.
float spacing = .5;
float thickness = 3;  // StrokeWeight variance.

void setup() {
  size(600, 600);
  background(255);
  noFill();
  smooth();
  x = 0;  //  Setup first segment.
  y = 0;
  endX = 0;  // First end point.
}

void draw() {

  for (int j = 0; j < width * iterations; j++) {  

    beginShape();

    vertex(x, y); // First point
    cp1X = x + random(-contain, contain); //  First control point.
    cp1Y = y + random(-contain, contain);

    endY = height/num + random(-height/num, height/num);
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

        //  endX = 0;
        endY += height/num + random(-height/num, height/num);
        cp2X = endX + random(-contain, contain);
        cp2Y = endY + random(-contain, contain);
      }

      bezierVertex(cp1X, cp1Y, cp2X, cp2Y, endX, endY);
    }

    //color shade = color(random(50), random(40), random(20));
    stroke(shade, random(alphaVal));
    endShape();

    x += spacing;
    endX += spacing;
    strokeWeight(random(thickness));
  }

  //filter(DILATE);
  filter(INVERT);
  //filter(ERODE);
  //filter(BLUR, 1);
  //filter(THRESHOLD, 0.2);
  //filter(POSTERIZE, 7);

  noLoop();
}

void mousePressed() {
  loop();
  setup();
}

