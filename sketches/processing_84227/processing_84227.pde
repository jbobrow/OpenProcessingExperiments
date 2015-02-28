
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
    
  strokeWeight(0.5);
  stroke(255);
  rotate(random(PI/500));
  scale(1);
  triangle(posX, posY,mouseX, mouseY,mouseX,mouseY);
  
   
 }
 
  }
  
}
