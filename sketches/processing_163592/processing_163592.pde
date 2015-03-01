
void setup()
{
  size (1200,600);
  frameRate(10);
}
void draw()
{
  background (40);
  stroke(#98EFFF,80);
  strokeWeight(2);
 
  
  for(int i=0; i<600; i++){
    float size = random(20,30);
    float x = random(width);
    float y = random(height);
    line(x,y,x,y+size);

  }
}
  
