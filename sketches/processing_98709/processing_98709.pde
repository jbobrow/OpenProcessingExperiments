
float ballY;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(255, 0, 0);

  ballY = ballY + 1;  
  
  ellipse(width/2, ballY, 40, 40);  
}
