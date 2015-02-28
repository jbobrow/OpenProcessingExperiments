
float a = 0.1;
float s = 0.0;

void setup() 
{
  size(400, 400);
}

void draw() 
{
  background(102);
  
  a = a + 0.2;
  s = cos(a)*1.5;
  
  translate(width/2, height/2);
  scale(s); 
  fill(200, 10, s);
  ellipse(0, 0, 50, 50); 
  
  translate(0, 100);
  fill(10, 220, 20);
  scale(s);
  ellipse(0, 0, 50, 50);   
  
  translate (0, 100);
  scale (2);
  fill (245, 250, 40);
  ellipse (0, 0, 50, 50);
}

