
//Sketch by Homero Rosas



Explosion e,e2;

void setup()
{
  
  strokeWeight(0);
  smooth();
  size(600, 600);
  e = new Explosion();
  e.x = width/2;
  e.y = height/2;
  e.c=color(0,255,122);
  e.shockX=150;
  e.shockY=15;
  e.s=10;

  e2 = new Explosion();
  e2.x = width/2;
  e2.y = height/2;
  e2.c=color(random(-255,255)+1, random(-255,255)+1, random(-255,255)+1,60);
  e2.shockX=150;
  e2.shockY=15;
  e2.s=10;
}

void draw()
{
  background(250);
  e.show();
  e2.show();
  
  if(key=='s')
  {
  e.shockX=e.shockX+1;
  e.shockY=e.shockY+1;

  e2.shockX=e.shockX+1;
  e2.shockY=e.shockY+1;
  }
 if(e.shockX > 100) e.shockX=100;
 if(e.shockY > 100) e.shockY=100;
 if(e2.shockX > 100) e.shockX=100;
 if(e2.shockY > 100) e.shockY=100;
 
 if(key=='d')
 {noStroke();
  strokeWeight(0);}
 if(key=='a')
  {stroke(50);
 strokeWeight(5);}

 
  if(key=='w')
  {
  e.shockX=e.shockX-1;
  e.shockY=e.shockY-1;

  e2.shockX=e.shockX-1;
  e2.shockY=e.shockY-1;
  }
 
 if(e.shockX < 20) e.shockX=20;
 if(e.shockY< 15) e.shockY=15;
 if(e2.shockX < 20) e.shockX=20;
 if(e2.shockY < 15) e.shockY=15;
 
  if(key=='x')
  {
  e.c=e.c+100;
  e2.c=e2.c+100; 
  }
  
  
  
}
void mouseClicked()
{
  e.x=mouseX+random(0,255);
  e.y=mouseY+random(0,255);
  
  e2.x=mouseX+random(0,255);
  e2.y=mouseY+random(0,255);
}
void mouseReleased()
{
  e.x = mouseX+random(0,255);
  e.y = mouseY+random(0,255);
  
  e2.x=mouseX+random(0,255);
  e2.y=mouseY+random(0,255);
}

class Explosion
{
  float x, y;
  float shockX,shockY;
  float s;
  color c;

  void show()
  {
    fill(c);
    for (int i=1; i<100; i=i+1)
    {
  
      ellipse(x+random(-shockX,shockX),y+random(-shockY,shockY), s, s);
      rect(x+random(-shockX,shockX),y+random(-shockY,shockY),s,s);
      arc(x+random(-shockX,shockX)+random(-50,50),y+random(-shockY,shockY)+random(-50,50), shockX+random(-50,50),shockY+random(-50,50), radians(0), radians(180));
    }
  if (key=='l')
  {
  x=x+5;
  }
      if (key=='j')
  {
  x=x-5;
  }
    if (key=='i')
  {
  y=y-5;
  }
      if (key=='k')
  {
  y=y+5;
  }
if(x>570)
{
x=20;
}
if(x<10)
{
x=570;
}
if(y>570)
{
y=0;
}
if(y<20)
{
y=570;
}

}
  
}


