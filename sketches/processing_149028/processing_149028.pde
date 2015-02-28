

void setup()
{
  size(600, 600);
  background(255, 255, 255);
}


void draw()
{
  fill(255, 255, 255, 10);
  rectMode(CENTER);

  translate(width/2, height/2);
  rect(0, 0, width, height);

  rectMode(CENTER);
  rotate(mouseY);

  ellipse(0, 0, 500, 100);
  ellipse(0, 0, 100, 100);
}

