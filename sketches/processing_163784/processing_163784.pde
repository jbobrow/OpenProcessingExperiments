
void setup()
{
  size(1000,1000);
  frameRate(10);
}

void draw()
{
  background(47,70,102);
  float clr1 = random(100); 
  stroke(222,235,255,clr1);
  strokeWeight(1);

  for(int i=0; i<100; i++){  
    float size = random(20,70);
    float x = random(width);
    float y = random(height);
    line(x,y,x,y+size);     
  }
  
}
