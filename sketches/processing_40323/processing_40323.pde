
/*
 *Massive Scale
 *by Priscilla Yu
 *Move the mouse around and click.
 */

int f1, f2, f3;
int c1, c2, c3;
int color1, color2;

void setup()
{
  size (800, 325); 
  smooth();
  f1=f2=f3=255;
  c1=c2=c3=255;
  color1 = #FF0000;
  color2 = #FFFFFF;
}

void draw()
{
  noStroke();
  fill(color1);
  for (int y=0; y < 325; y = y + 50)
  {
    rect  (0, y, 800, 25);
  }

  noStroke();
  fill(color2);
  for (int y=25; y < 325; y = y + 50)
  {
    rect  (0, y, 800, 25);
  }

  noStroke();
  fill(0, 0, 255);
  rect (0, 0, 300, 175);

  stroke(f1, f2, f3);
  for (int starY = 7; starY < 175; starY = starY+35)
  {
    for (int starX = 25; starX < 300; starX = starX + 50)
    {
      fill (f1, f2, f3);
      beginShape();
      vertex(starX, starY);
      vertex(starX + 24/12, starY + 70/12);
      vertex(starX + 94/12, starY + 70/12);
      vertex(starX + 40/12, starY + 115/12);
      vertex(starX + 64/12, starY + 181/12);
      vertex(starX, starY + 142/12);
      vertex(starX - 64/12, starY + 181/12);
      vertex(starX - 40/12, starY + 115/12);
      vertex(starX - 94/12, starY + 70/12);
      vertex(starX - 24/12, starY + 70/12);
      endShape();
    }
  }

  stroke(c1, c2, c3);
  for (int starY = 21; starY < 150; starY = starY+35)
  {
    for (int starX = 50; starX < 300; starX = starX + 50)
    {
      fill (c1, c2, c3);
      beginShape();
      vertex(starX, starY);
      vertex(starX + 24/12, starY + 70/12);
      vertex(starX + 94/12, starY + 70/12);
      vertex(starX + 40/12, starY + 115/12);
      vertex(starX + 64/12, starY + 181/12);
      vertex(starX, starY + 142/12);
      vertex(starX - 64/12, starY + 181/12);
      vertex(starX - 40/12, starY + 115/12);
      vertex(starX - 94/12, starY + 70/12);
      vertex(starX - 24/12, starY + 70/12);
      endShape();
    }
  }

  if (mousePressed)
  {
    color1 = #FFFFFF;
    color2 = #FF0000;
  }
  else 
  {
    color1 = #FF0000;
    color2 = #FFFFFF;
  }


  noStroke();
  fill(255, 217, 0, 95);
  ellipse(mouseX, mouseY, 50, 50);

  fill(0);
  ellipse(mouseX-10, mouseY-5, 10, 10);
  ellipse(mouseX+10, mouseY-5, 10, 10);

  stroke(0);
  noFill();
  arc(mouseX, mouseY+5, 25, 25, radians(0), radians(180));
}

void mouseMoved()
{
  if (mouseX > width/2)
  {
    f1 = 0;
    f2 = 0;
    f3 = 255;
  }
  else 
  {
    f1=f2=f3=255;
  }

  if (mouseY > height/2)
  {
    c1 = 0;
    c2 = 0;
    c3 = 255;
  }
  else
  {
    c1=c2=c3=255;
  }
}


