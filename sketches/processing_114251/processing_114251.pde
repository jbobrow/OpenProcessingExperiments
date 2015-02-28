
//Kairavi Chahal | kchahal
//Homework 7 | October 8, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//Use arrow keys to change speeds. R to reset.
//UP    : increase dx for C.
//DOWN  : increase dx for K.
//LEFT  : increase dy for C.
//RIGHT : increase dy for K.

//BUG: sometimes the figures collide and get stuck to each other. Tried adding
//     move1() and move2() to the collision() function, but it still happens.

float x1, y1, x2, y2;
int dx1, dy1, dx2, dy2, w1, w2;
int collisions;
color col1, col2;

void setup() {
  size(400, 400);
  collisions = 0;
  
  x1 = random(width);
  y1 = random(height);
  dx1 = int(random(1, 5));
  dy1 = int(random(1, 5));
  w1 = 20;
  col1 = color(random(255), random(255), random(255));
  
  x1 = x2 = 0;
  dx2 = int(random(1, 5));
  dy2 = int(random(1, 5));
  w2 = 20;
  col2 = color(random(255), random(255), random(255));
}

void draw() {  
  screen();
  
  move1();
  draw1();
  
  move2();
  draw2();
  
  collision();
}

void keyPressed() {
  if (keyCode == DOWN) {
    dx1++;
    if (dx1 > 5) {
      dx1 -= 5;
    }
  }
  if (keyCode == RIGHT) {
    dy1++;
    if (dy1 > 5) {
      dy1 -= 5;
    }
  }
  
  if (keyCode == UP) {
    dx2++;
  }
  if (keyCode == LEFT) {
    dy2++;
  }
  
  if (key == 'r' || key == 'R') {
    randomize();
    collisions = 0;
  }
}

void collision() {
  float d = dist(x1+(w1*2), y1+(w1*2.5), x2+(w2*2), y2+(w2*2.5));
  if (d < (w1*2.5 + w2*2.5)) {
    fill(255, 0, 0, 75);
    rect(0, 0, width, height);
    swap();
    move1();
    move2();
    collisions++;
  }
}

void swap() {
  int tempx = dx1;
  dx1 = dx2;
  dx2 = tempx;
  
  int tempy = dy1;
  dy1 = dy2;
  dy2 = tempy;
  
  color tempcol = col1;
  col1 = col2;
  col2 = tempcol;
}

void randomize() {
  x1 = random(width);
  y1 = random(height);
  
  x2 = random(width);
  y2 = random(height);
  
  dx1 = int(random(1, 5));
  dy1 = int(random(1, 5));
  
  dx2 = int(random(1, 5));
  dy2 = int(random(1, 5));
}

void move2() {
  //bouncing motion
  x2 += dx2;
  if (x2 > width-(w2*4) || x2 < 0) {
    dx2 = -dx2;
  }
  y2 += dy2;
  if (y2 > height-(w2*5) || y2 < 0) {
    dy2 = -dy2;
  }
}

void draw2() {
  //C
  fill(col2);
  rect(x2, y2+w2, w2, w2*3);
  rect(x2+w2, y2, w2*2, w2);
  rect(x2+w2, y2+(w2*4), w2*2, w2);
  rect(x2+(w2*3), y2+w2, w2, w2);
  rect(x2+(w2*3), y2+(w2*3), w2, w2);
}

void move1() {
  //wrapping motion
  x1 += dx1;
  if (x1 > width) {
    x1 = 0;
  }
  if (x1 < 0) {
    x1 = width;
  }
  
  y1 += dy1;
  if (y1 > height) {
    y1 = 0;
  }
  if (y1 < 0) {
    y1 = height;
  }
}

void draw1() {
  //K
  fill(col1);
  rect(x1, y1, w1, w1*5);
  rect(x1+(w1*3), y1, w1, w1);
  rect(x1+(w1*2), y1+w1, w1, w1);
  rect(x1+w1, y1+(w1*2), w1, w1);
  rect(x1+(w1*2), y1+(w1*3), w1, w1);
  rect(x1+(w1*3), y1+(w1*4), w1, w1);
}

void screen() {
  fill(200);
  rect(0, 0, width, height);
  fill(0);
  
  textAlign(LEFT);
  text("K speed:", 15, 20);
  text("dx: " + int(dx1), 15, 40);
  text("dy: " + int(dy1), 15, 60);
  
  textAlign(RIGHT);
  text("C speed:", width-15, 20);
  text("dx: " + int(dx2), width-15, 40);
  text("dy: " + int(dy2), width-15, 60);
  
  textAlign(CENTER);
  text("Collisions: " + collisions, width/2, height-15);
}

//TO DO: implement 3D version of this.
//TO DO: add rotation.


