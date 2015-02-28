
void setup()
{
  size(640, 600);
  background(102);
  smooth();
}

void draw() 
{
 if ( mousePressed )
 {
  circle(mouseX, mouseY, pmouseX, pmouseY);
}
else
{
  
 rectangle(mouseX, mouseY, pmouseX, pmouseY);
}
}


void circle(int x, int y, int a, int b) 
{
  float k = abs(x-a) + abs(y-b);
  stroke(k);
  fill(random(255));
  ellipse(x, y, k, k);
}
void rectangle(int x, int y, int a, int b) 
{
  float k = abs(x-a) + abs(y-b);
  stroke(k);
  fill(random(255));
  rect(x, y, k, k);
}

