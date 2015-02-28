
int ballCount = 200;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speedX = new float[ballCount];
float[] speedY = new float[ballCount];
float[] gravity = new float[ballCount];
float[] damping = new float[ballCount];
float[] friction = new float[ballCount];
float[] radius = new float[ballCount];

void setup(){
  size(800, 800);
  background(255);
  smooth();
  
  for (int i=0; i<ballCount; i++) {
    x[i] = 200;
    y[i] = 200;
    speedX[i] = random(-1.0, 1.0);
    speedY[i] = random(-8.0, -6.0);
    gravity[i] = .09;
    damping[i] = 0;
    friction[i] = random(.9);
    radius[i] = random(1, 2);
  }
  
  for (int i=0; i<ballCount2; i++) {
    x2[i] = 600;
    y2[i] = 600;
    speedX2[i] = random(-1.0, 1.0);
    speedY2[i] = random(-10.0, -8.0);
    gravity2[i] = .1;
    damping2[i] = 0;
    friction2[i] = random(.9);
    length2[i] = random(1, 3);
  }  
  
    for (int i=0; i<ballCount3; i++) {
    x3[i] = 300;
    y3[i] = 700;
    speedX3[i] = random(-1.0, 1.0);
    speedY3[i] = random(-10.0, -8.0);
    gravity3[i] = .1;
    damping3[i] = 0;
    friction3[i] = random(.9);
    length3[i] = random(1, 3);
  }
}

void draw() {
  background(0);
  move();
  collide();
  move2();
  collide2();
  move3();
  collide3();
  } 

void move() {
  for (int i=0; i<ballCount; i++) {
    x[i] += speedX[i];
    speedY[i] += gravity[i];
    y[i] += speedY[i];

    pushMatrix();
    translate(x[i], y[i]);
    noStroke();
    fill(random(255),random(255),random(255) );
    ellipse(0,0, radius[i]*2, radius[i]*2);
    popMatrix();
  }
}

void collide() {
  for (int i=0; i<ballCount; i++){
    if (y[i] > height-radius[i]) {
      y[i] = height-radius[i];
      speedY[i] *= -1;
      speedY[i] *= damping[i];
      speedX[i] *= friction[i];
    }
  }
}



