
int bolas = 12000;

float[] posX = new float[bolas];
float[] posY = new float[bolas];
float[] velX = new float[bolas];
float[] velY = new float[bolas];
int sz = 3;

void setup() {
  size(500, 500);
  noStroke();
  noSmooth();
  colorMode(HSB);
  fill(random(100), 100, 200, 150);


  for (int i=0; i<posX.length; i++) {
    posX[i] = random(0, 500);
    posY[i] = random(0, 500);
    velX[i] = random(2, 10);
    velY[i] = random(2, 10);
  }
}

void draw() {

  background(0, 30);


  for (int i=0; i<posX.length; i++) {

    posX[i] += velX[i];
    posY[i] += velY[i];

    ellipse(posX[i], posY[i], sz, sz);

    if ((posX[i]<=0)||(posX[i]>=width)) {
      velX[i] = -velX[i];
    } 

    if (( posY[i]<=0)||( posY[i]>=height)) {
      velY[i] = -velY[i];

      if (mousePressed == true) {
        velX[i] = random(2, 10);
        velY[i] = random(10, 2);
      }

      if ((posX[i]<mouseX)&&(posY[i]<mouseY)) {
        posX[i] = mouseX;
        posY[i] = mouseY;
      }
    }
  }
}
