
int[] myArray = new int[100];
int proof = 1;
float x, y;

void setup()
{
  size(400, 400);
  background(255);
  frameRate(10);
  x = random(width);
  y = random(height);
}

void draw()
{
  for(int i = 0; i<100; i++)
  {
    stroke(random(255), random(255), random(0), random(50));
    line(random(width), random(height), x, y);
    proof++;
    if(proof > 100){
      x = random(width);
      y = random(height);
      proof = 0;
      background(255);
    }
  }
  
}

