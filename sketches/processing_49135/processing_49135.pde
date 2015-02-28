
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(15);
  strokeWeight(10);
}

void draw()
{
  // background(255,255,255);
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  fill(0, 0, 255);
  if (mouseY > height/2)
  {
    fill(0, 0, 255,100 );
  }

  ellipse(mouseX, mouseY, 50, 50);
}
void mousePressed()
{
  fill(random(255), random(255), random(255));
}


void keyPressed()
{
  save("snapshot.png");
  background(255, 255, 255);
}


