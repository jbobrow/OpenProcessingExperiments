
void setup()
{
  size(400,400);
  noStroke();
  background(255);
}

void draw()
{
  circles();
  vertical(); 
}
  
void circles()
{
  frameRate(100);
  float x=mouseX;
  float y=mouseY;
  
  fill(255,30); rectMode(CORNER); rect(0,0,400,400);

  float ix=width-mouseX;
  float iy=mouseY-height;
  fill(x/2,y/2,y/2,30);
  ellipse(x,height/2,y,y);
  fill(x/2,x/2,y/2,30);
  ellipse(ix,height/2,iy,iy);
}

void vertical()
  {
    float ax=mouseX-width/8;
    float bx=mouseY-height;
    fill(ax,bx,ax,20);
    ellipse(width/2,ax,bx,bx);
  }
  
  
  
