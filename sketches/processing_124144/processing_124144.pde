
void setup()
{
  size(1200,600);
  image(loadImage("The-Hobbit-Desolation-of-Smaug-Poster.jpg"),-830,-150);
}

void draw()
{
  if(mouseButton == CENTER)
  {
  fill(255,255,255,2);
  textSize(42);
  text( "December 13, 2013",425,450);
  }
  
  if(mouseButton == LEFT)
  {
   fill(255,254,254,2);
   textSize(50);
   text( "Beware The Dragon Dread",200,550);
  }
  
  if(mouseButton == RIGHT)
  {
    image(loadImage("SMAUG.jpg"),-100,-150);
  }
}




