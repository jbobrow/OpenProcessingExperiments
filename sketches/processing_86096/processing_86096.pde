
float y;
float x;


float BallX;
float BallY;
float ballSpeed;
int server;

//Speed(-8, 8);
//Speed(-8, 8);
void setup()

{
  size(800, 600);
  smooth();
  background(0);
  BallX = 75;
  BallY = random(50, height-50);
  ballSpeed = 10;  
  
  server = int(random(1, 3));
  println(server);
  if (server == 2)
  {
    BallX = width-75;
    ballSpeed = -10;
  }
  
}
void draw()
{
  fill(0);
  rect(0, 0, width, height);

  fill(20, 100, 90);
  rect(0, y, 25, 200);
  fill(20, 100, 90);
  rect(775, x, 25, 200);
  fill( 235, 236, 237);

  BallX = BallX + ballSpeed;
  ellipse(BallX, BallY, 50, 50);

  if (BallX >= 750 && BallY >= x && BallY <= x+200)
  {
    ballSpeed = ballSpeed * (-1);
  }

  if (BallX <= 50 && BallY >= y && BallY <= y+200)
  {
    ballSpeed = ballSpeed * (-1);
  }

  if (BallX > width || BallX < 0) 
  {
    gameOver();
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    y = y - 5;
  }
  if (key == 's')
  {
    y = y +5;
  }
  if (keyCode == UP)
  {
    x = x - 5;
  }
  if (keyCode == DOWN)
  {
    x = x +5;
  }
}


void gameOver()
{
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(36);
  text("GAME OVER.", width/2, height/2);
  
  if (BallX <= 0)
  {
    text("Player 2 wins.", width/2, height/2 + 100);
  }
  else
  {
      text("Player 1 wins.", width/2, height/2 + 100);
  }
  
  noLoop();
}



