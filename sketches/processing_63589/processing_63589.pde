

int circSize;
int rValue, bValue, gValue;
void setup()
{
  size(500,500);
  circSize = 0;
  rValue = 0;
  bValue = 0;
  gValue = 0;
  strokeWeight(1);

}


void draw()
{
  fill(rValue,gValue,bValue);
  ellipse(250,250,451-circSize,451-circSize);
  circSize = (circSize + 3) % 450;  // confines circSize to values below 450
  rValue =  (int) (rValue + random(50)) % 256;  // rValue is less than 256
  gValue =  (int) (gValue + random(50)) % 256;
  bValue =  (int) (bValue + random(50)) % 256;
  
}

