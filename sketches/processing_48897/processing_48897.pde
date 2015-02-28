
void setup()
{
  size(500,500);
  background(255,255,255);
  smooth();
  strokeWeight(5);
  frameRate(5);
}

void draw()
{
  fill(random(255), random(255), random(255));
  ellipse(random(500),random(500),100,100);
  fill(255,255,255,100);
  rect(0,0,width,height);
}

void mousePressed()
{
  fill(random(255),random(255),random(255), 50);
}

void keyPressed()
{
  save("snapshot.png");
}               
