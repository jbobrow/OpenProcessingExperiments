
int modi = 1;
int ballCount = 15;
float [] x = new float [ballCount];
float [] y = new float [ballCount];
float [] speedX = new float [ballCount];
float [] speedY = new float [ballCount];


void setup () {
  size(1400, 700);
  frameRate(100);
  background(0);
  smooth();

  for (int i = 0; i<ballCount; i++) {
    x[i] = random(1, 900);
    y[i] = random(1, 900);
    speedX[i] = random(1, 2);
    speedY[i] = random(1, 2);
  }
}
void draw() {
  //background(0);

  if (keyPressed) {
    if (modi==1) {

      for (int i = 0; i<ballCount; i++) {
        stroke(255, 110);
        //randomSeed(i);
        //ellipse(x[i],y[i],10,10);

        stroke(255, 2);
        for (int j = 0; j<ballCount; j++) {
          line(x[i], y[i], x[j], y[j]);
        }

        x[i] = x[i]+speedX[i];
        y[i] = y[i]+speedY[i];

        if (x[i]>width)speedX[i] = speedX[i]*-1; // speed = speed definiert speed hier noch mal in der funktion
        if (x[i]<0)speedX[i] = speedX[i]*-1; 
        if (y[i]>height)speedY[i] = speedY[i]*-1;
        if (y[i]<0)speedY[i] = speedY[i]*-1;
      }

      if (modi==2) {

        for (int i = 0; i<ballCount; i++) {

          stroke(255, 50, 90);
          for (int j = 0; j<ballCount; j++) {
            line(x[i], y[i], x[j], y[j]);
          }

          x[i] = x[i]+speedX[i];
          y[i] = y[i]+speedY[i];

          if (x[i]>width)speedX[i] = speedX[i]*-1; // speed = speed definiert speed hier noch mal in der funktion
          if (x[i]<0)speedX[i] = speedX[i]*-1; 
          if (y[i]>height)speedY[i] = speedY[i]*-1;
          if (y[i]<0)speedY[i] = speedY[i]*-1;
        }
      }
    }
  }
}
void keyPressed() {

  if (key=='1') {
    modi = 1;
  }

  if (key=='2') {
    modi = 2;
  }
}





