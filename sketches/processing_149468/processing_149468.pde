
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
  if (frameCount%30<15)
  {
    fill(10);
  }
  text( "Happy Last Day Of School!", 100, 100);
  ellipse( 0, 0, 0, 0);
}

