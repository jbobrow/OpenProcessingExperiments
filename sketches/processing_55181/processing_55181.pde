
int particleCount = 200;
float[] x = new float [particleCount];
float[] y = new float [particleCount];
float[] spdX = new float [particleCount];
float[] spdY = new float [particleCount];
float[] r = new float [particleCount];
float[] gravity = new float [particleCount];
float[] damping = new float [particleCount];
float[] friction = new float [particleCount];
color[] ballcolor = new color[particleCount];
int stairCount = 5;
float xPos = -400;
float yPos = 200;

void setup() {
  size(800, 600);
  stairs();
  for (int i=0; i<particleCount; i++) {
    spdX[i] = random(1, 10);
    spdY[i] = 0.0;
    r[i] = random(2, 4);
    gravity[i] = random(.16, .19);
    damping[i] = random(.75, .9);
    friction[i] = random(.6, .88);
    ballcolor[i] = color(random(255), random(255), random(255));
  }
  /*
   pushMatrix();
   fill(0);
   rect(600, 25, 125, 175);
   popMatrix();
   
   pushMatrix();
   fill(84, 131, 234);
   rect(607, 32, 110, 160);
   popMatrix();
   */
}

void draw() {

  ball();
  stairs();
}

void stairs() {
  noStroke();
  fill(0);
  beginShape();
  for (int i=-1; i<stairCount; i++) {
    rect(xPos, yPos, 600, 120);
    xPos += 100;
    yPos += 80;
  }
  endShape();
  xPos = -400;
  yPos = 200;
}

void ball() {
  background(255);

  stroke(0);

  for (int i=0; i<particleCount; i++) {
    ellipse(x[i], y[i], r[i]*4, r[i]*4);

    fill(ballcolor[i]);



    x[i]+=spdX[i];
    spdY[i] += gravity[i];
    y[i]+=spdY[i];

    if (x[i]>width-r[i]) {
      x[i] = width-r[i];
      spdX[i]*=-1;
    } 
    if (x[i] < r[i]) {
      x[i] = r[i];
      spdX[i]*=-1;
    } 
    if (y[i]>height-r[i]) {
      y[i] = height-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    } 
    else if (y[i]<r[i]) {
      y[i] = r[i];
      spdY[i]*=-1;
    } 
    if (y[i] >200-r[i] && x[i]<200) {
      y[i] = 200-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    } 
    if (y[i]> 280-r[i] && x[i]>200 && x[i]<300) {
      y[i] = 280-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    } 
    if (y[i]>360-r[i] && x[i]>300 && x[i]<400) {
      y[i] = 360-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }

    if (y[i]>440-r[i] && x[i]>400 && x[i]<500) {
      y[i] = 440-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }

    if (y[i]>520-r[i] && x[i]>500 && x[i]<600) {
      y[i] = 520-r[i];
      spdY[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }

    if (x[i]<200+r[i] && y[i]>200 && y[i]<280) {
      x[i] = 200+r[i];
      spdX[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }

    if (x[i]<300+r[i] && y[i]>280 && y[i]<360) {
      x[i] = 300+r[i];
      spdX[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }

    if (x[i]<400+r[i] && y[i]>360 && y[i]<440) {
      x[i] = 400+r[i];
      spdX[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }
    if (x[i]<500+r[i] && y[i]>440 && y[i]<520) {
      x[i] = 500+r[i];
      spdX[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }
    if (x[i]<600+r[i] && y[i]>520 && y[i]<6000) {
      x[i] = 600+r[i];
      spdX[i]*=-1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    }
  }
}


