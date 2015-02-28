
int circlesDrawn = 0;
int squaresDrawn = 0;
int shapesDrawn = 0;

void setup()
{
  size(800, 600);

  // TODO - create a loop that runs at least 100 times
  //{
  // TODO - draw a circle at a random position on the screen with a random size and color

  //} TODO - end loop here
}

void drawCircle(float x, float y, float size, color circleColor)
{
  fill(circleColor);
  ellipse(x, y, size, size);
}
void drawRectangle(float x, float y, float size, color squareColor)
{
  fill(squareColor);
  rect(x, y, size, size);
}
void draw()
{
  frameRate(600);
  //for(int loopCount = 0; loopCount < 201; loopCount++)
  //{
  float randomX= random(0, 800);
  float randomY= random(0, 600);
  float randomSize= random(1, 100);
  float randomRed= random(0, 255);
  float randomGreen= random(0, 255);
  float randomBlue= random(0, 255);
  float randomShape = random(0, 1);
  if (randomShape> .5)
  {
    drawCircle(randomX, randomY, randomSize, color(randomRed, randomGreen, randomBlue));
    circlesDrawn++;
    shapesDrawn++;
  }
  else
  {
    drawRectangle(randomX, randomY, randomSize, color(randomRed, randomGreen, randomBlue));
    squaresDrawn++;
    shapesDrawn++;
  }
  textSize(20);
  fill(0);  
  println("There have been " +squaresDrawn+" squares drawn, " +circlesDrawn+" circles drawn, and " +shapesDrawn+ " shapes drawn.");
}
