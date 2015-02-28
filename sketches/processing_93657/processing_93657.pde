
int i = 1;

void setup()
{
  size(600, 600);
  smooth();
  frameRate(1);
}

void draw()
{
  background(0);

  translate(0, height/2);

  drawpattern(i, width);

  i++;
  if (i >= 7) i = 7;
}

void drawpattern(int level, float s)
{
  if (level > 1)
  {
    pushMatrix();

    drawpattern(level - 1, s / 2);

    translate(s, 0);
    rotate(-PI/1);
    drawpattern(level - 1, s / 2);


    translate(s, 0);
    rotate((PI/2));
    drawpattern(level - 1, s / 3);

    translate(s, 0);
    rotate(-PI/2);
    drawpattern(level - 1, s / 2);

    popMatrix();
  }
  else
  {
    noStroke();
    fill(random(20, 255), random(20, 255), random(20, 255), 100);
    ellipse(width/2, height/2, s, s);
    ellipse(width/4, height/4, s, s);
    //triangle(0, 0, width/2, height/2, s, s);
  }
}



