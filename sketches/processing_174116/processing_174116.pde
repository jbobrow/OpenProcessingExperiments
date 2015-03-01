
int numCirc = 10;
float[] rad, xCenter, yCenter, xVel, yVel, xAccel, yAccel;
float friction;

void setup(){
  size(600 , 600);
  smooth();
  friction = 0.02;
  rad = new float[numCirc];
  xCenter = new float[numCirc];
  yCenter = new float[numCirc];
  xVel = new float[numCirc];
  yVel = new float[numCirc];
  xAccel = new float[numCirc];
  yAccel = new float[numCirc];
  for(int i = 0; i< numCirc; i++){
    rad[i] = random(10, 40);
    xCenter[i] = random(rad[i], width - rad[i]);
    yCenter[i] = random(rad[i], height - rad[i]);
    xVel[i] = 0;
    yVel[i] = 0;
    xAccel[i] = 0;
    yAccel[i] = 0;
  }
}

void draw(){
  background(150, 200, 200);
  
  for(int i = 0; i < numCirc; i++){
    displayCirc(i);
    updateCirc(i);
  }
}

void mousePressed(){
  kick();
}

void displayCirc(int i){
  fill(255, 0, 0, 100);
  stroke(255, 0, 0, 200);
  strokeWeight(3);
  ellipse(xCenter[i], yCenter[i], 2 * rad[i], 2 * rad[i]);
}

void updateCirc(int i){
  xCenter[i] += xVel[i];
  yCenter[i] += yVel[i];
  xVel[i] = (1 - friction) * xVel[i] + xAccel[i];
  yVel[i] = (1 - friction) * yVel[i] + yAccel[i];
  xAccel[i] = (mouseX - xCenter[i])/width;
  yAccel[i] = (mouseY - yCenter[i])/height;
}

void kick(){
  for (int i = 0; i < numCirc; i++){
    xVel[i] = random(-50, 50);
    yVel[i]  = random(-50, 50);
  }
}




