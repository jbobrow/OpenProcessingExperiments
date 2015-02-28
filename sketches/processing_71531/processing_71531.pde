
//Tammy L, CP1 Mods 4-5, User Input
/**
Hold 'c', left click the mouse, and drag the mouse for circles.<br>
Right click for a symmetrical pattern.<br>
Hold 's', left click the mouse, and drag the mouse for squares. <br>
Right click for a symmetrical pattern.<br>
Left click and drag for a line.<br>
Hold 'e' and drag the mouse for an eraser.
*/
int R = 255;
int changeR = -3;
int G = 0;
int changeG = 3;
int B = 100;
int changeB = 3;
void setup()
{
  size(500, 500);
  background(0);
  noFill();
  strokeWeight(2);
}

void draw()
{
}

void mouseDragged()
{
  if (mouseButton==LEFT)
  {
    if (keyPressed == true && key == 'c')
    {
      noFill();
      stroke(R, G, B, 150);
      R = R + changeR;
      G = G + changeG;
      B = B + changeB;
      if (R > 254)
      {
        changeR = -1;
      }
      if (R < 2)
      {
        changeR = 1;
      }
      if (G > 254)
      {
        changeG = -1;
      }
      if (G < 1)
      {
        changeG = 1;
      }
      if (B > 254)
      {
        changeB = -1;
      }
      if (B < 1)
      {
        changeB = 1;
      }
      ellipse(mouseX, mouseY, 20, 20);
    }

    else if (keyPressed == true && key == 's')
    {
      noFill();
      stroke(R, G, B, 150);
      R = R + changeR;
      G = G + changeG;
      B = B + changeB;
      if (R > 254)
      {
        changeR = -3;
      }
      if (R < 1)
      {
        changeR = 3;
      }
      if (G > 254)
      {
        changeG = -3;
      }
      if (G < 1)
      {
        changeG = 3;
      }
      if (B > 254)
      {
        changeB = -3;
      }
      if (B < 1)
      {
        changeB = 3;
      }
      rect(mouseX, mouseY, 20, 20);
    }
    else
    {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  if (keyPressed == true && key == 'e')
  {
    noStroke();
    fill(0);
    ellipse(mouseX, mouseY, 200, 200);
  }
  if (mouseButton==RIGHT)
  {
    if (keyPressed == true && key == 'c')
    {
      stroke(255, 255, 255, 100);
      ellipse(mouseX, mouseY, 10, 10);
      ellipse(500-mouseX, mouseY, 10, 10);
    }
    if (keyPressed == true && key == 's')
    {
      stroke(255, 255, 255, 100);
      rect(mouseX, mouseY, 10, 10);
      rect(500-mouseX, mouseY, 10, 10);
    }
  }
}
