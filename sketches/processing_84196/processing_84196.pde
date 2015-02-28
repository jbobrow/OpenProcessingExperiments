
void setup()
{
  size(500,500);
  background(0);
   
  smooth();
  
}

void draw ()
{
  
  
   noStroke();
  
  for (int posX=25; posX<width; posX=posX+50)
  {
  
   for (int posY=25; posY<height; posY=posY+50)
   {
    fill(#F5CBCB);
  ellipse(posX, posY,50, 50);
  ellipse(posX, posY,20, 20);
  
  fill(random(0,250),random(0,250),random(0,250));
  ellipse(posX, posY,10, 10);
   
 }
 
  }
  
}
