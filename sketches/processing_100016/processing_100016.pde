
float a;
float b;
float diam;

void setup()
{
  size(200,200);
  background(125);
  
}

void draw(){  
  
  a = random(width);
  b = random(height);
  diam = random(20);
  println(radians(line(a,b,diam,diam)));
}
