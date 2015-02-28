
float step = 0;
float step1 = 0;
float step2 = 0;

void setup()
{
  size(500,500);
  colorMode(HSB, 360,100,100);
}
void draw ()
{
  background(0);
  translate(width/2, height/2);
  float b= map(sin(step), -1,1,50,100);
  
  pushMatrix();
  translate(cos(step)*100, sin(step)*100); 
  fill(0,100,b);
  noStroke();
  ellipse(0, 0, cos(step)*300, cos(step)*300);
  popMatrix();
  
  pushMatrix();
  //translate(cos(step)*50, sin(step)*50); 
  fill(20,100,100);
  noStroke();
  ellipse(0, 0, cos(step2)*200, cos(step2)*200);
  popMatrix();
  
  step2 +=0.02;
  
  pushMatrix();
  translate(cos(step)*50, sin(step)*50); 
  fill(50,b+5,100);
  noStroke();
  ellipse(20, 20, cos(step)*150, cos(step)*150);
  popMatrix();
  
  step += 0.05;
  
  pushMatrix();
  //translate(sin(step)*50, sin(step)*50); 
  fill(220,100,b);
  noStroke();
  ellipse(20, 20, 20, 20);
  popMatrix();
 
 step1+=0.20;
  
}
