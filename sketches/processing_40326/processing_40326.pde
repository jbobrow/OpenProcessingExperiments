
/*
Daniel Li
8-bit animation attempt "Falling Poop"
*/

cloud a, b, c, d;
float bgsize=20;
int brown = color(72, 36, 0);
float flyX, flyY;
float flyXDirection = 1;
float flyYDirection = 1;
float flyXspd = 3;
float flyYspd = 2;

void setup()
{
  size (750, 750);
  smooth();

  a = new cloud();
  a.x = 50;
  a.y = 500;

  b = new cloud();
  b.x = 700;
  b.y = 500;

  c = new cloud();
  c.x = 500;
  c.y = 1000;

  d = new cloud();
  d.x = 350;
  d.y = 750;
}

void draw()
{
  //background(129,184,255);
  //fill(129,184,255,75);
  //rect(0,0,750,750);
  for (float x = 0; x<width;x+=bgsize)
  {
    for (float y = 0; y<height;y+=bgsize)
    {
      noStroke();
      //fill(random(90, 103), random(90, 103), random(90, 103));
      fill(random(100, 130), random(150, 190), random(245, 255));
      rect(x, y, bgsize, bgsize);
    }
  }
  a.show();
  a.move();
  a.repeat();
  b.show();
  b.move();
  b.repeat();
  c.show();
  c.move();
  c.repeat();
  d.show();
  d.move();
  d.repeat();
  poop();
  for (int i = 0; i<5;i++)
  {
    fill(0);
    rect(flyX, flyY, 7, 7);
    flyX = random(100, 600);
    flyY = random(150, 600);
  }
}

void poop()
{
  noStroke();
  fill(brown);
  ellipse(250, 425, 150, 100);
  ellipse(350, 425, 175, 100);
  ellipse(450, 425, 150, 100);
  stroke(0, random(25, 100));
  strokeWeight(3);
  line(250, 230, 250, 350);
  line(300, 250, 300, 350);
  line(350, 200, 350, 350);
  line(400, 250, 400, 350);
  line(450, 210, 450, 350);
  for (int i = 212; i < 502; i+=bgsize)
  {
    for (int j = 395; j < 475; j+=bgsize)
    {
      noStroke();
      fill(random(50, 100), random(10, 40), 0);
      ellipse(i, j, bgsize, bgsize);
    }
  }
}

class cloud
{
  float x, y;

  void show()
  {
    fill(255);
    noStroke();
    rect(x, y-25, 125, 125);
    rect(x+75, y-75, 150, 175);
    rect(x+175, y-25, 125, 125);
  }
  void move()
  {
    y -= 10;
  }
  void repeat()
  {
    if (y < -200)
    {
      y = 950;
      x = random(0, 700);
    }
  }
}


