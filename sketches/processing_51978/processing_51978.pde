
/* Where upper left of robot appears on screen */
final int ROBOT_X = 50;
final int ROBOT_Y = 50;

/* The robot's midpoint and arm pivot points */
final int MIDPOINT_X = 39;
final int LEFT_PIVOT_X = 12;
final int RIGHT_PIVOT_X = 66;
final int PIVOT_Y = 32;
final int LL_PIVOT_X = 22;
final int RL_PIVOT_X = 40;
final int PIVOT_Z = 84;

float leftArmAngle = 0.0;
float rightArmAngle = 0.0;
float leftLegAngle = 0.0;
float rightLegAngle = 0.0;
Cell[][] grid;
PFont f;
String message = "It's Friday!!!";
float theta;
// Number of columns and rows in the grid
int cols = 10;
int rows = 10;
void setup()
{
  size(200, 200);
  f = createFont("Arial",20,true);
  smooth();
  frameRate(30);

  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw()
{

  background(255);
   for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }


  pushMatrix();
  textFont(f);                  // Set the font
  translate(width/2,25);  // Translate to the center
  rotate(theta);                // Rotate by theta
  textAlign(CENTER);            
  text(message,0,0);            
  theta += 0.05;                // Increase rotation
  popMatrix();
  
  float mX;
  float mY;
  pushMatrix();
  translate(ROBOT_X, ROBOT_Y); // place robot so arms are always on screen
  if (mousePressed)
  {
    mX = mouseX - ROBOT_X;
    mY = mouseY - ROBOT_Y;
    if (mX < MIDPOINT_X) // left side of robot
    {
      leftArmAngle = atan2(mY - PIVOT_Y, mX - LEFT_PIVOT_X) - HALF_PI;
      leftLegAngle = atan2(mY - PIVOT_Z, mX- LL_PIVOT_X) - HALF_PI;
    }
    else
    {
      rightArmAngle = atan2(mY - PIVOT_Y, mX - RIGHT_PIVOT_X) - HALF_PI;
      rightLegAngle = atan2(mY - PIVOT_Z, mX - RL_PIVOT_X) - HALF_PI;
   }
  }
  //translate(50, 50); // place robot so arms are always on screen
  drawRobot();
  popMatrix();
}

void drawRobot()
{
  noStroke();
  fill(38, 38, 200);
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body
  drawLeftArm();
  drawRightArm();
  drawLeftLeg();
  drawRightLeg();
  fill(222, 222, 249);
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12);  // right eye
}

void drawLeftArm()
{
  pushMatrix();
  translate(12, 32);
  rotate(leftArmAngle);
  rect(-12, 0, 12, 37); // left arm
  popMatrix();
}

void drawRightArm()
{
  pushMatrix();
  translate(66, 32);
  rotate(rightArmAngle);
  rect(0, 0, 12, 37); // right arm
  popMatrix();
}

void drawLeftLeg()
{
  pushMatrix();  
  translate(22,84);
  rotate(leftLegAngle);
  rect(0, 0, 16, 50); // left leg
  popMatrix();
}

void drawRightLeg()
{
  pushMatrix();  
  translate(40,84);
  rotate(rightLegAngle);
  rect(0, 0, 16, 50); // right leg
  popMatrix();
}
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.1; 
  }

  void display() {
    stroke(127,0,0);
    // Color calculated using sine wave
    fill(127+127*sin(angle),0,0);
    rect(x,y,w,h); 
  }
}



