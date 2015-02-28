
int[] rectPosX;
int[] rectPosY;

void setup() {
  size(600,600);
  background(255);
  noStroke();
  
  rectPosX = new int[100];
  rectPosY = new int[100];
  
  for (int i = 0; i<rectPosX.length; i++ ) {
    rectPosX[i] = (int)random(0,500);
    rectPosY[i] = (int)random(0,500);
  }

  frameRate(5);
  
}

void draw() {
  fill((int)random(0,255), (int)random(0,255), (int)random(0,255), 30);
  for (int i = 0; i<rectPosX.length; i++ ) {
    rect(rectPosX[i], rectPosY[i], random(10, 100), random(70, 100));
  }

}
