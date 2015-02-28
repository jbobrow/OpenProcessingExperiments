
// bubbles 
// Behnood Eghbali Tue.Oct 29.2013 12:54am 
void setup()
{
  size(1000, 600);
  background(24,140,255);
  smooth();
}
void draw() 
{
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  
}
void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  fill(random(y),random(x), 100, random(mouseY));
  stroke(speed);
  ellipse(x, random(y), speed, speed);
}
