
void setup()
{
 size(200,200); 
}



void draw()
{
    
  if ((mouseX >20) && (mouseX < 60) && (mouseY >160) && (mouseY < 180))
     background(0);
  else 
     background(255);
    
  fill(255,230,0);
  rect(80,40,40,40);
  rect(80,90,40,70);
  fill(0,0,255); 
  ellipse(90,50,10,10);
  ellipse(110,50,10,10);
  triangle(100,60,90,70,110,70);
  fill(255,0,0);
  ellipse(100,110,10,10);
  ellipse(100,135,10,10);
  fill(255);
  rect(20,160,40,20);
}
