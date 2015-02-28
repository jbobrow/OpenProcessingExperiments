
void setup()
{
  size(400, 600);
  background(40,173,50); 
  smooth();
}

void draw()
{
  fill(40,173,50, 100);
  rect(0, 0, width, height);

  textAlign(CENTER);
  textSize(36);
  fill(255, 0, 0);
  text("Merry\nChristmas!", mouseX, mouseY);

  image(loadImage("logo.png"), width/2-60, 0);
  image(loadImage("logo.png"), width/2-60, height-141);
}


