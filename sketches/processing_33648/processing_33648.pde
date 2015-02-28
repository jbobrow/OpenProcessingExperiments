
int numberBalls = 5;
int xPos[] = new int[numberBalls];
int yPos[] = new int[numberBalls];

int mouseClickCounter;

float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];
//and our new friend % modulo

void setup() {
  size (500, 500);
  background(255, 255, 255);
  mouseClickCounter = 0;

  for (int i = 0; i < numberBalls; i++) {
    xPos[i] = mouseX;
    yPos[i] = mouseY;
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
}

void draw() {
  //  fill(255, 0, 0);
  background(255,255,255);
  smooth();
  
  for (int i = 0; i < numberBalls; i++) {
    noStroke();
    fill(r[i], g[i], b[i], 80);
    ellipse (xPos[i], yPos[i], 50, 50);
  }
}

void mouseClicked() {

  xPos[mouseClickCounter % numberBalls] = mouseX;
  yPos[mouseClickCounter % numberBalls] = mouseY;

  mouseClickCounter = mouseClickCounter + 1;
}


