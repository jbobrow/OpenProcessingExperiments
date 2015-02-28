
float []xPos;
float []yPos;
float []xSpeed;
float []ySpeed;
float []ballSize;
float speed;
float gravity;
int numBalls;
int colorR;
int colorG;
int colorB;

boolean fall;

void setup() {
  size (600, 600);

  //set up color
  colorR = int(random(0, 255));
  colorG = int(random(0, 255));
  colorB = int(random(0, 255));
  background (colorR, colorG, colorB);
  text("Aug.5th.2013", 100, 100);

  //set up ball related numbers
  fill (255);
  noStroke();
  numBalls= 100;
  gravity = 0.5;

  // set up array
  xSpeed = new float[numBalls];
  ySpeed = new float[numBalls];
  xPos = new float[numBalls];
  yPos = new float[numBalls];
  ballSize = new float[numBalls];

  // declare the xPos, yPos and ballSize
  for (int i=0; i<numBalls; i++) {
    xPos[i] = i * (width/numBalls) + 10;
    yPos[i] = random (0, width/2);
    ballSize [i] = random (0, 30);
    ySpeed [i] = random (0, 3);
  }
}

// make the ball drop
void draw() {
  background (colorR, colorG, colorB);

  for (int i=0; i<numBalls; i++) {
    if (fall == true) {
      yPos[i] = yPos[i]+ySpeed[i] + gravity;
    }
    if (yPos[i] > height) {
      ySpeed[i]*=-0.5;
    }
    ellipse (xPos[i], yPos[i], ballSize[i], ballSize[i]);
  }
}

void mousePressed() {
  fall = true;
}



