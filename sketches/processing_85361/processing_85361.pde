
void setup()
{
  size(500,500);
  background(250);
   

  
}

void draw ()
{
  
  
   noStroke();
  
  for (int posX=25; posX<width; posX=posX+50)
  {
  
   for (int posY=25; posY<height; posY=posY+50)
   {
    fill(#F5CBCB);
  ellipse(posX, posY,45, 45);
  smooth();
  
  ellipse(posX, posY,20, 20);
  smooth();

 fill(random(0,250),random(0,250),random(0,250));
  ellipse(posX, posY,10, 10);
  noStroke();
  smooth();
 
  
   
 }
 
  }
  
}
