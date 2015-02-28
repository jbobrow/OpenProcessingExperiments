
PImage bg;  // Data type for storing images

float x, y;
float size = 40.0;

float a = 0.0;
float s = 0.0;

void setup ()
{
  size(800, 400);  // Sketch window size
  noStroke();  // No border
  rectMode(CENTER);  // Centered
  frameRate(30);  // Frame refresh rate
  bg = loadImage("background.jpeg");  // Background image loacated in folder
} 

float ballX = 200;
float ballY = 100;
float speedX = 20; 
float speedY = 0;
int hit = 0;
int miss = 0;

void draw ()
{  
  background(bg);  // Call background 

  if (mousePressed) {  // If the mouse is clicked reset the game 
    hit = 0;  // Reset the scores to zero 
    miss = 0;  // Reset the scores to zero
  }

  float paddle = 1000/ (hit+10);   
  if (ballX < 0 || ballX > width) speedX = -speedX;  // If the ball x is less than 0 and greater than the width, speed is minus
  if (ballY > height) {  // If ball Y is less than height speed Y is minus
    speedY = -speedY;
    float distance = abs(mouseX - ballX);  // abs calculates the absoulate value of a number, always positive
    if (distance < paddle) hit += 1;  // If the distanc eis less than the paddle hit is + 1
    else miss += 1;  // if not then its a miss
  } 
  else speedY += 1;

  ballX += speedX;
  ballY += speedY;

  fill(255, 0, 0);  // The ball is red
  ellipse(ballX, ballY, 50, 50);  // Size of the ball
  fill(55);  // The paddle is dark grey
  rect (mouseX-paddle, height-10, 2*paddle, 10);  // Size and location of the paddle 

  fill(255);  // Colour of the text is white 
  text("hit: " + hit, 10, 20);  // Text location
  text("miss: " + miss, 10, 40);  // Text location

  //  Circles moving around in front of the background
  // The first parameter sets the x-axis offset and the second the Y  

  a = a + 0.04;
  s = cos(a)*2;  // Cos calculates the cosine of the angle

  translate(width/2, height/2);  // The amount the object is displaced in the sketch window
  scale(s);  // Increases and decrease the size of the shape  
  fill(225, 0, 0);  // Red circle
  ellipse(0, 0, 50, 50);  // Cirlce size and location 

  translate(75, 0);  // The amount the object is displaced in the sketch window
  fill(255);  // White cirlce
  scale(s);  // Increases and decrease the size of the shape
  ellipse(0, 0, 50, 50);  // Cirlce size and location  

  x = x + 0.8;

  if (x > width + size) {  // If x is greater than the width + size x is minus the size
    x = -size;
  } 

  translate(x, height/2-size/2);  // The amount the object is displaced in the sketch window
  fill(255);  // White cirlce
  ellipse(-size/2, -size/2, size, size);  // Cirle size and location 

  translate(x, size);  // The amount the object is displaced in the sketch window
  fill(255, 0, 0);  // Red cirlce
  ellipse(-size/2, -size/2, size, size);  // Cirlce size and location
}
