
/* Andre Blyth
 rule 1. Objects are created by a Timer.
 rule 2. Collisions trigger events.
 rule 3. Mouse movement affects Creation of Shapes.
 
 */


//vars
Object myObject;
Box myBox;
Box[] boxArray;
boolean checkMouse;
float mousexPosition1, mousexPosition2;
float mouseyPosition1, mouseyPosition2;
float startTime;
float xPos, yPos;
float rectangleX, rectangleY;
float speed = 2.5;
int circlecount = 0;
PImage winner;
int savecounter = 0;
//end vars


//setup
void setup() {
  xPos = pmouseX;
  yPos = pmouseY;
  myBox = new Box(random(height), random(width));
  myObject = new Object(xPos, yPos);
  size(600, 600);
  background(0);
  smooth();
  rectMode(CENTER);
  checkMouse=false;
  resetTime();
  frameRate(20);
  winner = loadImage("01.png");

  //50 boxes on screen in a random location
  boxArray = new Box[50];
  for (int  i=0; i<boxArray.length; i++) {
    boxArray[i]= new Box(random(width), random(height));
  }
}

//draw
void draw() {

  println(circlecount);
  println(elapsedTime());
  recordMousePosition();

  /*if mouse is still for 1 second, draw rectangle
   
   */
  if (checkMouse==true) {
    checkCollison(mouseX, mouseY, boxArray);
    fill(random(255), random(255), random(255));
    myObject.move();
    myObject.display();
    circlecount++;          //everytime a circle is added, add 1 to circle count.
  }

  /*
  A red line is drawn based upon the movement of the mouse cursor. 
   
   */
  stroke(255, 0, 0);
  strokeWeight(2);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(0, 0, 255);



  //create 50  rectangles in a random location on screen
  for (int i=0; i<boxArray.length; i++) {
    myBox=boxArray[i];
    myBox.display();
    //myBox.move();
  }

  // if circle count = 10, display star
  if (circlecount==10) {
    image(winner, 100, 100);
  }
  // end winner
}

void recordMousePosition() {

  /* Check mouse position every second.
   Compare Mouse Position 2, which is where the mouse is after elapsed time is
   greater than 1000 to Mouse Position 1, which is the mouse position when
   the timer starts (see void resetTime). If they are the same, reset timer.
   
   */
  if (elapsedTime()>1000) {
    mousexPosition2=mouseX;
    mouseyPosition2=mouseY;
    if (mousexPosition1 == mousexPosition2 && mouseyPosition1 == mouseyPosition2) {
      checkMouse=true;
      resetTime();
    }
  }
}

//when time is reset, record mousepostion.
void resetTime() {
  startTime=millis();
  mousexPosition1=mouseX;
  mouseyPosition1=mouseY;
}

float elapsedTime() {
  return millis()-startTime;
}


/*If mouse is moved, reset timer.
 
 */
void mouseMoved() {
  resetTime();
}


/*.
 Collision check.
 If mouse crosses Box borders, current circles are cleared,
 (last drawn remains though) and circlecounter is set to -1,
 because last circle should not count.
 
 
 */
void checkCollison(float x, float y, Box[] bArray) {

  for (int i=0; i<bArray.length; i++) {
    if ( dist(x, y, bArray[i].bxPos, bArray[i].byPos)< 25 +(bArray[i].bsize/2)) {
      background(random(255), 120, 120);
      circlecount=-1;
    }
  }
}
//end collision


// If S key is it, save .tif at current frame.
void keyPressed() {
  if (key == 's' || key== 'S') {
    save("FirstSketch"+savecounter+".tif");
    savecounter++;
  }
}
//end save

//end sketch


