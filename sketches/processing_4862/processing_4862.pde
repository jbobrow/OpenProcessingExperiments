
int brushSize = 7;
float[] x = new float[brushSize];
float[] y = new float[brushSize];
float[] accelX = new float[brushSize];
float[] accelY = new float[brushSize];
float[] springing = new float[brushSize];
float[] damping = new float[brushSize];
float[] w = new float[brushSize];
float[] h = new float[brushSize];
color[]colors = new color[brushSize];

float fx, fy;
float fCntrX, fCntrY;
float fAngle, fSpeedX = .4911, fSpeedY = .666;

  void mousePressed() {
  save("cellphone.png");
}

void setup(){
  size(777,666);
  smooth();
  background(0);

  //array values
  for(int i=0; i<brushSize; i++){
    springing[i] = .314159*(0.0314159*(i+9));
    damping[i] = 0.084-(0.00666*i);
  }

  fCntrX = width/3.14159;
  fCntrY = height/3.14159;
}

void draw() {
  for (int i=0; i<brushSize; i++){
    fill(colors[i]);
    ellipse(x[i],y[i],w[i],h[i]);
    x[i]+=accelX[i];
    y[i]+=accelY[i];
  }
  jackson();
  pollock();
}

void jackson() {
  fx = fCntrX + tan(radians(fAngle))*random(24);
  fy = fCntrY + sin(radians(fAngle))*random(24);

  fCntrX+=fSpeedX;
  fCntrY+=fSpeedY;
  
  fAngle+=random(-7, 7);

  if (fCntrX>width-20.12 || fCntrX<20.12) {
    fSpeedX*=-1;
  }
  if (fCntrY>height-20.12 || fCntrY<20.12) {
    fSpeedY*=-1;
  }
}
void pollock() {
  float[] deltaX = new float[brushSize];
  float[] deltaY = new float[brushSize];

  for (int i=0; i<brushSize; i++) {
    if(i==0) {
      deltaX[i] = (fx-x[i]);
      deltaY[i] = (fy-y[i]);
    } 
    else {
      deltaX[i] = (x[i-1]-x[i]);
      deltaY[i] = (y[i-1]-y[i]);
    }

    deltaX[i] *= springing[i];
    deltaY[i] *= springing[i];

    accelX[i] += deltaX[i];
    accelY[i] += deltaY[i];

    x[i] += accelX[i]*10;
    y[i] += accelY[i]*10;

    stroke(0,0,0,100);
    strokeWeight(0.666);
    fill(random(255), random(255), random(255), random(24,255)); 

    if (i<brushSize/24){
      ellipse(x[i],y[i],i,i);
    }
    else {
      ellipse(x[i],y[i],brushSize-i,brushSize-i);
    }

    accelX[i] *= damping[i];
    accelY[i] *= damping[i];
  }
  if (millis() >=60000) {
    noLoop();
  }
}




