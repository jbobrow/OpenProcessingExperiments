
//Amanda Bernhardt
//200
//3/12/13
int numLine = 200;
float[] lX = new float[numLine];
float[] lY = new float[numLine];
float[] lX2 = new float[numLine];
float[] lY2 = new float[numLine];
float[] lSpeed = new float[numLine];
float gravity = .5;
 
int currentClick = 0;
void setup() {
  size(350, 550);
}
 
void draw () {
  background (0);
  for (int i = 0; i < numLine; i++) {
    stroke(51,203, map(lY[i], 0, height, 20, 200) ,22);
    line ( 0,0, lX[i], lY[i]);
    line ( 72, 33, lX[i], lY[i]);
    line ( 22, 166, lX[i], lY[i]);
    lY[i] += lSpeed[i];
    lSpeed[i] += gravity;
  }
  
  for (int i = 0; i < numLine; i++) {
    stroke(0,40, map(lY[i], 0, height, 20, 200) ,78);
    line ( 350,550, lX2[i], lY2[i]);
    line ( 250, 250, lX2[i], lY2[i]);
    line ( 150, 300, lX2[i], lY2[i]);
    lY2[i] -= lSpeed[i];
    lSpeed[i] += gravity;
  }
}

 
void mouseDragged() {
  lX[currentClick] = mouseX;
  lY[currentClick] = mouseY;
  lX2[currentClick] = mouseX;
  lY2[currentClick] = mouseY;
  lSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= numLine) {
    currentClick =0;
  }
}



