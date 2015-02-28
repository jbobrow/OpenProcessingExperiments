
void setup()
{
  background(0);
  size(500,500);
}
int x=0;
int y=0;
int xchange=1;
int w=0;

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
  rect(mouseX,mouseY,mouseX,mouseX);
 rect(-mouseX,200-mouseY,mouseX,mouseX);
}

}
