
void setup()
{
  size(400,400);
  
}
void draw()
{
  float a,b;
  background(100);
  strokeWeight(5);
  noFill();
   
  stroke(0,0,255);
  ellipse(100,100,60,60);
 
  stroke(0,0,0);
  ellipse(180,100,60,60);
   
  stroke(255,0,0);
      
  ellipse (mouseX, mouseY,60,60);
 
  stroke(255,255,0);
  ellipse(140,130,60,60);
   
  stroke(0,255,0);
  ellipse(220,130,60,60);
   
}

