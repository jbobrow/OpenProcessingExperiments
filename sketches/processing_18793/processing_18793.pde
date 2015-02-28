
float rectSize;

void setup() {
  background(255);
  size(600, 450);
  frameRate(10);
}

void draw() {
  for(int i = 0; i < 20; i++){
    
    for(int j = 0; j < 20; j++){
      rectSize = random(0, 100);
      rect(getX(i), getY(j), rectSize, rectSize);
    }
  }
}

float getX(int i)
{
  rectSize = random(0, 50);
  return i*rectSize;
}

float getY(int j)
{
  rectSize = random(0, 50);
  return j*rectSize;
}               
