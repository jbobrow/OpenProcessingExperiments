
float IntNoise( int x )
{
  x = (x<<13) ^ x;
  return ( 1.0 - ( (x * (x * x * 15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824.0);
}

void setup() {
  size(800, 600, P2D);
}

float t = 0;

void draw() {
  // Light bg
  // fill(20,100,170);
  // Dark bg
  fill(10,11,18);
  rect(0,0,width,height);
  
  t = t + 0.01;
  
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      float drawProbability = IntNoise(x*y);
      if (drawProbability >= 0.99) {
        float alphaNoise = noise(x,y,t);
        stroke(255,255,255,255*alphaNoise);
        point(x,y);
      }
    }
  }

}

