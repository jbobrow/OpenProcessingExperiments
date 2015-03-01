
PImage img;

void setup()
{
  size(1200,1000);
  frameRate(100);
  smooth();
  img = loadImage("image.jpg");
}

void draw()
{
  background(50);
  image(img,0,0);
  
 
  for(int i=0; i<1000; i+=3)
  {  
    float x = random(width);
    float y = random(height);
    float size = random(50,30);
    line(x,y,x,y+size);
  }
}


