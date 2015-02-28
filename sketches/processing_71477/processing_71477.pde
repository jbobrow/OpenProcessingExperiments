
//Lucky Lui Computer Programming 1 14/15 (USERINPUT)
float x =0;
float y=0;
int a=0;
int b=0;
void setup()
{
  size(600,600);
}
void draw()
{
   fill(0,0,0,30);
  rect(0,0,600,600);
}
void keyPressed()
{
  fill(255);
  fill(19,234,207);
  rect(x,y,50,50);
  rect(600-x,600-y,50,50);
  if(keyPressed==true && key=='w')
  {
    y=y-20;
    b=b-20;
  }
  if(keyPressed==true && key=='s')
  {
    y=y+20;
    b=b-20;
  }
  if (keyPressed==true && key=='d')
  {
    x=x+20;
    a=a+20;
  }
  if (keyPressed==true && key=='a')
  {
    x=x-20;
    a=a-20;
  }
  if (y>600)
  {
    y=y;
  }
  if (keyPressed==true && key=='c')
  {
    fill(255);
    rect(0,0,600,600);
  }
  if(keyPressed==true && key=='r')
  {
    fill(255,31,31);
    rect(0,0,600,600);
  }
  if(keyPressed==true && key=='b')
  {
    fill(31,141,255);
    rect(0,0,600,600);
  }
  if(keyPressed==true && key=='g')
  {
    fill(31,255,92);
    rect(0,0,600,600);
  }
}
