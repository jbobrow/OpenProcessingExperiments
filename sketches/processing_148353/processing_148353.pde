
void setup()
{
  size(600, 300);
  smooth(0);
 
  fill(255, 0, 0);
  textSize(27);
}
void draw()
{
  fill(600, 600, 100);
  if (frameCount%30<15)
  {
    fill(10);
  }
  text( "My Name Is Kiylah And I want A Cat", 100, 100);
  ellipse( 0, 0, 0, 0);
}

