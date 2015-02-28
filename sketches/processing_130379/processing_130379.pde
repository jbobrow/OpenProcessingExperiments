
Robot myRobot1;
Robot myRobot2;

void setup() {
  size(800, 600);
  background(255);
  //noStroke();
  strokeWeight(1);
  myRobot1 = new Robot(500, 523, 5);
  myRobot2 = new Robot(200, 523, 7);
}

void draw() {
  background(255);
  myRobot1.display();
  myRobot2.display();
}

class Robot {
  int _xPos;
  int _yPos; 
  int _speed;
  float _armR;
  int _armD = 1;


  Robot(int xPos, int yPos, int speed) {
    _xPos = xPos;
    _yPos = yPos;
    _speed = speed;
    _armR = random(-30, 60);
  }

  void display() {

    fill(#999999);
    rectMode(CENTER);

    // Body
    rect(_xPos, _yPos, 70, 100);

    strokeWeight(3);
    stroke(0);

    noStroke();
    rect(_xPos, _yPos - 75, 66, 50);
    stroke(1);
    line(_xPos - 30, _yPos - 101, _xPos - 30, _yPos - 120);


    fill(255, 0, 0);
    //ellipse(_xPos - 30, _yPos - 120, 4, 4);

    stroke(1);
    fill(50, 200, 255);
    ellipse(_xPos + 15, _yPos - 80, 15, 15);
    fill(#999999);
    drawWheels();
    drawArm(_xPos, _yPos, _armR);

    rotateArm();

    moveRobot();
    
  }
  
// Moves robot across screen
  void moveRobot() {
    _xPos += _speed;

    if (_xPos > width + 50) {
      _xPos = -50;
    }
  }
  
  
  void drawWheels() {
    // Back Wheel
    ellipse(_xPos - 25, _yPos + 50, 50, 50);
    //Front Wheel
    ellipse(_xPos + 30, _yPos + 60, 30, 30);

    // Upper Track
    line(_xPos - 20, _yPos + 25, _xPos + 34, _yPos + 45);
    // Lower Track
    line(_xPos - 25, _yPos + 75, _xPos + 30, _yPos + 75);
  }


  // A function to draw the arm of the robot
  void drawArm(int _armX, int _armY, float _armAngle) {

    pushMatrix();
    translate(_armX, _armY);
    rotate(radians(_armAngle));    

    strokeWeight(5);
    stroke(#777777);
    line(0, 0, 50, 0);


    strokeWeight(1);
    ellipse(0, 0, 30, 30);

    ellipse(50, 0, 10, 10);


    beginShape();
    vertex(50, 0);
    vertex(80, 0);
    vertex(70, -10);
    vertex(60, -10);
    vertex(50, 0);
    endShape();


    beginShape();
    vertex(50, 0);
    vertex(80, 0);
    vertex(70, 10);
    vertex(60, 10);
    vertex(50, 0);
    endShape();

    ellipse(50, 0, 10, 10);

    popMatrix();
  }



  void rotateArm() {

    if (_armR <= -30) {
      _armD = 1;
    }
    else if ( _armR >= 60) {
      _armD = -1;
    }
    _armR += _armD;
  }
}



