
float a = 0.0;
float s = 0.0;

void setup() 
{
  size(500, 250);
}

void draw() 
{
  background(0, 0, 0);
  frameRate(15);
  
  a = a + 0.50;
  s = cos(a)*2;
  
  translate(width/2, height/2); 
  fill(0, 255, 200);
  noStroke();
  scale(s);
  ellipse(0, 0, 50, 50); 
  
  translate(75, 0);
  fill(220, 0, 220);
  noStroke();
  scale(s);
  ellipse(0, 0, 50, 50);       
}
