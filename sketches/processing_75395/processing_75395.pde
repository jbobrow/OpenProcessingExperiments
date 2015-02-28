
int y = 0;

PImage img;
void setup()
{
  size(500, 764);
  img = loadImage("spongebob4.png");

  frameRate(5);
}
void draw()
{
  float z = pow(2,y);
  
  background(img);
  stroke (255, 255,255);
  strokeWeight(3);
  fill(255,255,255, 90);

  float x = 0;
  int i = 0;


 
  
  while (i<=z)
  {
    
    ellipse (random(501), random(764), x, x);
    x= (random(10, 40));
    i=i+1;
  


  }
  y=y+1;
  if (z>600)
  {
    y=0;
  }
  println(z);
  fill(0);
  textSize(40);
  text(z,50,75);
}


