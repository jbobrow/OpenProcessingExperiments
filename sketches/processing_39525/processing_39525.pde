
/**
 *Repetition and Variation
 *By Fu Huang
 *Lightbuld
 *
 **/

LightBulds a, b, c, d, e, f, g;

void setup()
{
  size(600, 600);
  smooth();

  //from one to seven
  a = new LightBulds();
  a.x = 70;
  a.y = 63;
  a.w = 56;
  a.h = 90;
  a.xu = 70;
  a.yi = 120;
  a.wo = 20;
  a.hp = 15;
  a.xv = 55;
  a.yb = 100;
  a.wn = 30;
  a.hm = 15;
  a.howred = 249;
  a.howgreen = 252;
  a.howblue = 168;

  b = new LightBulds();
  b.x = 165;
  b.y = 85;
  b.w = 35;
  b.h = 50;
  b.xu = 165;
  b.yi = 120;
  b.wo = 20;
  b.hp = 15;
  b.xv = 150;
  b.yb = 100;
  b.wn = 30;
  b.hm = 15;
  b.howred = 249;
  b.howgreen = 255;
  b.howblue = 98;

  c = new LightBulds();
  c.x = 250;
  c.y = 63;
  c.w = 56;
  c.h = 90;
  c.xu = 250;
  c.yi = 120;
  c.wo = 20;
  c.hp = 15;
  c.xv = 235;
  c.yb = 100;
  c.wn = 30;
  c.hm = 15;
  c.howred = 249;
  c.howgreen = 255;
  c.howblue = 85;

  d = new LightBulds();
  d.x = 345;
  d.y = 85;
  d.w = 35;
  d.h = 50;
  d.xu = 345;
  d.yi = 120;
  d.wo = 20;
  d.hp = 15;
  d.xv = 330;
  d.yb = 100;
  d.wn = 30;
  d.hm = 15;
  d.howred = 246;
  d.howgreen = 252;
  d.howblue = 74;

  e = new LightBulds();
  e.x = 430;
  e.y = 63;
  e.w = 56;
  e.h = 90;
  e.xu = 430;
  e.yi = 120;
  e.wo = 20;
  e.hp = 15;
  e.xv = 415;
  e.yb = 100;
  e.wn = 30;
  e.hm = 15;
  e.howred = 245;
  e.howgreen = 252;
  e.howblue = 56;

  f = new LightBulds();
  f.x = 525;
  f.y = 85;
  f.w = 35;
  f.h = 50;
  f.xu = 525;
  f.yi = 120;
  f.wo = 20;
  f.hp = 15;
  f.xv = 510;
  f.yb = 100;
  f.wn = 30;
  f.hm = 15;
  f.howred = 242;
  f.howgreen = 250;
  f.howblue = 40;

  g= new LightBulds();
  g.x = 300;
  g.y = 388;
  g.w = 200;
  g.h = 300;
  g.xu = 300;
  g.yi = 570;
  g.wo = 60;
  g.hp = 45;
  g.xv = 255;
  g.yb = 530;
  g.wn = 90;
  g.hm = 30;
  g.howred = 238;
  g.howgreen = 247;
  g.howblue = 5;
}




void keyPressed()
{
  if (key == '1')
  {
    a.howred = random(255);
    a.howgreen = random(255);
    a.howblue = random(255);
  }
  if (key =='2')
  {
    b.howred = random(255);
    b.howgreen = random(255);
    b.howblue = random(255);
  }
  if (key == '3')
  {
    c.howred = random(255);
    c.howgreen = random(255);
    c.howblue = random(255);
  }
  if (key == '4')
  {
    d.howred = random(255);
    d.howgreen = random(255);
    d.howblue = random(255);
  }
  if (key == '5')
  {
    e.howred = random(255);
    e.howgreen = random(255);
    e.howblue = random(255);
  }
  if (key =='6')
  {
    f.howred = random(255);
    f.howgreen = random(255);
    f.howblue = random(255);
  }
  if (key =='7')
  {
    g.howred = random(255);
    g.howgreen = random(255);
    g.howblue = random(255);
  }
}
void draw()
{
  background (0);
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  g.show();

  String s = "Press 1-7 to change the color of different lightbulds. Click to change them all at once.";
  text(s, 25, 530, 200, 60);
  fill(219, 219, 217);

  if (mousePressed == true)
  {
    a.howred = random(255);
    a.howgreen = random(255);
    a.howblue = random(255);
    b.howred = random(255);
    b.howgreen = random(255);
    b.howblue = random(255);
    c.howred = random(255);
    c.howgreen = random(255);
    c.howblue = random(255);
    d.howred = random(255);
    d.howgreen = random(255);
    d.howblue = random(255);
    e.howred = random(255);
    e.howgreen = random(255);
    e.howblue = random(255);
    f.howred = random(255);
    f.howgreen = random(255);
    f.howblue = random(255);
    g.howred = random(255);
    g.howgreen = random(255);
    g.howblue = random(255);
  }
}

//void move()
{
  //xPosition = xPosition + random(-4, 4);
  //yPosition = yPosition + random(-3, 3);
}

class LightBulds
{
  float x, y; //location of the lightbuld itself
  float w, h; //size of the lightbuld itself
  float xu, yi, wo, hp; //circular of base
  float xv, yb, wn, hm; //rectangular part ofbase
  float howred, howgreen, howblue; //color of lightbuld
  float xPosition;
  float yPosition;

  void show()
  {
    fill(howred, howgreen, howblue);
    ellipse(x, y, w, h);
    //ellipse(xPosition, yPosition, w, h);
    fill(219, 219, 217);
    //base
    ellipse(xu, yi, wo, hp);
    rect(xv, yb, wn, hm);
  }
}


