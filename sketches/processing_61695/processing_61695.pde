
int yPos;
int rxPos,lxPos;
int eye;
int eyeColor;
void face(int a,int b)
{
  fill(255);
  ellipse(a,b,100,100);
  ellipse(a-40,b-20,30,30);  //왼
  ellipse(a+40,b-20,30,30);  //올른
  arc(a,b+20,30,30,0,radians(180));
  fill(eyeColor);
  ellipse(a+40+rxPos,b-20+yPos,eye,eye);
  ellipse(a-40+lxPos,b-20+yPos,eye,eye);

  float d = dist(mouseX,mouseY,a,b);

  if(mouseX>a+40)
  {
    if(mouseY<b-20)
    {
      rxPos=+2;
      lxPos=+2;
      yPos=-2;
    }
    else if(mouseY>b-20)
    {
      rxPos=+2;
      lxPos=+2;
      yPos=+2;
    }
  }
  else if(mouseX<a+40 && mouseX>a-40)
  {
    if(mouseY<b-20)
    {
      rxPos=-1;
      lxPos=+1;
      yPos=-3;
    }
    else if(mouseY>b-20)
    {
      rxPos=-1;
      lxPos=+1;
      yPos=+3;
    }
  }
  else if(mouseX<a-40)
  {
    if(mouseY<b-20)
    {
      rxPos=-2;
      lxPos=-2;
      yPos=-2;
    }
    else if(mouseY>b-20)
    {
      rxPos=-2;
      lxPos=-2;
      yPos=+2;
    }
  }

  if(50>d)
  {
    eye=10;
  }
  else  eye=5;
}

void setup()
{
  size(500,500);
  rxPos=0;
  lxPos=0;
  eye=5;
  eyeColor=0;
}

void draw()
{
  background(255);
  smooth();
  face(width/2,height/2);
  
  
}
