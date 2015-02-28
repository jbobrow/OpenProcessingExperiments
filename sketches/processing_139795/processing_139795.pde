
//This program is a simple simulation of gravity, where there are
//Obstacles and MoveObjects that interact with each other.
//Gravity aspect influenced by
//http://www.learningprocessing.com/examples/chapter-5/example-5-9/
//by Daniel Shiffman
//Otherwise, this is an original work by Karen Lo.

MoverObject totoro; //the big circle
MoverObject chihiro; // the small circle
Obstacle block; // the rectangle

void setup() {
  size (400, 400);
  smooth();
  background(255);
  totoro = new MoverObject(300, 200, 90, 90);
  chihiro = new MoverObject(100, 200, 30, 30);
  block = new Obstacle(200, 300, 100, 20);
}

void draw() {

  background(255);

  block.display();
  //  chihiro.moveX();
  //  chihiro.moveY();
  chihiro.fallUnlessObstacles(block);
  chihiro.isOver();
  chihiro.display();

  //  totoro.moveX();
  //  totoro.moveY();
  totoro.fallUnlessObstacles(block);
  totoro.isOver();
  totoro.display();
}

//This function checks to see that if a key is pressed,
//then it would allow the block to run the spin() method.

void keyPressed() {
  block.spin();
}

// Declaring the Obstacle class.

class Obstacle {
  float x;
  float y;
  float w;
  float h;
  float angle = 0;

  Obstacle(int xCoordinate, int yCoordinate, int horizontalLength, 
  int verticalLength) {
    x = xCoordinate;
    y = yCoordinate;
    h = verticalLength;
    w = horizontalLength;
  }

  //The display() method basically fills creates a rectangle and
  //fills in the shape. It would also reset the fill so that
  //other shapes are not filled. Also, there is a pushMatrix()
  //and popMatrix() for rotation. The rotation function is also
  //executed here. The translation function is so that the rotation
  //only effects the Obstacle and not the entire canvas.

  void display() {
    fill(0);
    rectMode(CENTER);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(0, 0, w, h);
    popMatrix();
    noFill();
  }

//The spin() method merely gives a value to the variable angle
//whereas before, it only equalled to zero. The actual "spinning"
//is done in the display() method. The value is determined by
//pressing UP, DOWN, LEFT, or RIGHT.

  void spin() {
    if (key == CODED) {
      if (keyCode == DOWN || keyCode == LEFT) {
        angle = angle - degrees(0.005);
        println(angle);
      } 
      else if (keyCode == UP || keyCode == RIGHT) {
        angle = angle + degrees(0.005);
        println(angle);
      }
    }
  }
  
}

//Declaring the MoverObject class.

class MoverObject {
  float x; //x coordinate
  float y; // y coordinate
  int w; //width of ellipse
  int h; //height of ellipse
  int[] possibleDirections = {
    -1, 1
  }; //variable to change direction
  float ySpeed = 0; //speed in y direction
  float xSpeed = 0; // speed in x direction
  float area; // area of the MoverObject
  float distance;

  MoverObject(int xCoordinate, int yCoordinate, 
  int horizontalDiameter, int verticalDiameter) {
    x = xCoordinate;
    y = yCoordinate;
    w = horizontalDiameter;
    h = verticalDiameter;
    area = sq((horizontalDiameter/2))*PI;
  }

  void moveX() { //currently has no use.
    //    int index = int(random(possibleDirections.length));
    //    int movement = pixelsPerFrame*possibleDirections[index];
    //    x += movement;
    //    if (x > (width-w) || x < w) {
    //      x -= movement;
    //    }
  }

  void moveY() { //currently has no use.
    //    int index = int(random(possibleDirections.length));
    //    int movement = pixelsPerFrame*possibleDirections[index];
    //    y += movement;
    //    if (y > (height-h) || y < h) {
    //      y -= movement;
    //    } 
  }
  
//The function checks to see if the Obstacle is touching the
//MoverObject. If it is true, it will check to see if the Obstacle
//angle is positive or negative, which will determine how the
//MoverObject falls off. Elsewise, it will fall to the ground
//and bounce a bit.

void fallUnlessObstacles(Obstacle obstacle)
{
  float gravity = 0.000098*area;
  float testYSpeed = ySpeed + gravity;
  float testXSpeed = xSpeed;
  float hypotenuse = sqrt(sq(obstacle.h/2) + sq(obstacle.w/2));
  float yDirection = (sin(obstacle.angle)) * hypotenuse;
  float xDirection = (cos(obstacle.angle)) * hypotenuse;
  y = y + testYSpeed;

  //before applying changes to y position and speed, check if the object has hit the ground
  //or the obstacle that was passed into the function.

  if (touchingObstacle(obstacle)) //has hit obstacle
  {
    if (obstacle.angle == 0) {
      y = obstacle.y - obstacle.h/2 - h/2;
      ySpeed = 0;
    } 
    else if (obstacle.angle > 0) {
      testYSpeed = yDirection;
      y = y + testYSpeed;

      testXSpeed = xDirection;
      x = x + testXSpeed;
    } 
    else if (obstacle.angle < 0) {
      testYSpeed = ySpeed + yDirection;
      y = y + testYSpeed;

      testXSpeed = xDirection;
      x = x - testXSpeed;
    }
  }
  else if (y > (height-(h/2))) //has hit ground
  { 
    ySpeed = ySpeed * -0.7;
    if (abs(ySpeed) < 1) {
      y = height - (h/2);
      ySpeed = 0;
    }
  }
  else // falling
  {
    ySpeed = testYSpeed;
  }
}

void display() { //draws the ellipse.
  ellipse(x, y, w, h);
}

void isOver() { //checks to see if mouse is over object.
  distance = dist(mouseX, mouseY, x, y);
  if (distance < w/2 && mousePressed) {
    x = mouseX;
    y = mouseY;
  }
}

//The following boolean checks to see if the MoverObject is
//touching an Obstacle. Again, it checks to see if it is within
//the width of the Obstacle and above it. Then they would be
//called at the draw() function.

boolean touchingObstacle(Obstacle obstacle) {
  boolean yTouching = false;
  boolean xTouching = false;

  if (y < obstacle.y) {
    if ( y+(h/2) >= obstacle.y - (obstacle.h/2)) {
      yTouching = true;
    } 
    else {
      yTouching = false;
    }
  }
  if (x > obstacle.x - (obstacle.w/2) && 
    x < obstacle.x + (obstacle.w/2)) {
    xTouching = true;
  } 
  else {
    xTouching = false;
  }
  if (xTouching == true && yTouching == true) {
    println("over");
    return true;
  } 
  else {
    return false;
  }
}
}
