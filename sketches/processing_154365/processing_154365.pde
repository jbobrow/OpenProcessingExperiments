
//agustey mongia
//copyright notice

float x;
float y;
float wd;
float ht;

void setup()
{
  size( 400, 400);
  x=width*.5;
  y=height*.5;
  wd=width*.99;
  ht=height*.99;
  rectMode(CENTER);
};

void draw()
{
  background(0);
  x=mouseX;
  y=mouseY;
  fill(0, 0, 100);
  rect(x, y, wd*.6, ht*.6);
  fill(255, 255, 255);
  ellipse(x, y, wd*.6, ht*.6);
  fill(0, 0, 150);
  ellipse(x, y, wd*.55, ht*.55);
  fill(255, 255, 255);
  ellipse(x, y, wd*.5, ht*.5);
  fill(0, 0, 200);
  ellipse(x, y, wd*.45, ht*.45);
  fill(255, 255, 255);
  ellipse(x, y, wd*.4, ht*.4);
  fill(0, 0, 255);
  ellipse(x, y, wd*.35, ht*.35);
  fill(255, 255, 255);
  ellipse(x, y, wd*.3, ht*.3);
  fill(100, 0, 60);
  triangle(x, y-60, x-47, y+35, x+47, y+35);
  fill(100, 100, 100);
  quad(x-20, y-22, x-10, y+35, x+15, y+35, x+20, y-22);
  fill(0, 0, 255);
  ellipse(x, y, wd*.05, ht*.05);
};


