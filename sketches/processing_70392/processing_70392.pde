
//Shela H. Functions and Animations. CP1 mods 16-17

int diameter=10;
float xcircle, ycircle;
float xcircle2,ycircle2;
float xcircle3,ycircle3;

float xspeed = 20;
float yspeed = 10;

float xspeed2 = 15;
float yspeed2 = 15;

float xspeed3 = 15;
float yspeed3 = 30;

int xdirection=1;
int ydirection=1;

int xdirection2=1;
int ydirection2=2;

int xdirection3=3;
int ydirection3=2;

void setup()
{
  size(500,500);
  noFill();
  smooth();
  frameRate(20);
  xcircle=500/2;
  ycircle=500/2;
  xcircle2=500/2;
  ycircle2=500/2;
  xcircle3=500/2;
  ycircle3=500/2;
  
//background
float r =20;
float g =25;
float b =142;
int x=0;
while(x<500)
{
  stroke(r,g,b);
  line(x,0,x,500);
  x=x+1;
  r=r+(36-20)/500.0;
  g=g+(180-25)/500.0;
  b=b+(109-142)/500.0;
}
}

//background circle
void draw ()
{
    float r =20;
float g =25;
float b =142;
int x=0;
while(x<500)
{
  stroke(r,g,b);
  line(x,0,x,500);
  x=x+1;
  r=r+(36-20)/500.0;
  g=g+(180-25)/500.0;
  b=b+(109-142)/500.0;
}
  fill(0,0,0,20);
  noStroke();
  ellipse(250,250,diameter,diameter);
  diameter = diameter + 15;
  if(diameter>500)
  {
    diameter=-10;
  }
  
  //circle rates 
  xcircle=xcircle+( xspeed * xdirection);
  ycircle=ycircle+(yspeed * ydirection);
  xcircle2=xcircle2+(xspeed2 * xdirection2);
  ycircle2=ycircle2+(yspeed2 * ydirection2);
  xcircle3=xcircle3+(xspeed3 * xdirection3);
  ycircle3=ycircle3+(yspeed3 * ydirection3);
  
  //orange circle
   if(xcircle>500)
  {
    xdirection*=-1;
  }
    if(ycircle>500)
  {
    ydirection*=-1;
  }
   if(xcircle<0)
  {
    xdirection*=-1;
  }
    if(ycircle<0)
  {
    ydirection*=-1;
  }
  
//pink circle  
  if(xcircle2>500)
  {
    xdirection2*=-1;
  }
    if(ycircle2>500)
  {
    ydirection2*=-1;
  }
   if(xcircle2<0)
  {
    xdirection2*=-1;
  }
    if(ycircle2<0)
  {
    ydirection2*=-1;
  }
  
  //red circle
    if(xcircle3>500)
  {
    xdirection3*=-1;
  }
    if(ycircle3>500)
  {
    ydirection3*=-1;
  }
   if(xcircle3<0)
  {
    xdirection3*=-1;
  }
    if(ycircle3<0)
  {
    ydirection3*=-1;
  }

  fill(245,126,47); 
  ellipse(xcircle,ycircle,80,80);
  fill(227,92,164);
  ellipse(xcircle2,ycircle2,50,50);
  fill(240,22,62);
   ellipse(xcircle3,ycircle3,60,60);
  
}
