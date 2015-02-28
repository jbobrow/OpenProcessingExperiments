
void setup()
{
  size(500,500);

   

  
}

void draw ()
{
  smooth();
  background(0);
   noStroke();
  
  for (int posX=25; posX<width; posX=posX+50)
  {
  
   for (int posY=25; posY<height; posY=posY+50)
   {
    
  
  fill(random(0,250),random(0,250),random(0,250));
  rotate(random(PI/360));
  scale(1);
  ellipse(posX, posY,mouseX, mouseY);
  
   
 }
 
  }
  
}
