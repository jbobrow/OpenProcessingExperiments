
float minSize = 35;
float maxSize = 225;

float rotAmount;

void setup()
{
  noStroke();
  size(640, 480);
}

void draw()
{
  background(0);
  rotAmount += 0.005f;
  int min = 3;
  int max = 9;
  
  for (int i = max - 1; i >= min; i--)
  {
    fill(255);
    float interp = ((float)(i - min)) / (max - min - 1);
    float size = lerp(minSize, maxSize, interp);
    ellipse(width / 2, height / 2, size * 2, size  *2);
    
    
    DrawPoly(i, size, i % 2 == 1);
  }
}

public void DrawPoly(int nSides, float size, boolean flipRot)
{
  fill(0);
  beginShape();
  for (int i = 0; i < nSides; i++)
  {
    float theta = -PI / 2 + (2 * PI / nSides) * i;
    
    if (flipRot)
      theta -= rotAmount;
    else
      theta += rotAmount;
    float x = width / 2 + size * cos(theta);
    float y = height / 2 + size * sin(theta);
    
    vertex(x, y);
  }
  endShape(CLOSE);
}


