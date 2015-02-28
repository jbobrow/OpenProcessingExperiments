

/** Seuss - jnyhoff <br />
Move mouse over sketch. */
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(30);
  
}

void draw()
{
  strokeWeight(4);
  fill( random(255), random(255), random(255) );
  ellipse(mouseX, mouseY, mouseX, mouseY);
}



