
void setup()
{
  size(500,500);
  
}
void draw()
{
  background(0);
  
  stroke(255);
  fill(0,255,60);
  rect(10,10,480,480);
  noFill();
  line(10,240,490,240);
  ellipse(250,240,100,100);
  rect(150,10,200,100);
  rect(150,390,200,100);
  fill(255,100,0);
  noCursor();
  ellipse(mouseX,mouseY,30,30); 
  
}
  
