
// ball variables.
int rad = 50; //giving the ball a radius of 50
float ballX; //setting up a variable for the x position of the ball.
float ballY; // setting up a variable for the y postion of the ball.
float fiftyShadesOfBlue = (255); //a random variable with the number 255

//speed of ball variance.
float xSpeed = 2.8; //set the speed for the balls movement on the x axis.
float ySpeed = 2.2; //set the speed for the ball on the Y axis. smaller so that it changes the angle each time.

//direction of ball var.
float xDir = 1; //the ball increases along xaxis at 1 incrament each time
float yDir = 1; //the ball increases along yaxis at 1 incrament each time


// draw background.
void setup () {
  size (500, 500); //set canvas size
  noStroke(); //no stroke set
  smooth(); //the circle is drawen smooth
  ellipseMode(RADIUS); //the ellipse mode is measure the radius of the circle
  
  //assign variable values for the start pos for ball to middle of the canvas
  ballX = width/2; //the next 2 varibles are wrote to postion the ball to appear in the center of the canvas
  ballY = height/2;
 
}
// draw a random colored ball in the middle of the canvas.
void draw () {
  background (255); //background set to white
  frameRate(45); //frame rate set to 45 per sec
  
 
  ballX = ballX + xSpeed * xDir; //the algorythm used to arrange the ball x position by using the position plus 2.8 x 1 each time 
  ballY = ballY + ySpeed * yDir;  //the algorythm used to arrange the ball y position by using the position plus 2.2 x 1 each time 
  
  //reverse direction if it hits top or bottom of the canvas
  if (ballY > height - rad || ballY< rad) { //IF the ball is greater than the height minus the radius OR the ball is less than the height minus radius then...
    yDir *= -1; // decrease the y coordinates by minus 1 each time, bringing the ball in the opposite direction.
  }
  //reverse direction if it hit left or right boarder
  if (ballX > width -rad || ballX < rad) { //IF the ball is greater than the width minus the radius OR the ball is less than the width minus radius then...
    xDir *= -1; // decrease the x coordinates by minus 1 each time, bringing the ball in the opposite direction.
  }
  
  fill(0, 0, fiftyShadesOfBlue); //fill ball with the previous stated variable
  
  ellipse(ballX, ballY, rad, rad); //draw ball with previous xpos, and ypos, and sized by previous radious variable stated
  
 
}
// pressing space bar
void keyPressed () { //command for pressing a key
  if (key == 32) {  // if key 32, code for the space bar is pressed then...
    fiftyShadesOfBlue = random(10, 255); //the variable is a random between 10, and 255
    fill(0, 0, fiftyShadesOfBlue); // processing know knows that the ball is filled with rgb. so, no red, green, but has now got the variable random blue between 10-255.
  }
}











