
float size;
int xOffset;
int yOffset;
int type;
int c;
void setup()
{
  rectMode(CORNERS);
  size(600,600);
  fill(0, 0,255);  
  size=1;
  noStroke();
  rect(0,0,600,600);
  xOffset=0;
  yOffset=0;
  type=1;
  c=0;
}
  void draw()
  {
    if(keyPressed){
     if (key=='a')
  xOffset -= 10;
  if (key=='d')
  xOffset += 10;
  if (key=='w')
  yOffset -=10;
  if (key=='s')
  yOffset +=10;
  if (key=='r')
 { fill(255,255,0);
  rect(0,0,600,600);}
  if (key=='e')
  type+=1;
  if (key=='q')
  c+=1;
  if (key=='z')
  size*=1.005;
  }
    translate(width/2+xOffset,height/2+yOffset);
    rotate(radians((16*frameCount)%360));
    scale(size);
    size *=.999;
   fill((255-size*255),(128-size*255)%255,(size*255+c)%256);
   if (type%4==0)
   ellipse(50,50,200,200); 
   else
   rect(0,0,100,100);
  }



