
/*DRAW DRAW
 */

float X;
float Y;
float x;
float y;
float G;
float V;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  V = G = 25;
}

void draw()
{
  fill(10, 0, 0);
  ellipse(mouseX, mouseY, X, X);

  if (mousePressed == true)
  {
    fill(600, 600, 600);
    ellipse(mouseX, mouseY, X, X);
  }
  X = X + random(-2, 2);
  x = x + random(-2, 2);
  G = G + random(-3, 3);
  V = V + random(-3, 3);
  if (key == 'z')
  {
    background(1);
    fill(2, 1, 1);
    rect(5, 5, 490, 490);
    fill(1000, 1000, 1000);
    text("Pause: Press X or C to continue Drawing!", 150, 250);
  }
  fill(1);
  rect(0, 450, 1000, 1000);
  fill(1000, 1000, 1000);
  //fill(random(250),random(250),random(250));
  text("Z=Pause, X=Reset, C=Reset Brush ", 10, 470);
  text("Click and Hold for white splots.", 10, 482);
  fill(100, 25, 90);
  text("By Kevin Nguyen xD", 390, 482);
  fill(1);
  rect(0, 0, 58, 58);
  fill(random(250), random(250), random(250));
  ellipse(G, V, 10, 10);

  if (G > 51)
  {
    G = 0;
  }
  if (G < -1)
  {
    G = 50;
  }
  if (V > 51)
  {
    V = 0;
  }
  if (V < -1)
  {
    V = 50;
  }
}
void keyPressed()
{
  if (key == 'c')
  {
    X = 0;
  }
  if (key == 'x')
  {
    background(1);
    fill(random(250), random(250), random(100));
    rect(5, 5, 490, 490);
  }
}




