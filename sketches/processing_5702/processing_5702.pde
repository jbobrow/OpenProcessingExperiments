
int x;
int y;
int snakemode;
float rainbowframestep; 
float smokeframestep;

void setup() {
  size (200,200);
  background (0);
  frameRate(1500); //Is this too much? >_>
  x = width/2;
  y = height/2;
}

void draw() {
  snakeMode();
  boundaryChecks();
  snakeMovement();
}

void mouseReleased() {
  snakemode +=1;
}

void snakeMovement() {
  point(x,y);
  x = x + int(floor(random(-1,1.9999999)));
  y = y + int(floor(random(-1,1.9999999)));
}

void snakeMode() {
  rainbowframestep += 0.1;
  smokeframestep += 0.5;
  if (rainbowframestep > 255) {
    rainbowframestep = 0;
  }
  if (smokeframestep > 240 || smokeframestep < 70) {
    smokeframestep = 70;
  }
  if (keyPressed) {
    background (0);
  }
  if (snakemode > 1) {
    snakemode = 0;
  }
  if (snakemode == 0) {
    colorMode(RGB);
    stroke(smokeframestep); //greyscaliness based on time elapsed
  }
  if (snakemode == 1) {
    colorMode(HSB);
    stroke(rainbowframestep,255,255);
  }
}

void boundaryChecks() {
  if (x < 0) {
    x = 0;
  }
  if (x > width) {
    x = width;
  }
  if (y < 0) {
    y = 0;
  }
  if (y > height) {
    y = height;
  }
}

