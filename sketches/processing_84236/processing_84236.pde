
void setup()
{
  size(500, 500);
  
}
 
void draw()
   {   
      
      
  background(255);
  noStroke();
  smooth();
      
      fill(0,120);    
 
  for (int posX=25; posX<= 475; posX = posX+50)
 
    for (int posY=25; posY<= 475; posY = posY+50)
    {
  rotate(PI/15); 
  scale(1);
 bezier(230, 230, 110, 165, 120, 195, mouseX, mouseY);
       
      
}

}
