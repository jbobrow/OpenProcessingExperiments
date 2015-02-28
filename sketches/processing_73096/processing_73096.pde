
float x = 0;
float y = 0;
float translateX = 100;
float translateY = 100;
float petalAngle = 0.0;
float flowerAngle = 0.0;
float[] offsets = new float[64];

void setup() {
  size(800, 800);
  for(int i = 0; i <64; i++){
  offsets[i] = random(360.0); 
  }
}

void draw() {
  background(255, 50);
  flowerAngle += .001;
  for (int translateY = 100; translateY<800; translateY+=100) {
    for (int translateX = 100; translateX<800; translateX+=100) {
      translate(translateX, translateY);
      for (int i = 1; i<8; i++) {
        rotate(petalAngle+ flowerAngle+ offsets[(8*translateY/100)+(translateX/100)]);
        petalAngle += .001;
        float var1 = random(10, 20);
        float var2 = random(30, 80);
        float var3 = random (30, 40);
        drawPetal(var1, var2, var3);
      }
      resetMatrix();
    }
    resetMatrix();
  }

  delay(100);
}

void drawPetal(float var1, float var2, float var3) {
  float r = random(100, 255);
  float g = random(10, 50);
  float b = random(150, 255);

  fill(r, g, b, 50);
  noStroke();
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x+var1, y+var1);
  curveVertex(x, y+var2);
  curveVertex(x-var3, y+var1);
  curveVertex(x, y);
  curveVertex(x, y);
  endShape();
}
