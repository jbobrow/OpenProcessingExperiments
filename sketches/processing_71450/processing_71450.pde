
import processing.opengl.*;

//Sarah Anderson, seanders
//HW6
//Copyright Sarah Anderson 2012 at CMU all rights reserved
//press any key to change the sizes, speeds and locations to random

float x,y,di,xSpeed,ySpeed,x2,y2,di2,x2Speed, y2Speed;
color col1, col2, col3;

void setup()
{
size(400,400,OPENGL);
background(0);
smooth();
x=0;
y=0;
di=50;
x2=0;
y2=0;
di2=100;
xSpeed=2;
ySpeed=3;
x2Speed=3;
y2Speed=2;
col1=color(random(255),random(255),random(255));
col2=color(random(255),random(255),random(255));
col3=color(random(255),random(255),random(255));

  
}

void draw()
{
createWindow();
diamond(x2,y2,di2,col1, col2, col3);
bounceDiamond();
initials(x,y,di,col1,col2,col3);
wrapInitials(); 
  
}

void createWindow()
{
fill(0,50);
noStroke();
rect(0,0,width, height);
}

void bounceDiamond() //code adapted from class code 6
{
x2=x2+x2Speed;
y2=y2+y2Speed;
strokeWeight(2);
stroke(col1);
line(0,0,x2,y2);
line(0,400,x2,y2);
stroke(col3);
line(400,0,x2,y2);
line(400,400,x2,y2);
  if (x2>width)
  {
  x2Speed=-x2Speed; 
  }
  else if (x2<0)
  {
  x2Speed=-x2Speed;  
  }
  
  if (y2>height)
  {
   y2Speed= -y2Speed; 
  }
  else if (y2<0)
  {
   y2Speed=-y2Speed; 
  }
}

void diamond(float x2, float y2, float di2,
  color col1,color col2, color col3)
{
noStroke();
fill(255);
beginShape();
fill(col1);
vertex(x2-(di2*0.2), y2-(di2*0));
fill(col2);
vertex(x2-(di2*0), y2-(di2*0.2));
fill(col3);
vertex(x2+(di2*0.2), y2-(di2*0));
fill(col2);
vertex(x2-(di2*0), y2+(di2*0.4));
endShape(CLOSE);
}



void initials(float x, float y, float di, 
  color col1,color col2,color col3)
{
noFill();
strokeWeight(4);
 // letter S
stroke(col1);
beginShape();
  curveVertex(x-(di*0.05), y-(di*0.55)); //control point
  curveVertex(x-(di*0.1), y-(di*0.49));
  curveVertex(x-(di*0.2), y-(di*0.45));
  curveVertex(x-(di*0.3), y-(di*0.4));
  curveVertex(x-(di*0.4), y-(di*0.3));
  curveVertex(x-(di*0.35), y-(di*0.15));
  curveVertex(x-(di*0.15), y-(di*0.05));
  curveVertex(x-(di*0.1), y+(di*0.05));
  curveVertex(x-(di*0.05), y+(di*0.25));
  curveVertex(x-(di*0.1), y+(di*0.49));
  curveVertex(x-(di*0.3), y+(di*0.4));
  curveVertex(x-(di*0.45), y+(di*0.2));
  curveVertex(x-(di*0.5),y+(di*0.1)); //control point
endShape();

//letter E
stroke(col2);
beginShape();
  curveVertex(x+(di*0.35), y-(di*0.35)); //control point
  curveVertex(x+(di*0.2), y-(di*0.45));
  curveVertex(x, y-(di*0.5));
  curveVertex(x,y);
  curveVertex(x+(di*0.15),y);
  curveVertex(x,y);
  curveVertex(x, y+(di*0.5));
  curveVertex(x+(di*0.2), y+(di*0.45));
  curveVertex(x+(di*0.35), y+(di*0.35));  //control point
endShape();

//letter A
stroke(col3);
beginShape();
  curveVertex(x+(di*0.6),y); //control point
  curveVertex(x+(di*0.45),y+(di*0.2));
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.45), y-(di*0.2));
  curveVertex(x+(di*0.3), y-(di*.40));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.3), y+(di*0.4));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.35), y+(di*0.35)); //control point
endShape(); 
}

void wrapInitials() //code adapted from class code 6
{
x=x+xSpeed;
y=y+ySpeed;
strokeWeight(2);
stroke(col2);
line(200,400,x,y);
line(200,0,x,y);

if (x>width +(di*0.5))
  {
   x=-di*0.5;
  }
if (y>height +(di*0.5))
  {
   y=-di*0.5; 
  }
}

void keyPressed()
{
x=random(0,400);
y=random(0,400);
xSpeed=random(1,6);
ySpeed=random(1,6);
di=random(30,300);
col1=color(random(255), random(255), random(255));
col2=color(random(255), random(255), random(255));
col2=color(random(255), random(255), random(255));
x2=random(0,400);
y2=random(0,400);
di2=random(50,300);
x2Speed=random(1,6);
y2Speed=random(1,6);
}
