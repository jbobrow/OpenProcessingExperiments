

int numofball = 65;

void setup()
{
  size(700, 700);
}
 
void draw()
{
 background(255);
 noStroke();
  for (int i=0; i<numofball; i++)
  {
    for (int j=0; j<numofball; j++)
    {
      fill(color(random(100,200), random(100,500), random(200,255),100));
      float x = float(i)/numofball * width;
      float y = float(j)/numofball * height;
      float scale =  float(height/2);
      float size = noise(frameCount*0.02)*20;
      ellipse(x, y, size, size);
     
    }
  }
  
}
