
//60-675
//Copyright: Angela Kolosky, Pittsburgh, PA 2013

float x,y,wd,ht;
int value = 255;
float xspeed=1;
float yspeed=.5;

void setup()
{
  size(400,400);
  background(0);
  x=200;
  y=200;
  wd=width*.5;
  ht=height*.5;
}

void draw()
{
  //background
  noStroke();
  fill(0,0,0,100);
  rect(0,0,width,height);
  
  //text
  fill(255);
  textSize(20);
  text("click the bouncing ball",30,370);
  
  //stars
  stroke(8,255,133);
  strokeWeight(3);
  point(mouseX,mouseY);
  
  //mouse
  stroke(255);
  strokeWeight(3);
  point(random(pmouseX),random(pmouseY));
 
  //bouncing ellipse help from Processing tutorial on PVector
  x=x+xspeed;
  y=y+yspeed;
  
  if ((x>width) || (x<0))
  {
    xspeed=xspeed*-1;
  }
  if ((y>height) || (y<0))
  {
    yspeed=yspeed*-1;
  }
  
  noStroke();
  fill(value);
  ellipse(x,y,30,30);
  
  //mouse pressed lines
  if (mousePressed == true)
  {
    stroke(255);
    strokeWeight(5);
    line(mouseX,mouseY,random(1,400),random(1,400));
  }
  else
  {
    point(random(1,400),random(1,400));
  }
}

//mouse click change colors of ellipse
void mouseClicked() 
{ if (value == 255)
  { value = color(random(255),random(255),random(255));
  }
  else
  { value = 255;
  }
}



