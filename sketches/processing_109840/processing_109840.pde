
void setup()
{
  size(300,300);
  background(125,125,250);
}

void draw()
{
  float x=150, y=150, diam=50;
  float newx=width/2,newy=height/7;
  float linex=3;
  fill(255);
  ellipse(x,y,diam,diam);
  x+=100;
  y+=100;
  diam+=100;
  ellipse(x,y,diam,diam);
  x=x/2;
  y=y/2;
  diam=diam/2;
  ellipse(x,y,diam,diam);
  fill(255,140,100);
  rect(width/5,height/4,50,50);
  fill(20,75,10);
  beginShape();
  vertex(newx,newy);
  vertex(newx-25,newy-25);
  vertex(newx+25,newy-25);
  endShape();
  fill(255,10,255);
  ellipse(width/1.5,height/1.5,30,50);
  line(linex,0,linex,height);
  line(linex*linex,0,linex*linex,height);
  line(linex*linex*linex,0,linex*linex*linex,height);
  line(linex*linex*linex*linex,0,linex*linex*linex*linex,height);
  line(linex*linex*linex*linex*linex,0,linex*linex*linex*linex*linex,height);
}



