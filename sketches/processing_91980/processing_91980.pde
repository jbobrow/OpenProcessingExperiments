
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Homework 9
// Copyright Min Kyung Kim March 2013. All rights reserved.

color [ ] colList = {color (204, 229, 255),
                     color (204, 255, 255),
                     color (255, 255, 255),
                     color (204, 255, 255),
                     color (204, 255, 255),
                     color (204, 229, 255),
                     color (204, 255, 255),
                     color (204, 255, 255),
                     color (204, 255, 255),
                     color (204, 255, 255)};
float [ ] xList = {random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370),
                   random (30, 370)};
float [ ] yList = {random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270),
                   random (30, 270)};
float [ ] sizeList = {random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50),
                      random (5, 50)};

void setup ( ) {
  size (400, 400);
  background (108, 156, 229);
  smooth ( );
}

void draw ( ) {
  drawLines ( );
  drawDots ( );
  drawBubbles ( );
}

void drawLines ( ) {
  int r1 = 0;
  int t1 = 0;
  int r = width;
  int t = height;
  stroke (220);
  strokeWeight (0.01);
  while (r <= width && r >= 0) {
    line (r1, t1, r, t);
    r1 = r1 - 5;
    t1 = t1 + 5;
    r = r - 5;
    t = t + 5;
  }
}

void drawBubbles ( ) {
  for (int a = 0; a < xList.length; a++) {
    noStroke ( );
    fill (colList [a]);
    ellipse (xList [a], yList [a], sizeList [a], sizeList [a]);
  }
}

void drawDots ( ) {
  for (int b = 0; b < width; b = b + 5) {
    for (int c = 0; c < height; c = c + 5) {
      strokeWeight (1.1);
      stroke (220);
      point (b, c);
    }
  }
}
                     
                   

