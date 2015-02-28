
float ballX;
float ballY;
float ballX2;
float ballY2;
float vx2;
float vy2;
float vx; // x velocity
float vy; // y velocity

void setup()
{
  size(800, 800);
  
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  ballX2 = width/2; 
  ballY2 = height/2 ;
  vx=8;
  vy=-5;
  vx2=-8;
  vy2=5;
  // ADD - set initial velocity
}

void draw()
{
  moveBall();
  drawBall();
}

void moveBall()
{
  // ADD - update the ball's position by adding it's velocity (both vx and vy)
  ballX+=vx;
  ballY+=vy;
  // check if the ball over the left or right edges of the screen
  if (ballX <= 0 || ballX >= width)
  {
    // ADD - bounce off the left or right side of the screen
    vx= -vx;
    //vy= -vy;
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY <= 0 || ballY >= height)
  {
    // ADD - bounce off the floor or ceiling
    //vx= -vx-5;
    vy= -vy;
  }
  ballX2+=vx2;
  ballY2+=vy2;
  if (ballX2 <= 0 || ballX2 >= width)
  {
    // ADD - bounce off the left or right side of the screen
    vx2= -vx2;
    //vy= -vy;
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY2 <= 0 || ballY2 >= height)
  {
    // ADD - bounce off the floor or ceiling
    //vx= -vx-5;
    vy2= -vy2;
  }
}

void drawBall()
{
  float random1= random(0,255);
  float random2= random(0,255);
  float random3= random(0,255);
  float random4= random(0,255);
  float random5= random(0,255);
  float random6= random(0,255);
  float random7= random(0,150);
  float random8= random(0,150);
  float random9= random(0,150);
  //background(255);
  line(ballX, 20, 30, ballY);
  line(width-30, ballX2, ballY2, height-20);
  
  /*fill(random1,random2, random3);
  ellipse(ballX, ballY, random7, random8);
  fill(random4, random5, random6);
  stroke(random4, random5, random6);
  triangle(ballX, ballY, random9, random1, random4,random7);*/
}
