
void setup()
{
  size(600, 300);
  smooth(0);
   
  fill(100, 0, 0);
  textSize(27);
}
void draw()
{
  fill(900, 80, 900);
  if (frameCount%25<10)
  {
    fill(10);
  }
  text( " Justin Bieber was born on March 1st ", 100, 100);
  ellipse( 0, 0, 0, 0);
}

