
void setup()
{
  size(1000, 600);
  background(255, 255, 255);
  smooth();
  textAlign(CENTER);
  frameRate(50);
}

void draw()
{
  fill(255, 255, 255, 60);
  rect(0, 0, width, height);
  frameRate(60);
  fill(255, 100, 0);
  ellipse(mouseX, mouseY, 70, 70);

  fill(0, 0, 0);
  textSize(40);
  text("Score Points ", 300, 50);
  
  fill(255,255,255,0);
  ellipse(900,150, 150,0);
}


