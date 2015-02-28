
void setup()
{
  background(0);
  size(500,500);
}
int x=0;
int y=0;
int ychange=1;
int xchange=1;
int w=0;
int r= int(random(350,450));
int q=int(random(250,270));
void draw()
{
  fill(0,0,0,10);
  rect(0,0,500,500);
  fill(255-w,x,w);
  noStroke();
   ellipse(random(500),50,10,10);
   ellipse(50,random(500),10,10);
   ellipse(random(500),450,10,10);
   ellipse(450,random(500),10,10);
   fill(255);
   rect(random(r),random(q),20,20);
 
   w=w+ int(random(0,256));
   x=x+xchange;
   mouseReleased();
 mouseDragged();
 keyPressed();
}

void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    fill(0,0,0,30);
    rect(0,0,500,500);
 fill(x,255-x,x);
 stroke(255);
 strokeWeight(3);
 ellipse(mouseX,mouseY,mouseX,mouseX);
 ellipse(500-mouseX,500-mouseY,mouseX,mouseX);
  }
    
  if (x>255)
  {
    xchange=-1;
  }
  if (x<0)
  {
    xchange=1;
  }

  
   x=x+xchange;
 y=y+5;
 
  if(mouseButton==RIGHT)
{
  fill(255-w,x,w,100);
  rect(mouseX,mouseY,20,20);
 rect(500-mouseX,500-mouseY,20,20);
 rect(mouseX,500-mouseY,20,20);
 rect(500-mouseX,mouseY,20,20);
 if (x>255)
  {
    xchange=-1;
  }
  if (x<0)
  {
    xchange=1;
  }

  
   x=x+xchange;
}

}

void keyPressed()
{
  if (key=='a')
{
  fill(255,255,255);
 
ellipse(x,y,50,50);
fill(0);
ellipse(x-2,y+2,10,10);
ellipse(x+2,y+2,10,10);
 if (x>=250)
  {
    xchange=xchange-1;
  }
  if (x<250)
  {
    xchange=xchange+1;
  }
  if(y>500)
  {
    ychange=-ychange;
    y=0;
  }
  if(x>500)
  {
    xchange=-1;
  }
  if(x<0)
  {
    xchange=1;
  }
  
  x=x+xchange;
  y=y+1;
  ychange=1+ychange;
}
}
