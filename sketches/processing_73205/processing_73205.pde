
/*Anna Almquist
*CSE 174H
*Dr. Krumpe
*October 2, 2012
*This program creates small methods and implements them to create one program.
*/

/*To run the program, there are important keys to take note of.
*Thearrow keys move the car around.
*'c' tells the user what the current speed is in the processing window.
*'d' makes the smiley face disappear and reappear.
*'r' changes the color of the car.
*'s' changes the speed of the ellipses and the car.
*/


//boolean variable needed to change the color of the car.
boolean carColor = true;
boolean smileyFace = true;

//number variable needed to change the color of the car.
int greenColor = 0;
int smileTransparancy = 50;

//variables needed to help move the car.
int carPositionX = 300;
int carPositionY = 300;

// variable that determines the car speed
int carSpeed = 1;

//variable that determines where the ellipses are.
int ellipseX = 0;
int ellipseY = 0;

//Car acceleration every time the speed button is pressed.
final int CAR_ACCELERATION = 2;

void setup() {
  size(600,600);
}

//draws the shapes at 60 times per second.
void draw() {
  background(0);
drawCar(30);
drawEllipses(50);
moveEllipses();
checkEllipseBoundary();
drawStars(10);
drawStars(30);
drawSmiley();
}

//draws the car and requires a parameter to determine the size of the car.
void drawCar(int carSize) {
  noStroke();
  fill(255,greenColor,0);
  rect(carPositionX,carPositionY, carSize*2, carSize);
  fill(255);
  ellipse(carPositionX +2*carSize/3, carPositionY + carSize, 10, 10);
  ellipse(carPositionX +4*carSize/3, carPositionY + carSize, 10, 10);
}

//changes the boolean variable to the opposite of what it is.
void changeColor() {
  carColor = !carColor;
}

//changes the boolean variable that changes transparancy from true to false.
void changeTransparancy() {
  smileyFace = !smileyFace;
}

//changes the speed of the car and circles moving on the screen.
void changeSpeed() {
  carSpeed += CAR_ACCELERATION;
}
//draws the circles that move across the screen.
void drawEllipses(int diameterOfCircle) {
  noStroke();
  ellipse(ellipseX, height/2, diameterOfCircle, diameterOfCircle);
  ellipse(width/2, ellipseY, diameterOfCircle, diameterOfCircle);
}

//makes the ellipses move a certain speed without user interaction.
void moveEllipses() {
  ellipseX += carSpeed;
  ellipseY += carSpeed;
}

//returns the ellipses back to their original boundary when they
//are about to go off the screen.
void checkEllipseBoundary() {
  if (ellipseX>600) {
    ellipseX = 0;
  }
  if (ellipseY >600) {
    ellipseY = 0;
  }
}

//returns the current speed of the car so 
int getSpeed() {
  return carSpeed;
}

//draws the star in a random place 60 times a second.
void drawStars(int starLength) {
  stroke(0,255, 255);
  int starPlace1 = (int) random(10,591);
  int starPlace2 = (int) random(10, 591);
  line(starPlace1 - starLength, starPlace2 - starLength, starPlace1 + starLength, starPlace2 + starLength);
  line(starPlace1 - starLength, starPlace2, starPlace1 + starLength, starPlace2);
  line(starPlace1 - starLength, starPlace2 + starLength, starPlace1 + starLength, starPlace2 - starLength);
}

//draws the smiley face that appears and disappears.
void drawSmiley() {
  noStroke();
  fill(0, 255, 0, smileTransparancy);
  ellipse(300, 300, 400, 400);
  fill(255, 255, 255, smileTransparancy);
  ellipse(200, 200, 30, 30);
  ellipse(400, 200, 30, 30);
  arc(300, 400, 200, 100, 0, PI);
}
  
 
void keyPressed() {
  //move the car up, down, left and right
  if (keyCode == UP) {
    carPositionY = carPositionY - carSpeed;
}
  if (keyCode == DOWN) {
    carPositionY = carPositionY + carSpeed;
}
if (keyCode == LEFT) {
  carPositionX = carPositionX - carSpeed;
}
if (keyCode == RIGHT) {
  carPositionX = carPositionX + carSpeed;
}

//changes the speed of the ellipses moving and how fast the car goes.
if (key == 's') {
  changeSpeed();
}

//changes the car from red to yellow and from yellow to red.
if (key == 'r') {
  changeColor();
  if (carColor == true) {
    greenColor = 0;
  }
  else {
    greenColor = 255;
  }
}

//tells the user how fast the current speed is.
if (key == 'c') {
  println("The current speed of the objects is " + getSpeed());
}

//makes the giant smiley face appear and disappear when the letter is pressed.
if (key == 'd') {
  changeTransparancy();
  if (smileyFace == true) {
    smileTransparancy = 50;
  }
  else {
    smileTransparancy = 0;
  }
}
}

