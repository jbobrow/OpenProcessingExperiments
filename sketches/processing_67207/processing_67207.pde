
PImage bg;
boolean mouseClick = false;

int birdNum = 20;

float[] birdX = new float [birdNum];
float[] birdY = new float [birdNum];
float[] birdXSpeed = new float [birdNum];
float[] birdYSpeed = new float [birdNum];

PImage[] bird = new PImage[birdNum];


void setup() {
  size(500, 500);
  bg = loadImage("tree.png");

  for (int i =0; i< birdNum; i++)
  {
    birdX[i] = 100;
    birdY[i] = 100;
    birdXSpeed[i] = i+20;
    birdYSpeed[i] = i-20;
  }
  for (int i = 1; i < birdNum+1; i++)
  {

    bird[i-1] = loadImage("bird"+ i + ".png");
  }
}

void draw() {
  background(255);
  image(bg, 100, 100);
  if (mouseClick == true) {
    for (int i = 0; i < birdNum; i++) {
      image(bird[i % 2], birdX[i], birdY[i]);
      birdX[i] += birdXSpeed[i];
      birdY[i] += birdYSpeed[i];
    }
  }
}
void mouseReleased() {
  mouseClick = true;
  for (int i = 0; i < birdNum; i++) {

    birdX[i] = mouseX;
    birdY[i] = mouseY;

    birdXSpeed[i] = random(-6, 6);
    birdYSpeed[i] = random(-10, -3);
  }
} 


