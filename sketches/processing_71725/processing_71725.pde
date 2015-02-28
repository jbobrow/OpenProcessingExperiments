
//Jimmy C, CP1, Block 6

int h=0;
int hh=2;
int w=20;
int ww=2;
int www=2;
int c=0;
int o=10;
int s=0;

void setup()
{
size (700,500);
rectMode(CENTER);
frameRate(900);
}

void draw()
{
  rectangle();
  ball();
  score();
}

void rectangle()
{
  fill(255,255,255);
  rect(250,250,500,500);
  fill(0);
  rect(mouseX,450,60,10);
  
}

void ball()
{
  fill(0,0,c);
  
  ellipse(w,h,10,10);
  h=h+hh;
  w=w+ww;
  if (w>493)
  ww=-2;
  if (w<7)
  ww=2;
  
  if ((h == 450) && (mouseX - 30 <= w) && (mouseX -10 >= w))
  hh=-2;
  if ((h == 450) && (mouseX - 30 <= w) && (mouseX -10 >= w))
  ww=-www-2;
  
  if ((h == 450) && (mouseX - 9 <= w) && (mouseX +10 >= w))
  hh=-2;
  
  if ((h == 450) && (mouseX +11 <= w) && (mouseX +30 >= w))
  hh=-2;
  if ((h == 450) && (mouseX +11 <= w) && (mouseX +30 >= w))
  ww=www+1;
  
  if (h==0)
  hh=2;
  
  if (keyPressed== true && key=='r')
  h=0;
  if (keyPressed== true && key=='r')
  hh=1;
  if (keyPressed== true && key=='r')
  c=0;
  
  if (h==450)
  c=c+50;
}

void score()
{
  fill(0);
  textSize(30);
  text("SCORE:",550,100);
  textSize(50);
  text(s,587,200);
  fill(255,255,255);
  if (h==450)
  rect(600,250,200,500);
  if (h==450)
  rect(600,450,200,10);
  if (h==450)
  s=s+1;
  if (keyPressed== true && key=='r')
  rect(600,250,200,500);
  if (keyPressed== true && key=='r')
  s=0;
  if (h>500)
  fill(255,0,0);
  if (h>500)
  textSize(20);
  if (h>500)
  text("GAME OVER",537,300);
  if (h>500)
  textSize(18);
  if (h>500)
  text("Press R to Try Again",520,350);
}
