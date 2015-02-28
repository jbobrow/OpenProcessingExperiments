

float counter = 0;
void setup()
{
  size(500,500);
  
}
void draw()
{
  background(234,19,19);
  translate(width/2, height/2);
  pushMatrix();
  translate(0,sin(counter)*150);
  fill(247,133,10);
  ellipse(0,0,50,50);
  counter -= 0.05;
  popMatrix();

  
  pushMatrix();
  translate(0,cos(counter)*150);
  fill(0);
  ellipse(50,50,50,50);
  counter -=0.1;
  popMatrix();

 
  pushMatrix();
  translate(sin(counter)*260,0);
  fill(137,133,130);
  ellipse(0,0,50,50);
  
  counter -=0.1;
   popMatrix();
}
  
