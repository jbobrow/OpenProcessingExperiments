
void setup()
{
  size (500,500);
  background (255,255,255);
  smooth();
  
}
void draw ()
{
  rect (0,0,width,height); 
  image(loadImage("Djlogo.jpg"),random (100),random (500));
  frameRate (5);
}

 






