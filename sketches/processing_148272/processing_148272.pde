
void setup()
{
  size(400, 200);
  smooth();

  fill(255, 0, 0);
  textSize(38);
}
void draw()
{
  fill(255, 0, 0);
  if (frameCount%30<15)
  {
    fill(0);
  }
  text( "Lebron James ", 100, 100);
  ellipse( 50, 100, 40, 40);
}

