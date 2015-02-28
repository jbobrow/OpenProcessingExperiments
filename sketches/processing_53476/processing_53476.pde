
PImage  A;

float angle=0.0;
float a = 0.0;
float s = 0.0;

void setup()
{
  size(1000,1000);
  noStroke();
  imageMode(CENTER);
  
}

void draw()
{
  background(255);
  

    
    
  a = a + 0.02;
  s = sin(a);
  
  
  angle += 0.07;
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  A =loadImage("A.png");
  image(A,0,0);
  
  println(s);
  
}


