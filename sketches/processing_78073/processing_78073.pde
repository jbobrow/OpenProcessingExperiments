
void setup()
{
  size(200, 200);
  background (random(255),random(255),random(255));
}

void draw()
{
  fill(250, 100, 100);
  ellipse(width/2, height/2, 180, 180);
  fill(255);
  ellipse(50, 60, 30, 30);
  ellipse(150, 60, 30, 30);
  fill(random(255),random(255),random(255));
  ellipse(50, 60, 20, 20);
  ellipse(150, 60, 20,20);
  fill(100,0,0);
  noStroke();
  ellipse(width/2, height/2+50, 100, 70);
  fill(255,0,0);
  ellipse(width/2, height/2+80, 50, 70);
  println("PSYCHO!!!");
}
