
// Jeffrey Chen CP1 Loops Assignment(4-5)
// URL: jeffmao.webs.com OR http://www.openprocessing.org/user/21148
 
int br=135;
int bg=206;
int bb=235;
int m=0;
int h=1;
int change=1;
void setup()
{
  smooth();
  size (400, 400);
}
 
void draw()
{
  frameRate(20);
  back();
  circle();
  hand();
  h();
}
void back()
{
  {
    background(br, bg, bb);
    br=br-change;
    bg=bg-change;
    bb=bb-change;
    if (h < 1)
    {
     change = -1;
    }
    if (h>210)
    {
      change = 1;
    }
    frameRate(60);
  }
}
 
void circle()
{
  stroke(100, 0, 0);
  strokeWeight(15);
  ellipse(200, 200, 300, 300);
  fill(0, 200, 200);
  textSize(30);
  text("12", 180, 100);
  text("1", 240, 110);
  text("2", 280, 150);
  text("3", 300, 210);
  text("4", 280, 270);
  text("5", 240, 310);
  text("6", 193, 320);
  text("7", 140, 310);
  text("8", 100, 270);
  text("9", 80, 210);
  text("10", 95, 155);
  text("11", 130, 110);
  fill(255);
}
void hand()
{
  translate(200, 200);
  stroke(0);
  strokeWeight(10);
  rotate(PI*m/105-PI/2);
  line(0, 0, 120, 0);
  m=m+14;
}
 
void h()
{
  rotate(-PI*m/105);
  stroke(0);
  strokeWeight(5);
  rotate(PI*h/105);
  line(0, 0, 60, 0);
  h=h+1;
  if(h>210)
  {
    h=0;
  }
}


