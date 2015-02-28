
float angle = 0.6;
void setup()
{
  size(700,400);
  background(0);
  smooth();
}
 
void draw()
{
  fill(0,5);
  rect (0,0,height*2,width*2);
  pushMatrix();

  translate(mouseX,mouseY);
  rotate(angle);
  fill(0,30);
 
  fill(229,35,35,40);
  stroke (255,30);
  rect(50,-50,30,mouseY);
  rect(mouseX,30,-50,50);
  
 
 
  angle+=0.1;
   
  popMatrix();
 
}

