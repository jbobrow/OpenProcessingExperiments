
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
    
      ellipse(posX,posY,10,10);
     
     

     rotate(PI/1);
    ellipse(posX,posY,mouseX,mouseY);
     
  
      
}

}
