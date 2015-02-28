
//Sul Kim
// November 16, 2012
// Creative Computing

int circle_x=30;
int circle_y=40;
int circle_radius=30;
int circle_speed =2;
int[] positionXList;
int[] positionYList;
int[] mySize;
float speedX, speedY;
float objectX, objectY, objectWidth, objectHeight;
float GRAVITY = 0.6;
float DAMPING = .9;
float FRICTION = .9;


void setup() {
  size(800,800);
   noStroke();
    
  objectX = width/2;
  objectY = 0;
 
  objectWidth = 20;
  objectHeight = objectWidth;
 
  speedX = 4;
  speedY = 4;



   positionYList = new int[5];
  positionYList[0] = 150;
  positionYList[1] = 300;
  positionYList[2] = 400;
  positionYList[3] = 550;
  positionYList[4] = 700;
 
  positionXList = new int[5];
  positionXList[0] = 400;
  positionXList[1] = 400;
  positionXList[2] = 400;
  positionXList[3] = 400;
  positionXList[4] = 400;
 
  mySize = new int[5];
 
  for (int i = 0; i < 5; i++)
  {
    mySize[i] = 10;
  }
}

void draw() {
  background(50,20,150);
  fill(200,150,120);
  circle_x=circle_x+circle_speed;
  //if it reaches an edge change direction
  //if circle_x reaches width
  if (circle_x>width) {
  //change direction
  circle_speed=-circle_speed;
  // or circle_speed=circle_speed*-1;
  };
  if (circle_x<0) {
    circle_speed=-circle_speed;
  };
  //draw ellipse that you will move
ellipse(circle_x,circle_y, circle_radius*2,circle_radius*2);
for (int i = 0; i < 5; i++) {
    rect(positionXList[i], positionYList[i], mySize[i], mySize[i]);
  fill(255, 60);
  rect(0, 0, width, height);
drawObject();
  adjustForGravity();
  updateObjectLocation();
  checkForCollision();



 

  }
}

void mousePressed() {
  for (int i = 0; i <5; i++) {
    
    if (mouseX > 400 && (mouseX < 400 + mySize[i]) && mouseY > positionYList[i] && (mouseY < positionYList[i]+mySize[i]))
    {
      mySize[i] = mySize[i] + 1;
    }
  }
}
void drawObject() {
  fill(0);
  rect(objectX, objectY, objectWidth, objectHeight);
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
    speedX = -1 * speedX;
  }
else if (objectX < 0) {
    objectX = 0;
    speedX = -1 * speedX;
  }
 
  // Check for floor collision:
  if (objectY > height - objectHeight) {
    objectY = height - objectHeight;
    speedY = -1 * speedY;
    speedY = DAMPING * speedY;
    speedX = FRICTION * speedX;
  }
}
