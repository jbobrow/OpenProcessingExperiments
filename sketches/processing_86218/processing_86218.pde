
/*A rolling ball, movement is controlled by Left and Right Keystrokes
Ball rolls while moving. There is a point on Ball to emphasize the rolling motion.
Date Coded : 14.09.2012, and bug revision is 16.09.2012 */


void setup() {
  background(0);
  size(600, 300);
}


void draw() {
  background(0);
  drawBall_atGivenCoordinates();
  drawEarthLine();
}	


void drawBall_atGivenCoordinates() {

  /* doTransormations() is to arrange the coordinates 
  if user moves ball with a keyStroke*/
  doTransformations();	
  
  //this arranges the drawing.
  fill(50);
  strokeWeight(0);
  stroke(150);

  /* We want our ellipse to be drawn at the newly determined 
  Origin point. We will place it exactly that point.
  since then we are using (0,0) coordinates inside of ellipse(). */
  ellipse(0, 0, 2*ballRadius, 2*ballRadius);//ellipse(x,y,width, height);

  /*Here we should define a point on ball to see the rotation
  of ball clearly. Otherwise we cant be able to see the 
  rotational movement. */
  fill(255, 0, 0);
  ellipse(0, (0 +ballRadius), 10, 5);
}


void drawEarthLine() {

  undoTransformations();

  stroke(150);
  strokeWeight(2);
  
  /*originPintY  is currently used for the ellipse's drawing. We want
  our ellipse sits on the earth line, so the point our ellipse's bottom's 
  y coordinate will be our lines y coordinate also.*/
  line(0, (originPointY + ballRadius), width, (originPointY + ballRadius));
  writeInstructionsOnScreen();
}


void writeInstructionsOnScreen() {
  fill(255);
  textSize(20);
  textAlign(RIGHT, BOTTOM);
  text("Use Left and Right Arrow Keys to move the ball", (0.95)*width, (0.95)*height);
}


void doTransformations() {

  /* the main program listens for the User imperatives silently in backstage by using 
  its keyPressed function.
  
  doTransformations function adapts the screen values to the new situation and 
  prepares the stage for the next frame.It does change the coordinates of origin 
  point, the rotation amount of Screen so the screen can be rotated around Origin 
  Point, So that, we can see the rotation as the rotation of the ball.

  We should first define the new origin, then we should rotate the screen 
  around new origin point. */
  translate(originPointX, originPointY);
  rotate(rotationAmount);
}

void undoTransformations() {

  /*undoing transformations will ease our works such as giving coordinates and 
  drawing earth line, since we can think UpperLeft corner of Screen always as Origin. 
  We don't have to think how much and to where the screen moved or rotated and 
  where the newest origin Point is at current time. 
  
  If we don't undo the transformations, all the time we should write some code 
  calculating all the time, which coordinate shows the eartLine's current x and y 
  coordinates in terms of new origin point and the sin and cosines of the rotation angle.

  We should first get back the amount of rotation so that screen will be again vertical 
  to our eye,then we should drag the origin point again to upper left corner*/
  rotate(-rotationAmount); //Rotates the screen
  translate(-originPointX, -originPointY); //Carrys the screen origin to given point.
}


void keyPressed() {

  /*the strategy for holding the user inputs.
  
  First we should determine how much will the amount of displacement be at each 
  stroke in our program, then we will calculate how much the ball rotates at 
  each stroke by calculating the rotation Angle due to that value.

  we will start by defining a variable for holding the circumference of ball. 
  we have circle circumference amount on the hand, we can calculate it easily
  with the knowledge of ballRadius. 
  Now we can think the displacement as the amount of whole ball circumference 
  taken on road. We are defining the amount of displacement in terms of 
  circle circumference.
  
  The value of displacement is the displacement of Origin Point at each key stroke.
  Origin Point is also the center of our circle.
  
  To me, it seeems The amount of displacement should be 0.015 of whole ball 
  circumference at each step. I personally decide that amount, we can change it
  later on. 
  
  After that  we should define a ratio, showing to us that the amount
  of road piece taken in each step to circle's  circumference. */

  float ballCircum = (2 * PI * ballRadius );
  float displacement_To_Circumference_Ratio = 0.015;
  
  //We define the road amount taken at each step as in terms of the ball circumference
  float roadAmount_TakenAtEachStep = (displacement_To_Circumference_Ratio)*ballCircum;

  /*Now we calculate how much a point on the ball turns at each stroke.
  The angle showing a whole circle is 360Degree, 2PI radians. 
 
  We have defined already the amount of road taken in terms of circle lenght.
  Now we will calculate the arch lenght in terms of Radian degree. This will be the 
  rotation angle. */
  float wholeCircleAngle = 2*PI;
  float rotationAngle_atEachTurn  = (wholeCircleAngle * displacement_To_Circumference_Ratio);

  //Now we can arrange our increments. 
  if (keyCode == LEFT) {
    rotationAmount -= rotationAngle_atEachTurn;
    originPointX   -= roadAmount_TakenAtEachStep;
  }
  if (keyCode == RIGHT) {
    rotationAmount +=  rotationAngle_atEachTurn;
    originPointX   +=  roadAmount_TakenAtEachStep;
  }
}



//Variable holds the rotation amount.
float rotationAmount = 0;

//Radius of Ball
float ballRadius = 50;

//Variable holds the coordinates of user carriable origin point.
float originPointX = 300;//300 is the half of screen width		
float originPointY = 200; // 200 is the (2/3)of  screenheight

















