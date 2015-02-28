
void setup()
{
  size(500,500);
 
}

void draw ()
{
  smooth();
  background(0);
   noFill();
  
  for (int posX=25; posX<width; posX=posX+50)
  {
  
   for (int posY=25; posY<height; posY=posY+50)
   {
    
  
  stroke(255);
  rotate(PI/95);
  translate(1, 0);
  scale(1);


stroke(153);
strokeWeight(0.01);

line(mouseX, mouseY, random(0,500),random (0,500));



}
 
}
  
}
