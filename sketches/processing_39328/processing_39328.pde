
// click screen to change noise pattern
float z = 0;
float zOffset = 0.004;
float zInc = zOffset;
float clip = 0.02;
float cl = 1 - clip;
float ch = 1 + clip;
int gridSize = 14;
float s60 = sin(60.0 * TWO_PI/ 360.0);
float c60 = cos(60.0 * TWO_PI/ 360.0);
void setup()
{
  size(600, 400);
  colorMode(HSB, 1, 1, 1, 1);
  frameRate(20);
}

void draw()
{
  background(0);
  noiseDetail(4, 0.7);
  noStroke();
  z += zInc;
  int odd = 0;
  int widthAdjusted = (int)((float)width / s60);  // needed bacause the translate shifts by s60 not 1
  for (int i = 0; i < widthAdjusted; i += gridSize)
  {
    float fii = (float)i / width;
    for (int j = 0 ; j < height; j += gridSize)
    {
      float fjj = (float)j / height;
      float b = max(0, -1 + noise(fii, fjj, z)*3);
      if (b > cl && b < ch)
      {
        fill(color(0.428, b, b));;
      }
      else if (b > 1)
      {
        b = 3 - b * 2;
        fill(color(.285, b, b)); 
      }
      else
      {
        fill(color(.714, b, b)); 
      }
      pushMatrix();
      translate(i * s60, (j - gridSize / 2 * odd) );
      hexagon(gridSize/2);
      popMatrix();
    }
    if (odd == 0) odd = 1; 
    else odd = 0;
  }
}
void mouseClicked() {
  noiseSeed(frameCount);
}

void hexagon(float hScale)
{
  beginShape();
  vertex(0, hScale);
  vertex(hScale * c60, hScale * (1 - s60));
  vertex(hScale * (1 + c60), hScale * (1 - s60));
  vertex(hScale * (1 + 2 * c60), hScale);
  vertex(hScale * (1 + c60), hScale * (1 + s60));
  vertex(hScale * c60, hScale * (1 + s60));
  vertex(0, hScale);
  endShape(CLOSE);
}


