
float pX,pY;
int bgColor=0;
boolean fading=false;

void setup()
{
  size(500,500);
  pX=280;
  pY=200;
  line(250,250,pX,pY);
  //frameRate(10);
  background(bgColor);
}

void draw()
{
  if(fading) Fading();

  float nextX,nextY, mouseRadius;
  nextX=random(0,500);
  nextY=random(0,500);
  mouseRadius=sqrt((mouseX-250)*(mouseX-250)+(mouseY-250)*(mouseY-250));
  while((nextX-250)*(nextX-250)+(nextY-250)*(nextY-250) > mouseRadius*mouseRadius)
  {
    nextX=random(0,500);
    nextY=random(0,500);
  }
  stroke(nextX*255/500,nextY*255/500,mouseX*255/500);
  line(pX,pY,nextX,nextY);
  pX=nextX;
  pY=nextY;
}

void keyPressed()
{
  background(bgColor);
}

void mousePressed()
{
  if(fading==true) fading=false;
  else fading=true;
}

void Fading()
{
  fill(0,0,0,10);
  rect(0,0,width,height);
}

