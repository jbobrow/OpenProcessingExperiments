
int xPos; // x position of the ball
int yPos; // y position of the ball
int dia=100; // diameter of the ball
boolean testEdge; // tests to see if the ball has reached the edge
int leftPadxPos = 0; // xposition for the left paddle
int leftPadyPos = 50; // y position of the left paddle 
int rightPadxPos = 495; // x position of the right paddle
int rightPadyPos = 50; // y position of the right paddle
String gameOver = "GAME OVER"; //game over message
float sinWave; //sine wave value for the 'Game Over Fade'



void setup() {
  size(500, 500);
  smooth();  
  //initiate the starting position for the ball.
  xPos=width/2;
  yPos=height/2;
}

void draw() {
  background(100,56,98);
  fill(200,165,12);
  //draw the ball
  ellipse(xPos, yPos, dia, dia); 
  //draw two rectangles for the paddles at either side of the screen
  rect(leftPadxPos, leftPadyPos, 5, 50); 
  rect(rightPadxPos, rightPadyPos, 5, 50);

  //controls the left and right paddle y positions using keys 'a, z, k and m'
  if(keyPressed) {
    if (key == 'a') {
      leftPadyPos -=1;
    }
    if (key == 'z') {
      leftPadyPos +=1;
    }
    if (key == 'k') {
      rightPadyPos -=1;
    }
    if (key == 'm') {
      rightPadyPos +=1;
    }
  }

  //tests to see if the ball has hit one of the paddles to decide on the ball direction.
  if(testEdge==true) {
    xPos-=1;
  }

  if(testEdge==false) {
    xPos+=1;
  }

  //sets the true or false values for the test edge boolean.
  //For example the first bit of code below says:
  //IF THE BALLS X POSITION IS 500 MINUS HALF THE DIAMETER OF THE BALL AND
  //THE Y POSITION IS LESS THAN THE YPOSITION OF THE RIGHT PADDLE AND
  //LESS THAN THE LENGTH OF THE PADDLE THEN
  //MAKE THE BOOKLEAN "testEdge" TRUE
  
  if((xPos == 500-(dia/2)) && (yPos > rightPadyPos) && (yPos < (rightPadyPos + 50))) {
    testEdge=true;
  }
  if((xPos == 0+(dia/2)) && (yPos > leftPadyPos) && (yPos < (leftPadyPos + 50))) {
    testEdge=false;
  }
  
  //if the ball has left the screen show the game over message and fade it in and out
  if ((xPos < 0) || (xPos > 500)) {
    fill(123,299,12,266*sin(sinWave));
    textAlign(CENTER);
    sinWave+=0.05;
    text(gameOver, height/2,width/2);
  }
}
           
                
