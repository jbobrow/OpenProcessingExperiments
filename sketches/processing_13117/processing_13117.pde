
/*
Sam Wood
CSE 1341
due 10/6/10

Some code borrowed from Ira Greenberg and then altered
*/

int ballCount = 1500;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speedX1 = new float[ballCount];
float[] speedX2 = new float[ballCount];
float[] speedY = new float[ballCount];
float[] gravity = new float[ballCount];
float[] damping = new float[ballCount];
float[] friction = new float[ballCount];
float[] radius = new float[ballCount];

void setup() {
  size(600, 600);
  
  // input variables
  for (int i=0; i<ballCount; i++) { 
    speedX1[i] = random(.1, 2.5);
    speedX2[i] = random(-2.5, -.1);
    speedY[i] = random(-2.0);
    gravity[i] = random(.001, .005);
    radius[i] = random(1, 1.5);
  }
}

// drawing the snowflakes, buildings, moon, and background landscape
void draw() {
  background(40, 45, 95);
  noStroke();
  smooth();
  fill(210, 210, 225, 150);
  ellipse(75, 150, 100, 100);
  fill(185, 185, 200, 150);
  ellipse(72, 147, 80, 80);
  fill(20, 75, 25, 150);
  rect(0, 455, 600, 300);
  stroke(115, 115, 160);
  strokeWeight(2);
  fill(80, 80, 115); 
  rect(100, 325, 100, 300);
  rect(45, 375, 100, 300);
  rect(300, 300, 100, 300);
  rect(215, 500, 100, 300);
  rect(450, 350, 100, 300); 
  rect(375, 450, 100, 300);
  fill(210, 210, 225, 100);
  noStroke();
  rect(170, 335, 25, 75);
  rect(115, 385, 25, 75);
  rect(370, 310, 25, 75);
  rect(285, 510, 25, 75);
  rect(520, 360, 25, 75); 
  rect(445, 460, 25, 75);
  stroke(135, 190, 230);//(0, 105, 185);
  strokeWeight(1);
  noSmooth();
  fill(195, 220, 240);//(0, 140, 255);  
  move();
  collide();
}

// making the snowflakes fall
void move() {
  for (int i=0; i<ballCount; i++) {
    x[i] += speedX1[i];
    speedY[i] += gravity[i];
    y[i] += speedY[i];

    pushMatrix();
    translate(x[i], y[i]);
    ellipse(0, 0, radius[i]*2, radius[i]*2);
    popMatrix();
  }
  
  for (int j=0; j<ballCount; j++) {
    x[j] += speedX2[j];
    speedY[j] += gravity[j];
    y[j] += speedY[j];

    pushMatrix();
    translate(x[j], y[j]);
    ellipse(600, 0, radius[j]*2, radius[j]*2);
    popMatrix();
  }
  
}

// making snowflakes come to rest on buildings
void collide() {
  for(int i=0; i<ballCount; i++) {
    if (x[i] > 45 && x[i] < 145 && y[i] > 374 && y[i] < 377) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    } 
    if (x[i] > 100 && x[i] < 200 && y[i] > 323 && y[i] < 326) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    if (x[i] > 215 && x[i] < 315 && y[i] > 498 && y[i] < 501) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    if (x[i] > 300 && x[i] < 400 && y[i] > 298 && y[i] < 301) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    if (x[i] > 375 && x[i] < 475 && y[i] > 448 && y[i] < 451) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    if (x[i] > 450 && x[i] < 550 && y[i] > 348 && y[i] < 351) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
  }
}


