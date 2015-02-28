
//For the Changing Background
float bg = 255;

//Paddle Things
float paddleW = 5;
float paddleH = 30;
float wallDISTANCE = 45;

//Ball Things
float ballX;
float ballY;
float ballDIRECTION = 1;
float ballSIZE = 5;
float dy = 10;

///////////////////////////////////////////

void setup()
{
 size(300,500);
 rectMode(CENTER_RADIUS);
 ellipseMode(CENTER_RADIUS);

 ballY = height/2;
 ballX = 1;
 
 noStroke();

 }
 
 /////////////////////////////////////////
 
void draw()
{
  
// making the background fade in and out 
 background (bg);
  if (mouseY > 325) {//speed
    bg = bg + 1;
  } else {
    bg = bg - 1;
  }
  
  if (bg > 255) {
    bg = 255;
  } else if (bg < 0) {
    bg = 0;
  }
  
//////////////////////////////////////////

//Ball
 ballX += ballDIRECTION * 2;
 ballY += dy;
 if(ballX < -ballSIZE) {
   ballX = width+ballSIZE;
   ballY = random(0, height);
   dy = 10;
 }
 
 //Paddle
 float paddleY = constrain(mouseY, paddleH, height-paddleH);

 // Drawing paddle
 fill(255);
 rect(wallDISTANCE, paddleY, paddleW, paddleH);

 // Drawing ball
 fill(255);
 ellipse(ballX, ballY, ballSIZE, ballSIZE);

 // Ball touching Paddle
 float py = wallDISTANCE+paddleW+ballSIZE;
 if(ballX == py
    && ballY > paddleY - paddleH - ballSIZE
    && ballY < paddleY + paddleH + ballSIZE) {
   ballDIRECTION *= -1;
   if(mouseY != pmouseY) {
     dy = (mouseY-pmouseY)/2.0;
     if(dy >  5) { dy =  5; }
     if(dy < -5) { dy = -5; }
   }
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
 
//changing lines
int i = 0; 
while (i < height) {
noStroke();
float distance = abs(mouseX -i);
fill (distance);
rect (i,0,1,height);
i+=60;

  } 

}




