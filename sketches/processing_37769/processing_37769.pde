
float x0, y0, x1, y1, x2, y2;
float X, Y;

// in rads
float ang0, ang1, ang2;

float INC0 = 0.1 * 2;
float INC1 = 0.1 * 2;
float INC2 = 0.1 * 2;

float RAIO = 120;
boolean drawOut = true;

float rand0;

void setup() {
  size(500, 500);
  smooth();
  frameRate(20);
  background(110);
  ang0 = ang1 = ang2 = 0;
  X = width/2;
  Y = height/2;
  fill(255, 111, 111,200);
  rand0 = random(10, 30);
}


void draw() {
  x0 = cos(ang0) * RAIO + X;
  y0 = sin(ang0) * RAIO + Y;

  x1 = cos(ang1-rand0) * RAIO/2 + X+rand0;
  y1 = sin(ang1-rand0) * RAIO/2 + Y+rand0;

  x2 = cos(ang2) * RAIO + X;
  y2 = sin(ang2) * RAIO + Y;

  triangle(X, Y, x1, y1, x2, y2);

  ang0 += INC0;
  if ((ang0 >= (TWO_PI+PI)) || (ang0 <= 0)) {
    ang0 = 0;
    if (drawOut == true) {
      drawOut = false;
      RAIO = RAIO/3;
      stroke(20);
      fill(204, 20, 20, 120);
    }
    else {
      X = random(20, width-20);
      Y = random(20, height-20);
      RAIO = random(100, 150);
      stroke(20);
      fill(255, 111, 111, 200);
      rand0 = random(10, 30);
      drawOut = true;
    }
  }

  ang1 += INC1;
  if ((ang1 >= TWO_PI) || (ang1 <= 0)) {
    ang1 = 0;
  }

  ang2 += INC2;
  if ((ang2 >= TWO_PI) || (ang2 <= 0)) {
    ang2 = 0;
  }
}
                
