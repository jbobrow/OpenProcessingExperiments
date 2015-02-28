
//Benjamin Z, Ticklish Penguin, CP 1 mods 16-17

PImage c;
PImage V;
float f=0;
float x=300;
float y=420;
float m=0;
float d=random(-2, 2);

void setup()
{
  size(600, 600);
  frameRate(40);
  noStroke();
  V =loadImage("http://www.jeffpearce.com/parkallen/111-Street-Crossing.jpg");

  c = loadImage("http://i.imgur.com/Vz315.png");
}


void draw()
{
  cue();
  rain();
  clouds();
}

void cue()
{  
  image(V, f, f, 600, 600);
  image(c, x, y-100, 200, 200);
  {
    x=x+random(-6, 0);
    y=y+random(-1, 1);
  }
  if (x<-180)
  {
    x=600-x+random(-6, 0);
  }
  if (y<370)
  {
    y=y+random(1);
  }
  if (Y>450)
  {
    y=y+random(-1, 0);
  }
}

void clouds()
{
  fill(255);
  ellipse(50 + random(-2, 2), 100, 120, 50);
  ellipse(65+ random(-2, 2), 80, 50, 50);
  ellipse(32+random(-2, 2), 75, 30, 30);
  ellipse(25+random(-2, 2), 120, 50, 30);
  ellipse(80+random(-2, 2), 120, 30, 15);

  ellipse(30 + random(-2, 2), 100, 120, 50);
  ellipse(45+ random(-2, 2), 80, 50, 50);
  ellipse(12+random(-2, 2), 75, 30, 30);
  ellipse(5+random(-2, 2), 120, 50, 30);
  ellipse(60+random(-2, 2), 120, 30, 15);

  ellipse(90 + random(-2, 2), 100, 120, 50);
  ellipse(105+ random(-2, 2), 80, 50, 50);
  ellipse(72+random(-2, 2), 75, 30, 30);
  ellipse(65+random(-2, 2), 120, 50, 30);
  ellipse(120+random(-2, 2), 120, 30, 15);

  ellipse(250 + random(-2, 2), 150, 120, 50);
  ellipse(265+ random(-2, 2), 130, 50, 50);
  ellipse(232+random(-2, 2), 125, 30, 30);
  ellipse(225+random(-2, 2), 170, 50, 30);
  ellipse(280+random(-2, 2), 170, 30, 15);

  ellipse(450 + random(-2, 2), 70, 120, 50);
  ellipse(465+ random(-2, 2), 50, 50, 50);
  ellipse(432+random(-2, 2), 45, 30, 30);
  ellipse(425+random(-2, 2), 90, 50, 30);
  ellipse(480+random(-2, 2), 90, 30, 15);

  ellipse(150 + random(-2, 2), 100, 120, 50);
  ellipse(165+ random(-2, 2), 80, 50, 50);
  ellipse(132+random(-2, 2), 75, 30, 30);
  ellipse(125+random(-2, 2), 120, 50, 30);
  ellipse(180+random(-2, 2), 120, 30, 15);

}

void rain()
{ 
 frameRate(100);
  fill(12, 54, 200);
  ellipse(50+random(-2,2), 80+m, 6, 10);
  ellipse(100+random(-2,2), 40+m, 6, 10);
  ellipse(220+random(-2,2), 120+m, 6, 10);
  ellipse(240+random(-2,2), 70+m, 6, 10);
  ellipse(450+random(-2,2), 65+m, 6, 10);
  ellipse(460+random(-2,2), 110+m, 6, 10);
  ellipse(260+random(-2,2), 100+m, 0, 10);
  ellipse(500+random(-2,2), 91+m, 6, 10);
  ellipse(50+random(-2,2), -10+m, 6, 10);
  ellipse(150+random(-2,2), -100+m, 4, 10);
  ellipse(50+random(-2,2), -50+m, 5, 10);
  ellipse(100+random(-2,2), -20+m, 3, 10);
  ellipse(230+random(-2,2), 0+m, 1, 10);
  ellipse(470+random(-2,2), 50+m, 5, 10);
  ellipse(220+random(-2,2), -10+m, 4, 10);
  m=m+5;
  if (m>800)
  {
    m=100;
  }}
