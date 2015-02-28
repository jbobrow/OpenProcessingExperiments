
float posX;
float posY;
float z=1;
float m=1;
float t=2;
float v=2.8;
int c=1;
int count=1;

void setup()
{
  size(300,300);
  frameRate(30);
  posX=150;
  posY=150;
}
void draw()
{
  posX=posX+(t*z);
  posY=posY+(v*m);
  if (posX>width-25||posX<50){
    z=z*-1;
  }
  if (posY>height-25||posY<50){
    m=m*-1;
  }
  fill(c);
  ellipse(posX,posY,50,50);
}
void mouseDragged()
{
  posX=mouseX;
  posY=mouseY;
  z=1;
  m=m;
  t=t+.05;
  v=v+.05;
  c=c+1;
  if (c>255){
    c=c*-1;
  }
}


