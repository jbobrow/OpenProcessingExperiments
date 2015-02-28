
int[] shapes = {25,50,75,100,125};
 
void setup()
{
  size(200,200);
}
 
void draw()
{
   
 
  for (int i =0; i < shapes.length; i++)
  {
    if(mouseX < 20 || mouseX > width-20 || mouseY > height - 20)
    fill(255-shapes[i]);
    else fill(255-shapes[i],0,0); 
    rect(shapes[i],height/2,20,20);
  }
  borders();
}
 
void borders()
{
  fill(0);
  rect(0,0,20,height);
  rect(0,height-20,width,20);
  rect(width-20,0,height,height);
}
