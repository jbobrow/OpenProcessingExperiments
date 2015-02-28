

PImage pig;
PImage earth;
 
//Ball Things
float ballX;
float ballY;
float ballDIRECTION = 1;
float ballSIZE = 50;
float dy = 10;
 
 // Declaring arrays: two arrays with 40 elements.
int[] xPosition = new int[100];
int[] yPosition = new int[100];
 
void setup() {
  size(300, 500);
  smooth();
  pig= loadImage ("pig2.gif");
  earth= loadImage ("earth.gif");
 
  rectMode(CENTER_RADIUS);
  ellipseMode(CENTER_RADIUS);
 
  ballY = height/2;
  ballX = 1;
 
  noStroke();
 
// Making it start at 0
for (int i = 0; i < xPosition.length; i ++ ) {
  xPosition[i] = 0;
  yPosition[i] = 0;
}
}
 
void draw()
{
  background(0);
   
  //Ball
 ballX += ballDIRECTION * 2;
 ballY += dy;
 if(ballX < -ballSIZE) {
   ballX = width+ballSIZE;
   ballY = random(0, height);
   dy = 10;
 }
  
 // If the ball touches "back" wall, change direction
 if((ballX > 300-ballSIZE) && ballDIRECTION == 1) {
   ballDIRECTION *= -1;
    
 }
  
  // If the ball touches "top" or "bottom" wall, change direction
 if(ballY > height-ballSIZE) {
   dy = dy * -1;
 }
 if(ballY < ballSIZE) {
   dy = dy * -1;
 }
  
 
 
  // Shifting the array values
  for (int i = 0; i < xPosition.length-1; i ++ ) {
    // Shift all elements down one spot.
    xPosition[i] = xPosition[i+1];
    yPosition[i] = yPosition[i+1];
  }
 
  // New location
  xPosition[xPosition.length-1] = mouseX;
  yPosition[yPosition.length-1] = mouseY;
 
  // A loop, draw everything
  translate(-30, -40);
  for (int i = 0; i < xPosition.length; i ++ ) {
    noStroke();
    fill(255-i*5);
    image(pig, xPosition[i], yPosition[i], i, i);
  }
   
   // Draw ball
 image(earth, ballX, ballY, ballSIZE, ballSIZE);
}


