
//R, r = racer
int nR = 10;
float rW = 40;
float[] rX = new float[nR];
float[] rY = new float[nR];
float[] xV = new float[nR];
PImage[] rI = new PImage[nR];
 
void setup() {
  size(400, 600);
  smooth();
  noStroke();
  frameRate(20);
  for (int i=0; i<nR; i++) {
    rX[i] = 10;
    rY[i] = 54*(i+1);
    xV[i] = random(0.2, 3);
  }
}
 
void draw() {
  background(245, 240, 210);
  PImage bIMG = loadImage("beach2.jpg");
  imageMode(CENTER);
  image(bIMG, width/2, height/2);
 
  for (int i=0; i<nR; i++) {
    rI[0] = loadImage("1.gif");
    rI[1] = loadImage("2.gif");
    rI[2] = loadImage("3.gif");
    rI[3] = loadImage("4.gif");
    rI[4] = loadImage("5.gif");
    rI[5] = loadImage("6.gif");
    rI[6] = loadImage("7.gif");
    rI[7] = loadImage("8.gif");
    rI[8] = loadImage("9.gif");
    rI[9] = loadImage("10.gif");
    image(rI[i], rX[i], rY[i]);
    update();
  }
}
 
void update() {
  for (int i=0; i<nR; i++) {
    rX[i] = rX[i]+xV[i];
 
    if (rX[i] >= width-rW/2 || rX[i] <= 0) {
      xV[i] = xV[i]*(-1);
    }
  }
}


