
void setup()
{
  size(400,300); 
  smooth();
}

void draw()
{
  background(#cbcefb);
  noFill();
  strokeWeight (10); 

  stroke (0,0,255); 
  ellipse (80,100,100,100);

  stroke (0,0,0); 
  ellipse (195,100,100,100);

  stroke (255,0,0);
  ellipse (mouseX, mouseY,100,100);
  
  stroke (255,255,0); 
  ellipse (138,160,100,100);

  stroke (0,255,0); 
  ellipse (253,160,100,100);

}

