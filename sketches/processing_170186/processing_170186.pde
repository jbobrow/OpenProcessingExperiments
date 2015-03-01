
float noiseScale=0.02;
int k = 0;
void setup()
{
  size(600, 600);
}

void draw() 
{
  background(0);
  for (int i = 0; i<5; i++)
  {
    stroke(255);
    strokeWeight(5);
    float t = 0;
    float tDelta = radians(1);
    float w = map(mouseX, 0, width, 0.1, 10);

    for (int j = 0; j<width; j++)
    {
      float x = random(0, height);
      float y = height/2 - 100*sin(w*t);
      point(x, y);
      t+=tDelta;
    }
  }
  cut();
}

void cut()
{  
  for (int i=0; i<width/2-k; i++) 
  {
    float noiseVal = noise((mouseX+i)*noiseScale, mouseY*noiseScale);
    stroke(noiseVal*255, 0, 0);
    line(i, mouseY+noiseVal*80, i, 0);
  }

  for (int j=width; j>width/2+k; j--) 
  {
    float noiseVal = noise((mouseX+j)*noiseScale, mouseY*noiseScale);
    stroke(noiseVal*255, 0, 0);
    line(j, mouseY+noiseVal*80, j, 0);
  }
  if (mouseY>=height-50) k++;
  else if (mouseY<=50) k--;
}
