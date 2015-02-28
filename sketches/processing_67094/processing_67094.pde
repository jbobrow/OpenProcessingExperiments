
int num = 5; // number of balls
float gravity = .5;
float friction = .5;
float[] xCor = new float[num]; // X Cordinate for all the balls
float[] yCor = new float[num];
float[] xSpeed = new float[num];
float[] ySpeed = new float[num];
float[] ballColor = new float[num];
float[] ballSize = new float[num];


void setup() {
  size(900, 900);
  smooth();
  noStroke();  
  fill(0);
  colorMode(HSB, 100, 100, 100);

  for (int i = 0; i < num; i++) {
    xCor[i] = random(5, width-5);
    yCor[i] = random(5, width-5);
    xSpeed[i] = random(-5, 5);
    ySpeed[i] = random(-5, 5);
    ballColor[i] = random(1, 100);
    ballSize[i] = random(30, 100);
  }
}  

void draw() {
  background(100);
  for ( int j = 0; j < num-1; j++) {    
    for (int k = j+1; k < num; k++) {
      if ( dist(xCor[j], yCor[j], xCor[k], yCor[k]) <= (ballSize[j]/2 + ballSize[k]/2) ) {
        if (xSpeed[j] < 0 && xSpeed[k] > 0 || xSpeed[j] > 0 && xSpeed[k] < 0) {
          xSpeed[j] *= -1;
          xSpeed[k] *= -1;
        }
        if (ySpeed[j] < 0 && ySpeed[k] > 0 || ySpeed[j] > 0 && ySpeed[k] < 0) {
          ySpeed[j] *= -1;
          ySpeed[k] *= -1;
        }
      }
    }
  }
  for (int i = 0; i < num; i++) {
    if (xCor[i] >= width || xCor[i] <= 0) {
      xSpeed[i] *= -1;
    }
    if (yCor[i] >= height || yCor[i] <= 0) {
      ySpeed[i] *= -1;
    }
    ySpeed[i] = ySpeed[i] + gravity;
    
    if(yCor[i] > height){
      yCor[i] = height;
    }
    
    xCor[i] += xSpeed[i];
    yCor[i] += ySpeed[i]*friction;
    fill(ballColor[i], 100, 100);
    ellipse(xCor[i], yCor[i], ballSize[i], ballSize[i]);
  }
}


