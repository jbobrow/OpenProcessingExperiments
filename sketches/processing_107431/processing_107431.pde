
void setup()
{
  size(500,500);
  background(255,255,255,0);
  frameRate(10);
}

void draw()
{
  translate(random(300), random(200)-400);
  randomRect();

  
}

void randomRect()
{
      noStroke();
      fill(random(255), random(255), random(255), random(50));
    rect(random(width+500)-500, random(height), random(1000), random(400));
  }
