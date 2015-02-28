
//int for ball
int posX, posY;
int speedX = 0;
int speedY = 0;
int shapeSize=10;
//int for dotted line for loops
int lineY, lineX;
int lineSize = 2;
//int for paddles
int paddleX, paddleY, paddleX2, paddleY2;
int sizeAcross = 10, sizeDown = 50;
//color variables
float r;
float g;
float b;

//score
boolean starright = true;
boolean starleft = true;


void setup()
{
  size (400, 400);
  background (0);
  posX = width/2;
  posY = height/2;
  lineX = width/2;
  paddleX = 0;
  paddleY = 0;
  paddleX2 = 389;
  paddleY2 = 0;
}

void draw ()
{

  background (0);
  r= random (1, 256);
  g= random (1, 256);
  b= random (1, 256);
  
/* This is the for loop that makes the dotted line*/

fill (255);  
for (lineY = 0; lineY < 200; lineY= lineY +1)
{
if (lineY % 2 == 0)
{
rect (lineX, lineY*lineSize, lineSize, lineSize);
}
}

 /* This is the Pong Ball*/ 
 
  fill (r,g,b);
  ellipse (posX, posY, shapeSize, shapeSize);
  


/*This section of the code controls the speed of the ball.
The x position of the ellipse continually increases by the value of speedX 
(in this case by 1) each time the draw function runs.*/

posX = posX + speedX;
//the code below moves the ball along the y axis.
posY = posY + speedY;

/*the code below makes the ball bounce off the left and right walls 
as well as the top and bottom*/

if (posX > width)
{
speedX = speedX * - 1;
}
else if (posX < 0)
{
speedX = speedX* -1;
}

if (posY > height)
{
speedY = speedY * -1;
}
else if (posY < 0)
{
speedY = speedY * -1;
}

/* This means the ball stays stationary until the mouse is clicked.*/

if (mousePressed)
{
speedX = 1;
speedY = 3;
stroke (0, 255, 0, random(50, 80));
strokeWeight (8);
println("BATTLE ENGAGE!");
PFont font;
font = loadFont("LetterGothicStd-32.vlw");
textFont(font);
text("BATTLE ENGAGE!", 70, height/2); 
}

/*This is the code to make the ball bounce off the paddles*/

//RIGHT paddle
if (posX > paddleX2 && posX < paddleX2 + sizeAcross && posY > paddleY2 && posY < paddleY2 + sizeDown)
{
speedX = speedX * -1;
speedY = speedY * -1;
}

//LEFT paddle
if (posX > paddleX && posX < paddleX + sizeAcross && posY > paddleY && posY < paddleY + sizeDown)
{
speedX = speedX * -1;
speedY = speedY * -1;
}

//This is where BALL FAIL for the RIGHT side lives:

if (posX >= 395)
{
  posX = width/2;
  posY = height/2;
  starleft = false;
  speedX = speedX * -1;
  speedY = speedY * -1;
}

if (posX <= 5)
{
  posX = width/2;
  posY = height/2;
  starright= false;
  speedX = speedX * -1;
  speedY = speedY * -1;
}

//this is the star score
if (starright == false)
{
        fill(random(255), random(255), random(255));
       stroke(random(255), random(255), random(255));
        strokeWeight(1);
        beginShape();
          vertex(390, 380);
          vertex(393, 387);
          vertex(399, 389);
          vertex(395, 393);
          vertex(398, 398);
          vertex(390, 395);
          vertex(383, 398);
          vertex(387, 393);
          vertex(382, 389);
          vertex(388, 387);
          endShape(CLOSE);
          PFont font;
          font = loadFont("LetterGothicStd-32.vlw");
          textFont(font);
          text("WINNER PLAYER1", 100, 350); 
}
//star score2 WORK ON THIS!!!
if (starleft == false)
{
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        strokeWeight(1);
        beginShape();
          vertex(7, 380);
          vertex(9, 387);
          vertex(12, 389);
          vertex(9, 393);
          vertex(12, 398);
          vertex(7, 395);
          vertex(1, 398);
          vertex(4, 393);
          vertex(1, 389);
          vertex(4, 387);
          endShape(CLOSE);
          PFont font;
          font = loadFont("LetterGothicStd-32.vlw");
          textFont(font);
          text("WINNER PLAYER2", 1, 350); 
}

//This is where the paddles go:
fill (245, 204, 101);
//Paddle 1
rect(paddleX, paddleY, sizeAcross, sizeDown);
//Paddle 2
rect(paddleX2, paddleY2, sizeAcross, sizeDown);

  
//This is the code for the movement of the LEFT paddle (Paddle 1)  
  if (keyPressed)
  {
    if (key == CODED)
    {
    if (keyCode == UP)
    {
    paddleY = paddleY -3;
    println("The UP arrow has been pressed!");
    }
    else if (keyCode == DOWN)
    {
    paddleY = paddleY +3; 
    println("The DOWN arrow has been pressed!");
    }
    }
  }

//This is the code to move the RIGHT paddle (Paddle 2) using CONTROL for "up" & ALT for "down."
if (keyPressed)
  {
    if (key == CODED)
    {
    if (keyCode == CONTROL)
    {
    paddleY2 = paddleY2 -3;
    println("The 2nd UP arrow has been pressed!");
    }
    else if (keyCode == ALT)
    {
    paddleY2 = paddleY2 +3; 
    println("The 2nd DOWN arrow has been pressed!");
    }
    }
  }

//This is the code for the LEFT paddle to stay on the screen.
  if (paddleY > height-50)
  {
  paddleY = 350;
  }
  else if (paddleY < 0)
  {
  paddleY = 0;
  }

//This is the code to keep the RIGHT paddle on the screen.
  if (paddleY2 > height-50)
  {
  paddleY2 = 350;
  }
  else if (paddleY2 < 0)
  {
  paddleY2 = 0;
  }

}
