
void setup()
{
  size(600,600);
}

void draw()
{
}

void keyPressed()
{
  background(random(64), random(64), random(255-64)+64);
  fill(44);
  fill(random(255),random(255),random(255));
  rect(0,200, 600,200);
  rect(200,0, 200,600);
  fill(0,0,random(125)+125);
  rect(200,200, 200,200); 
}
