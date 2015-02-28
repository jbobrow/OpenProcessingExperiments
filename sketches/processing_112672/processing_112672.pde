
float i = 0;
float timer = 0;

void setup() 
{
  size(400, 400); 
} 

void draw() 
{ 
  background(0); 
  i = i + 0.1;
  
  pushMatrix();
  translate(200,200); 
  smooth();
  fill(255, 3, 3);
  rotate(i);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  fill(0, 179, 227, 120);
  ellipse(200, 200, 300, 300);
  
  //I don't really understand how to use the timer thingy
  //So that's why the following does nothing. 
  if(timer <= 210)
  {
    i = i - 0.2;
  }
  
  else if(timer > 210)
  {
    i = i - 0.1;
  }
  if (timer > 100)
  {
  pushMatrix();
  translate(200,200); 
  rotate(i);
  fill(152, 81, 224);
  rect(-25, -25, 100, 100);
  popMatrix();
  }
} 


