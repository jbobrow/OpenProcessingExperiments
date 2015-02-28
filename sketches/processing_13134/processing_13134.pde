
/*Flashing & Random!
By: Caroline Sievers
September 29th, 2010*/

float bcolor;
float x, y;
float speedX, speedY, gravity, damping, friction;
float radius;
float fillCol;
int rectCount = 500;
float[] xs = new float[rectCount];
float[] ys = new float[rectCount];
float[] speedXS = new float[rectCount];
float[] speedYS = new float[rectCount];
float[] gravityS = new float[rectCount];
float[] dampingS = new float[rectCount];
float[] frictionS = new float[rectCount];
float[] radiusS = new float[rectCount];


void setup(){
  size(600, 400);
  speedX = 3.2;
  speedY = 0.0;
  gravity = 0.2;
  damping = 0.8;
  friction = 0.75;
  radius = 40;
  rectMode(CENTER);
  
  for (int i=0; i<rectCount; i++) { 
    speedXS[i] = random(-5, 5);
    gravityS[i] = random(-.2, .2);
    dampingS[i] = random(.9);
    frictionS[i] = random(.9);
    radiusS[i] = random(6, 6);
  }
}

void draw(){
  colorMode(HSB, 359, 99, 99);
  background(bcolor, 88, 93);
  bcolor ();
  move();
  collide();
}


void bcolor() {
  if (bcolor > 359) {
    bcolor = 0;
  } 
  if (bcolor >= 0) {
    bcolor += 5;
  }
}

void move() {
  for (int i=0; i<rectCount; i++) {
    xs[i] += speedXS[i];
    speedYS[i] += gravityS[i];
    ys[i] += speedYS[i];

    pushMatrix();
    translate(xs[i], ys[i]);
    rotate(radians(frameCount));
    smooth();
    fill(0);
    rect(0, 0, radiusS[i]*2, radiusS[i]*2);
    popMatrix();
  }
}

void collide() {
  for (int i=0; i<rectCount; i++) {
    if (xs[i] > width-radiusS[i]*2) {
      xs[i] = width-radiusS[i]*2;
      speedXS[i] *= -1.5;
    } 
    else if (xs[i] < radiusS[i]*2) {
      xs[i] = radiusS[i]*2;
      speedXS[i] *= -1.5;
    }

    if (ys[i] > height-radiusS[i]*2) {
      ys[i] = height-radiusS[i]*2;
      speedYS[i] *= -2;
      speedYS[i] *= dampingS[i];
      speedXS[i] *= frictionS[i];
    } 
    else if (ys[i] < radiusS[i]*2) {
      ys[i] = radiusS[i]*2;
      speedYS[i] *= -2;
    }
  }
}



