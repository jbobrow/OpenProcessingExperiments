
void setup()
{
  size(400, 600);
  background(4, 0, 0, 0);
  smooth();
}
void draw()
{
  image(loadImage("manger.jpg"), 0, 0);
  
  if (mousePressed)
  {
  textSize(20);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("The reason for the season.", width/2, height/2+100);
  }
}




