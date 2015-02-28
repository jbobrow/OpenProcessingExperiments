


int ballCount = 0; 
int maxBalls = 100;
float[] xPos = new float[maxBalls];
float[] yPos = new float[maxBalls];
float[] xSpeed = new float[maxBalls];
float[] ySpeed = new float[maxBalls];
float[] d = new float[maxBalls];
//float[] density = new float[maxBalls];

//booleans to determine what step the program is on
boolean setLocation = true;
boolean setSize = false;
boolean setSpeed = false;
boolean go = false;

PImage bg;

float sizeTimer;
float speedTimer;

boolean mouseRel = false;

void setup() {
  sizeTimer = millis();
  size(600, 600);
  smooth();
  ellipseMode(CENTER);
  imageMode(CENTER);
  frameRate(40);
  background(255);
  noFill();
  bg = loadImage("bg1.png"); //step 1 instructions

  for (int i = 0; i < maxBalls; i++) {
    xPos[i]=0;
    yPos[i]=0;
    d[i]=0;
  }
}

void mouseReleased() {
  mouseRel = true;
}

void keyPressed() {
  go = true;
}

void draw() {
  image(bg, 300, 300);
  setLocation();
  setSize();
  setSpeed();
  if (go == false) {
    for (int i = 0; i < maxBalls; i++) {
      ellipse(xPos[i], yPos[i], d[i], d[i]);
      line(xPos[i], yPos[i], xPos[i]+xSpeed[i]*20, yPos[i]+ySpeed[i]*20);
    }
  }
  setInMotion();
  //make balls move
  //make balls collide with walls
}

//sets location of current circle (with reference to ballCount)
void setLocation () {
  if (mousePressed && setLocation == true) {
    sizeTimer = millis();
    xPos[ballCount] = mouseX;
    yPos[ballCount] = mouseY;
    setLocation = false;
    setSize = true;
  }
}

//sets size of current circle ('')
void setSize () {
  if (mousePressed && setSize == true) {
    ellipse (xPos[ballCount], yPos[ballCount], 0.1*(millis()-sizeTimer), 0.1*(millis()-sizeTimer)); 
    d[ballCount] = (0.1*(millis()-sizeTimer)); //store radius of ball[ballCount]

  }

  if (mouseRel == true && setSize == true) {
    setSize = false;
    setSpeed = true;
    mouseRel = false;
    bg = loadImage("bg2.png"); //step 2 instructions
  }
}

//sets speed of current circle ('')
void setSpeed () {
  if (mousePressed && setSpeed == true) {
    line(xPos[ballCount], yPos[ballCount], mouseX, mouseY);
    xSpeed[ballCount] = (mouseX - xPos[ballCount])/20;
    ySpeed[ballCount] = (mouseY - yPos[ballCount])/20;
  }
  if (mouseRel == true && setSpeed == true) {      
    ballCount++;
    setSpeed = false;
    setLocation = true;
    println("the new ball count is: " + ballCount);
    mouseRel=false;
    bg = loadImage("bg1.png"); //back to step 1 instructions
  }
}

//once the user doesn't want to make any more circles this is how they set the circles in motion
void setInMotion() {
  //once g is pressed:
  if (setLocation == true && go == true) {
    bg = loadImage("bg3.png"); // step 3 (once motion has started)
    fill(0, 50, 255, 60);
    for (int i = 0; i < maxBalls; i++) {
      ellipse(xPos[i], yPos[i], d[i], d[i]);      
      xPos[i] += xSpeed[i];
      yPos[i] += ySpeed[i];
    }
  }
}


