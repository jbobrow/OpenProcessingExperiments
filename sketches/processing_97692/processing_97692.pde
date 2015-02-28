
float x=0;
float y=0;

void setup()
{
  size(500,500);
  background(255);
  smooth();
  noStroke();
  frameRate(3);
}
void draw()
{
  for(x = 0; x < width; x+=10){
    for (y = 0; y < height; y+=10){
      float r= random(255);
      float b= random(255);
      float g= random(255);
      fill(r,b,g);
      rect(x,y,10,10);
    }
  }
}
