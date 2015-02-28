
void setup()
{
  size(500,500);
 
}

void draw ()
{
  smooth();
  background(0);
   noFill();
   strokeWeight(0.1);
  
  for (int posX=25; posX<width; posX=posX+50)
  {
  
   for (int posY=25; posY<height; posY=posY+50)
   {
    
  
  stroke(255);
  rotate(PI/255);
  translate(1, 0);
  scale(1);
ellipse(pmouseX,pmouseY,pmouseX,pmouseY);


stroke(random(0,255),random(0,255),random(0,255));
triangle(pmouseX,pmouseY,pmouseX,pmouseY,mouseX,mouseY);

}
 
}
  
}
