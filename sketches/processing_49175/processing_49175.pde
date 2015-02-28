
void setup()
{
  size(400, 600);
  background(50, 76, 90, 30);
  smooth();
  frameRate(10);
}

void draw()
{
  //  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 50, 50);
  
}

void mousePressed()
{
  save("snapshot.png");
  background(50, 76, 90, 30);
}

void keyPressed()
{

  fill (random (250), random (255), random (255));
}


