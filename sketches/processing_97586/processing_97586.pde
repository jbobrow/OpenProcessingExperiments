
int totalBoles = 50;
float[] pX = new float[totalBoles];
float[] pY = new float[totalBoles];
float[] vX = new float[totalBoles];
float[] vY = new float[totalBoles];

void setup() {
size(600, 600);
stroke(108,255,244);
colorMode(RGB,400);
fill(random(0),random(255),random(123));


for (int i=0; i < totalBoles; i++) {
    pX[i] = random(width,600);
    pY[i] = random(height,600);
    vX[i] = random(-20, 20);
    vY[i] = random(-20, 20);
  }

}

void draw() {
background(0);
for (int i=0; i<600; i = i +5) {
  stroke(i,255,i);
line(600,600, width, i);
line(600,600, 0,i);
line(600,600, i, width);
line(600,600, i,0);
}
for (int i=0; i < totalBoles; i++) {

    pX[i] = pX[i] + vX[i];
    pY[i] = pY[i] + vY[i];

    
    if (pX[i] < 0 || pX[i] > width) {
      vX[i] = -vX[i];
    }
    if (pY[i] < 0 || pY[i] > height) {
      vY[i] = -vY[i];
    }
    
    ellipse(pX[i], pY[i], 40, 20);
  }
}




