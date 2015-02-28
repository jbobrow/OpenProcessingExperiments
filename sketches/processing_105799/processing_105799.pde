
float []xPos1;
float []yPos1;
float []xPos2;
float []yPos2;
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
  size (1000, 600);

  //set up color
  colorR = 255;
  colorG = 255;
  colorB = 255;
  background (colorR, colorG, colorB);
  text("Aug.5th.2013", 100, 100);

  //set up ball related numbers
  fill (255);
  noStroke();
  numBalls= 30;
  gravity = 0.5;

  // set up array
  xSpeed = new float[numBalls];
  ySpeed = new float[numBalls];
  xPos1 = new float[numBalls];
  yPos1 = new float[numBalls];
  xPos2 = new float[numBalls];
  yPos2 = new float[numBalls];
  ballSize = new float[numBalls];

  // declare the xPos, yPos and ballSize
  for (int i=0; i<numBalls; i++) {
    xPos1[i] = i - i;
    yPos1[i] = i - i;
    xPos2[i] = i*10 + random(0,1000);
    yPos2[i] = i*10 + random(0,400);
    ySpeed [i] = random (0.1, 0.5);
  }
}

// make the ball drop
void draw() {
  for (int i=0; i<numBalls; i++) {
    if (mousePressed) {
      strokeWeight(1);
      stroke(colorR-mouseY, colorG-mouseX, colorB-mouseY);
      yPos2[i] -= ySpeed[i];
      line (xPos1[i], yPos1[i], xPos2[i], yPos2[i]);
    }
  }
}

//void mousePressed() {
//  fall = true;
//}



