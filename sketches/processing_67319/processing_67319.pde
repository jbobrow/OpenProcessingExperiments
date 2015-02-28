
int numCircles = 50;

float[] circleX = new float[numCircles];
float[] circleY = new float[numCircles];

float[] velocityX = new float[numCircles];
float[] velocityY = new float[numCircles];

float gravity;

void setup () {
  size (500, 500);
  smooth ();
  colorMode(RGB, 256);
  gravity = 0.2;
  
  
}

void draw() {

  for (int i=20;i<numCircles;i++) {
    background(mouseX, mouseY,mouseY, 90);
  }

  for (int i=0;i<numCircles;i++) {
    noStroke();
    fill(0, mouseY, mouseX);
    ellipse(circleX[i], circleY[i], 20, 20);
    circleX[i]+=velocityX[i];
    circleY[i]+=velocityY[i];
    velocityY[i]+=gravity;

    if (circleX[i]<0 || circleX[i]>width) {
      velocityX[i]*=-1;
    }

    if (circleY[i]<0 ||circleY[i]>height) {
      velocityY[i]*=-1;
    }
  }
  
    for (int i=0;i<numCircles;i++) {
    noStroke();
    fill(550-mouseY, 550-mouseX,0);
    rect(circleX[i], circleY[i], random(0,10), random(200, 0));
    circleX[i]+=velocityX[i];
    circleY[i]+=velocityY[i];
    velocityY[i]+=gravity;

    if (circleX[i]<0 || circleX[i]>width) {
      velocityX[i]*=-1;
    }

    if (circleY[i]<0 ||circleY[i]>height) {
      velocityY[i]*=-1;
    }

  }
}

void mousePressed() {
  for (int i = 0; i<numCircles;i++) {

    circleX[i] = mouseX;
    circleX[i] = mouseY;

    velocityX[i] = random(-1, 1);
    velocityY[i] =random(0, height);
  }
}
