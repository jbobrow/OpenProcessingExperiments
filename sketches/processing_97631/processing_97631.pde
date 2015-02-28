

int totalElements = 100;

float[] pX = new float[totalElements];
float[] pY = new float[totalElements];
float[] vX = new float[totalElements];
float[] vY = new float[totalElements];

void setup() {
  noSmooth();
   size(600,600);
   stroke(255,0,0);
   
  for (int i=0; i < totalElements; i++) {
    pX[i] = random(width);
    pY[i] = random(height);
    vX[i] = random(2, 2);
    vY[i] = random(2, 2);
  }
 
}

void draw() {
  
  background(250,165,8);
  for (int i = 0; i <= height; i = i +5) { 
    line(mouseX,mouseY,width,i);
    line(mouseX,mouseY,0,i);
    line(mouseX,mouseY,i,0);
    line(mouseX,mouseY,i,height);

  }

  for (int i=0; i < totalElements; i++) {
    pX[i] += vX[i];
    pY[i] += vY[i];

    if (pX[i] < 0 || pX[i] > width) {
      vX[i] = -vX[i];
    }
    if (pY[i] < 0 || pY[i] > height) {
      vY[i] = -vY[i];
    }

    rect(pX[i], pY[i], 20, 20);
    stroke(32,16,180);
    fill(32,16,180);
    
  }
  }


