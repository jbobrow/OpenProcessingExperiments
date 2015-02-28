
int padding = 30;
boolean pressCounter = false;
float startY = padding;

void setup()
{
  size(600, 800);
  frameRate(2);
  background(255);
}
 
void draw()
{ 
  background(random(255), random(255), random(255));
  for (int i = 0; i < width; i++)
  {
  generate(padding, random(10), i);
  }
  fill(255);
  noStroke();
  rect(0,0, width, padding);
  rect(0,0, padding, height);
  rect(0, height-padding, width, padding);
  rect(width-padding, 0, padding, height);
}

void generate(int padding, float randomness, int index)
{

  float newY = random(height-(2*padding)-(random(15)*index));
  fill(random(255), random(255), random(255));
  noStroke();
  beginShape();
  vertex(width-padding, padding);
  vertex(padding, padding);
  vertex(padding, startY);
  for (int i = padding; i <width-(padding); i++)
  {
    newY = (newY - (randomness/2) + random(randomness));
    vertex(i, newY);
  }
  endShape();
}

