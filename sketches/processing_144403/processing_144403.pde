
int x, y, i, k;
float speedX, speedY;
float objectX, objectY, objectWidth, objectHeight;
PFont f;

float GRAVITY = 0.6;

float DAMPING = .9;


float FRICTION = .9;

void setup() {
  size(600, 600);
  frameRate(3);
  objectX = width/2;
  objectY = 0;
  x=width/2;
  y=height/2;
  smooth();
  f = createFont("AGaramondPro-Italic", 55);
  textFont(f);
  objectWidth = 20;
  objectHeight = objectWidth;

  speedX = 16;
  speedY = 14;
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();

  if (h<12 || h==12)
  {
    k = h;
  }
  else
  {
    k = h-12;
  }

  fill(255, 60);
  rect(0, 0, width/2+second()*25+10, height/2+second()*25-10);

  drawObject();
  adjustForGravity();
  updateObjectLocation();
  checkForCollision();
  textAlign(CENTER);
  if (m<10)
  {
    textSize(100);
    text(k+":0"+m, x, y+20);
  }
  else {
    textSize(55);
    text(k+":"+m, x, y+20);
  }
  if (h<12 || h==12) {
    textSize(20);
    text("AM", x, y+40);
  }
  else
  {
    textSize(20);
    fill(second()*81, 212, x);
    text("PM", x, y+40);
  }

  textSize(50);
  text(second(), 400, 325);
}


void drawObject() {
  noStroke();
  fill(second(), 221, 255);
  rect(objectX-second(), objectY-second(), objectWidth, 

objectHeight);
}


void updateObjectLocation() {
  objectX = objectX + speedX;
  objectY = objectY + speedY;
}


void adjustForGravity() {
  speedY = speedY + GRAVITY;
}


void checkForCollision() {


  if (objectX > width - objectWidth) {
    objectX = width - objectWidth;
    speedX = -2 * speedX;
  }

  else if (objectX < 0) {
    objectX = 0;
    speedX = -1 * speedX;
  }


  if (objectY > height - objectHeight) {
    objectY = height - objectHeight;
    speedY = -1 * speedY;
    speedY = DAMPING * speedY;
    speedX = FRICTION * speedX;
  }
}
