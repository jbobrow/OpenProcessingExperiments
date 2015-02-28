
void setup()
{
  size(640,480);
  smooth();
  frameRate(25);
  background(255);
  
}
void draw()
{ 
  fill(255,50);
  rect(0,0,width,height);
  drawIter(400,PI+((frameCount/1000.0)%(2*PI)));
}
void drawIter(int iter,float incr)
{
  float X,Y,prevX=0,prevY=0;
  boolean firsttime=true;
  
  stroke(#0000ff,100);
  for(float i=0;i<iter;i+=incr)
  {
    X = width/2+i*cos(noise(mouseX,mouseY)*i);
    Y = height/2+i*sin(noise(mouseY,mouseX)*i);
    if(firsttime)
    {firsttime=false;}
    else
    {
      line(prevX,prevY,X,Y);
    }
    prevX=X;
    prevY=Y;
  }
}

