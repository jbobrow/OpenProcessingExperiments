
float row;
float column;
float redAmount = 0;
float greenAmount = 0;
float blueAmount = 255;

void setup()
{
  size(400, 600);
  background(0, 0, 255);
  smooth();
  frameRate(20);

  strokeWeight(10);
}

void draw()
{
  noStroke();
  fill(redAmount, greenAmount, blueAmount, 30);
  rect( 0, 0, width, height );

  fill(255, 0, 0);
  ellipse( mouseX, mouseY, 30, 30 );

  column = random(width);
  row = random(height);

  stroke( random(255), random(255), random(255) );
  line(0, row, width, row);

  if (key == 'n')
  {
    stroke( random(255), random(255), random(255) );
    line(column, 0, column, height);
  }
}

void keyPressed()
{

  
  if (key == 'j')
  {
    redAmount=random(255);
    greenAmount=random(255);
    blueAmount=random(255);
    background(redAmount, greenAmount, blueAmount);
  }
}
