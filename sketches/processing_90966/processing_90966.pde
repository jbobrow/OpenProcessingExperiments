
int[] shapes = {30,60,90,120,150};

void setup()
{
  smooth();
  size(200,200);
}

void draw()
{
  

  for (int i =0; i < shapes.length; i++)
  {
    if(mouseX < 20 || mouseX > width-20 || mouseY > height - 20)
    fill(255-shapes[i],0,0);
    else fill(0,0,255-shapes[i]);  
    ellipse(shapes[i]+10,height/2,20,20);
  }
  sides();
}

void sides()
{
  fill(0);
  rect(0,0,20,height);
  rect(0,height-20,width,20);
  rect(width-20,0,height,height);
}
