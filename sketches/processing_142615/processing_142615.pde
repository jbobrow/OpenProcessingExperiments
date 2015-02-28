
void setup()
{
  size(500,500);
  
}
 
void draw ()
{
  background(0);
   noFill();
   strokeWeight(0.2);
   
  for (int posX=50; posX<width; posX=posX+50)
  {
   
   for (int posY=50; posY<height; posY=posY+50)
   {
     
   
  stroke(0,153,0);
  rotate(mouseX/255);
  translate(1, 0);
  scale(1);
ellipse(pmouseX,pmouseY,pmouseX,pmouseY);

stroke(random(0,255),random(0,255),random(0,255));

 
}
  
}
   
}



