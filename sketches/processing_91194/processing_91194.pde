
int [] posX={25,55,90,120,150};

void setup()
{
  size(200,200);
  background(255);
  fill(0);
  rect (0,0,20,height);
  rect (0,height/10*9,width,20);
  rect (height/10*9,0,20,height);
}
void draw()
{
  for (int i=0; i<posX.length; i++)
    {
    if ((mouseX<20 && mouseX>0) || (mouseX>width/10*9 && mouseX<width) || (mouseY>height/10*9 && mouseY<height))
    fill(255-posX[i],255,0);
    rect(posX[i],50,10,10);
    }
  }
