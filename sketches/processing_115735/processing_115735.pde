
float prevX;
float prevY;
int brush=1;
PImage sinji;
float s=1;
float r=0;
PImage wheel;
color currentColor;
void setup()
{
  size(600,600);
  sinji=requestImage("sinji.png");
  wheel=requestImage("wheel.jpg");
}
void draw()
{
  if (wheel.width>0)
  {
    image(wheel,0,0,200,200);
  }
  if(mouseButton==RIGHT)
  {
    currentColor=get(mouseX,mouseY);
  }
 if (brush==2)
 {
 strokeWeight(random(50));
 stroke(random(255),random(255),random(255));
 if (mousePressed ==true)
 {
   if(mouseButton==LEFT)
   {
     line(prevX,prevY,mouseX,mouseY);
     prevX=mouseX;
     prevY=mouseY;
     //ellipse(mouseX,mouseY,random(0,50),random(0,50));
}
 }
  prevX=mouseX;
  prevY=mouseY;
}
if (brush==1)
{
  
  if (mousePressed ==true)
 {
   if(mouseButton==LEFT)
   {
    fill(red(currentColor), green(currentColor), blue(currentColor));
      stroke(red(currentColor), green(currentColor), blue(currentColor));
     pushMatrix();
     translate(mouseX,mouseY);
     rotate(r);
     scale(s);
 rect(0,0,50,50);
 popMatrix();
   }

   prevX=mouseX;
  prevY=mouseY;
}
}
if (brush==3)
{
   if (mousePressed ==true)
 {
   if(mouseButton==LEFT)
   {
  float a=0;
  float b=99;
  float prevA=a;
  float prevB=b;
  strokeWeight(5);
 stroke(random(255),random(255),random(255));
while(a<500)
{
  a+=5;
  b+=random(-10,10);
  pushMatrix();
  translate(250,250);
  rotate(r);
  line(prevA,prevB,a,b);
  popMatrix();
  prevA=a;
  prevB=b;
  }
    if(sinji.width>0)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(random(1,10));
      scale(random(1,3));
      image(sinji,0,0,random(1,100),random(1,100));
      popMatrix();
    }
   }
}
 }
}
void keyReleased()
{
  if (key=='1')
  {
    brush=1;
  }
  if(key=='3')
  {
    brush=3;
  }
  if (key=='2')
  {
    brush=2;
  }
  if (key=='s')
  {
    s=1;
  }
  if(key=='r')
  {
    r=0;
  }
}
  void keyPressed()
  {
  if (keyCode==UP)
  {
    s+=1;
  }
  if(keyCode==DOWN)
  {
    s-=1;
  }
  if(keyCode==RIGHT)
  {
    r+=0.5;
  }
  if(keyCode==LEFT)
  {
    r-=.5;
  }
  if(key=='c')
  {
    fill(255);
    rect(0,0,700,700);
    fill(currentColor);
  }
  }



