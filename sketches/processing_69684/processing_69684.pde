
//Robert Wohlforth rwohlfor
//Homework 3 -- Ripples
//Copyright Pittsburgh 2012

//Click to create your own ripple!

float x = random (0,400);
float y  = random (0,400);
float diam;
color col = color(0,255,random(180,255));
color col2 = color(0,255,random(180,255));
color col3 = color(0,255,random(180,255));
color col4 = color(0,255,random(180,255));
color col5 = color(0,255,random(180,255));
color col6 = color(0,255,random(180,255));
color col7 = color(0,255,random(180,255));
color col8 = color(0,255,random(180,255));
color col9 = color(0,255,random(180,255));
color col10 = color(0,255,random(180,255));

void setup()
{
  size (400,400);
  background (0,255,random(180,255));
}
void draw()
{
  fill(col);
  ellipse (x,y,diam,diam);
  fill(col2);
  ellipse (x,y,diam*.9,diam*.9);
  fill(col3);
  ellipse (x,y,diam*.8,diam*.8);
  fill(col4);
  ellipse (x,y,diam*.7,diam*.7);
  fill(col5);
  ellipse (x,y,diam*.6,diam*.6);
  fill(col6);
  ellipse (x,y,diam*.5,diam*.5);
  fill(col7);
  ellipse (x,y,diam*.4,diam*.4);
  fill(col8);
  ellipse (x,y,diam*.3,diam*.3);
  fill(col9);
  ellipse (x,y,diam*.2,diam*.2);
  fill(col10);
  ellipse (x,y,diam*.1,diam*.1);
diam = diam + 1;
if (diam > 1000)
{
  background (col);
  diam = 0;
  x= random (0, 400);
  y= random (0, 400);
  col = color(0,255,random(180,255));
  col2 = color(0,255,random(180,255));
col3 = color(0,255,random(180,255));
col4 = color(0,255,random(180,255));
col5 = color(0,255,random(180,255));
col6 = color(0,255,random(180,255));
col7 = color(0,255,random(180,255));
col8 = color(0,255,random(180,255));
col9 = color(0,255,random(180,255));
col10 = color(0,255,random(180,255));
}
}

void mouseClicked()
{
  background (col);
  diam = 0;
  x= mouseX;
  y= mouseY;
  col = color(0,255,random(180,255));
  col2 = color(0,255,random(180,255));
col3 = color(0,255,random(180,255));
col4 = color(0,255,random(180,255));
col5 = color(0,255,random(180,255));
col6 = color(0,255,random(180,255));
col7 = color(0,255,random(180,255));
col8 = color(0,255,random(180,255));
col9 = color(0,255,random(180,255));
col10 = color(0,255,random(180,255));
}

