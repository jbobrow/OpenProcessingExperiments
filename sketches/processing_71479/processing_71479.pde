
//Bozhong H. User Input, CP1 Mods 14-15
float x=50;
float y=250;
float sword=50;
float hilt=250;
float rotation=6.2;
float a=475;
float b=250;
float c=475;
float d=250;
float clear=0;
float laserChange=15;
boolean isMoving=false;
void setup()
{
  size(600, 400);
  background(255);
  smooth();
}
void draw()
{
  background(255);
  stickman();
  laser();
}
void stickman()
{
  fill(0);
  stroke(0);
  ellipse(a, b, 45, 45);
  strokeWeight(8);
  line(a, b, a, b+75);
  line(a, b+25, a-30, b+75);
  line(a, b+25, a+30, b+75);
  line(a, b+75, a-30, b+125);
  line(a, b+75, a+30, b+125);
  stroke(255);
  strokeWeight(2);
  line(a-15, b-5, a-5, b-5);
  line(a+15, b-5, a+5, b-5);
  fill(0);
  stroke(0);
  ellipse(x, y, 45, 45);
  strokeWeight(8);
  line(x, y, x, y+75);
  line(x, y+25, x-30, y+75);
  line(x, y+25, x+30, y+75);
  line(x, y+75, x-30, y+125);
  line(x, y+75, x+30, y+125);
  stroke(255);
  strokeWeight(2);
  line(x-15, y-5, x-5, y-5);
  line(x+15, y-5, x+5, y-5);
  stroke(0);
  strokeWeight(10);
  translate(sword+30, hilt+75);
  rotate(PI/rotation);
  line(0, 0, 0, -75);
  strokeWeight(1);
  arc(-5, -25, 50, 225, 3*PI/2, 2*PI); 
  rotate(-PI/rotation);
  translate(-(sword+30), -(hilt+75));
  if (keyPressed==true && key=='w')
  {
    y=y-3;
    hilt=hilt-3;
  }
  if (keyPressed==true && key=='s')
  {
    y=y+3;
    hilt=hilt+3;
  }
  if (keyPressed==true && key=='a')
  {
    x=x-3;
    sword=sword-3;
  }
  if (keyPressed==true && key=='d')
  {
    x=x+3;
    sword=sword+3;
  }
  if (keyPressed==true && key=='h')
  {
    rotation=rotation+.5;
  }
  if (keyPressed==true && key=='j')
  {
    rotation=rotation-.5;
  }
  if (keyPressed==true && key=='5')
  {
    b=b-2;
    d=d-2;
  }
  if (keyPressed==true && key=='2')
  {
    b=b+2;
    d=d+2;
  }
  if (keyPressed==true && key=='3')
  {
    a=a+2;
    c=c+2;
  }
  if (keyPressed==true && key=='1')
  {
    a=a-2;
    c=c-2;
  }
}
void laser()
{
  if (isMoving==true)
  {
    stroke(255, 0, 0);
    strokeWeight(2);
    line(c-30, d-5, c-5, d-5);
    c=c-laserChange;
    if (c<0)
    {
      c=a;
      isMoving=false;
    }
  }
}
void keyPressed()
{
  if (key=='+')
  {
    isMoving=true;
  }
}
