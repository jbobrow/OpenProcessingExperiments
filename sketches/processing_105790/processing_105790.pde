
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
  colorR = 255;
  colorG = 255;
  colorB = 255;
  background (colorR, colorG, colorB);
  text("Aug.5th.2013",100,100);

  //set up ball related numbers
  fill (255);
  noStroke();
  numBalls= 50;
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
    yPos[i] = random (0, height/3);
    ballSize [i] = random (0, 70);
    ySpeed [i] = random (0,2);
  }
}

// make the ball drop
void draw() {
  for (int i=0; i<numBalls; i++) {
    if (!mousePressed) {
      ellipse (xPos[i], yPos[i], ballSize[i], ballSize[i]);
    }
    else if (mousePressed) {
      fill(colorR-mouseY,colorG-mouseX,colorB-mouseY);
      yPos[i] += ySpeed[i];
      ellipse (xPos[i], yPos[i], ballSize[i], ballSize[i]);
    }
  }
}

//void mousePressed() {
//  fall = true;
//}



