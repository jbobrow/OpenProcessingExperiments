
// Steven G, Mod 14-15 CP1, User Input

int w = 0;
int changew=25;
void setup()
{
  size (550, 550);
  background(255);
  strokeWeight(25);
}

void draw()
{
  circle();
  rect();
}

void circle()
{
  if (mousePressed == true)
  {
    fill(random(256), random(256), random(256), 50);
    stroke(random(256), random(256), random(256), 50);
    ellipse(mouseX, mouseY, 20, 20);  
    ellipse(mouseX, mouseY, w, w);
    ellipse(mouseX, mouseY, w + 50, w + 50);
    ellipse(mouseX, mouseY, w + 100, w + 100);
    ellipse(mouseX, mouseY, w + 150, w + 150);
    ellipse(mouseX, mouseY, w + 200, w + 200);
    ellipse(mouseX, mouseY, w + 250, w + 250);
    ellipse(50, 50, 50, 50);
    ellipse(500, 500, 50, 50);
    ellipse(500, 50, 50, 50);
    ellipse(50, 500, 50, 50);
    w = w + changew;
  }

  if (w > 255)
  {
    changew = -25;
  }
  if (w < 0)
  {
    changew = 25;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    stroke(random(256));
    fill(random(256));
    rect(0, 0, 550, 550, random(1000));
  }
}

void rect()
{
  if (mousePressed == true)
  {
    fill(random(256), random(256), random(256),50);
    rect(0, 0, 550, 550);
  }
}


/**
 left click makes a colorful circle that follows the mouse, four mini circles near the corner and changes background color <br>
 spacebar makes random black and white rectangles with randomly changing edges
 */
