
//////////////////////////////////////////////////////////////////////
//Dylan Murphy
//9/30/12
//Race Car
//Press any key to start or stop the car's motion.
//The above instructions are printed when the program runs.
//////////////////////////////////////////////////////////////////////

void setup() {
  
  //Sets window size and prints user instructions
  size (800, 600);
  println(instructions());
}

//Sets global variables
int carBodyX = -125;
final int CAR_BODY_Y = 400;
int carSeatX = -280;
int carSeatY = CAR_BODY_Y- 30;
int backWheelX = -275;
int wheelY = CAR_BODY_Y + 50;
int frontWheelX = -35;
int driverHeadX = -175;
int driverHeadY = CAR_BODY_Y - 70;
int driverEyeX = -160;
int driverEyeY = CAR_BODY_Y - 80;
boolean motionSwitch = true;

void draw() {
  
  //Draws the program as a whole
  drawScene();
  drawCar();
  drawDriver();
  carMoves ();
  
  
  
}

void keyPressed () {
  
  //Allows motion to be controlled by keyboard
  motionSwitch = !motionSwitch;
  
  
}

void drawCar() {
  
  //Sets variable for wheel measurements
  int wheelMeasure = 70;
  
  //Draw the car
  rectMode (CENTER);
  fill (255, 0, 0);
  rect (carBodyX, CAR_BODY_Y, 250, 80);
  rect (carSeatX, carSeatY, 60, 140);
  fill (0);
  ellipse (backWheelX, wheelY, wheelMeasure, wheelMeasure);
  ellipse (frontWheelX, wheelY, wheelMeasure, wheelMeasure);
}
  
void drawDriver() {
  
  //Draw the driver
  fill (255, 160, 100);
  ellipse (driverHeadX, driverHeadY, 60, 60);
  fill (0);
  ellipse (driverEyeX, driverEyeY, 10, 10);  
}

void drawScene() {
  
  //Draw the road and sky
  rectMode (CORNER);
  fill (0, 200, 255);
  rect (0, 0, width, 400);
  fill (180);
  rect (0, 400, 800, 200);
  fill (255, 255, 0);
  rect (width/6, 480, 50, 20);
  rect (width/2, 480, 50, 20);
  rect ((5* width)/6, 480, 50, 20);
}

void carMoves () {
  
  //Sets how the car moves
  if (motionSwitch) {
    carBodyX = (carBodyX + 3);
    carSeatX = (carSeatX + 3);
    backWheelX = (backWheelX + 3);
    frontWheelX = (frontWheelX + 3);
    driverHeadX = (driverHeadX + 3);
    driverEyeX = (driverEyeX + 3);
  }
}

//Sets instructions to be printed to user
String instructions () {
  return ("Press any key to start or stop the car's motion.");
}


