
// Wendy Chuyi Liu, Gold Fish, Mods 16/17
// http://besttoshow.webs.com/
PImage b;
//
int m = 150;
int a = 250;
int c = 250;
void setup()
{
  frameRate (20);
  int x = 30;
  size(600, 500);
  background(85, 187, 206);
  fill(225);
  noStroke();
  ellipse(300, 120, 300, 150-x);
  ellipse(220, 70, 85, 85-x);
  ellipse(290, 60, 85, 85-x);
  ellipse(360, 70, 80, 70-x);
  ellipse(420, 100, 90, 90-x);
  ellipse(410, 150, 80, 70-x);
  ellipse(350, 180, 80, 80-x);
  ellipse(275, 175, 90, 80-x);
  ellipse(200, 170, 80, 80-x);
  ellipse(150, 150, 80, 80-x);
  ellipse(160, 100, 90, 90-x);
  fill(255, 255, 0);
  stroke(255, 255, 0);
  ellipse (0, 0, 225, 225);
  fill(64, 209, 21);
  stroke(0, 113, 4);
  ellipse(500, 500, 1100, 400);
  b = loadImage("Angry bird.gif");
}
void draw()
{
  if (mousePressed == true)
  {

    int x = 30;

    background(85, 187, 206);
    fill(225);
    noStroke();
    ellipse(300, 120, 300, 150-x);
    ellipse(220, 70, 85, 85-x);
    ellipse(290, 60, 85, 85-x);
    ellipse(360, 70, 80, 70-x);
    ellipse(420, 100, 90, 90-x);
    ellipse(410, 150, 80, 70-x);
    ellipse(350, 180, 80, 80-x);
    ellipse(275, 175, 90, 80-x);
    ellipse(200, 170, 80, 80-x);
    ellipse(150, 150, 80, 80-x);
    ellipse(160, 100, 90, 90-x);
    fill(255, 255, 0);
    stroke(255, 255, 0);
    ellipse (0, 0, 225, 225);
    fill(64, 209, 21);
    stroke(0, 113, 4);
    ellipse(500, 500, 1100, 400);

    image(b, a,c, 75, 75);
    int direction = int(random(0, 4));
    if (direction == 0)
    {
      a = a + 20;
    }
    else if ( direction == 1 )
    {
      a = a - 20;
    }
    else if ( direction == 2 )
    {
      c = c + 20;
    }
    else
    {
      c = c - 20;
    }
    if ( a > 600 || a < 0)
    {
      a = 0;
    }
    if ( c > 500 || c < 0)
    {
      c = 0;
    }
  }
}
