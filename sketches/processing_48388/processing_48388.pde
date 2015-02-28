
/** Julia Toren <p>
Let It Snow! <p>
Click to reset the drawing
*/

void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(10);
}

void draw()
{
  fill(255, 255, 255);
  rect(0, 450, 400, 200);

  fill(random(100, 255), random(50, 255), random(0, 255));
  textAlign(CENTER);
  textSize(36);
  text("Let It \nSnow", 200, 100);

  fill(255, 255, 255, random(150));
  ellipse(random(400), random(600), 5, 5);
}
void mousePressed()
{
  background(0, 0, 0);
}


