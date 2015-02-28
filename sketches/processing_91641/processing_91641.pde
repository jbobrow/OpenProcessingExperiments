
int[] shapes = {20,50,80,110,140};
int r,g,b;

void setup()
{
  size(200,200);
  smooth();
  noStroke();
}
 
void draw()
{
  r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);
  for (int i =0; i < shapes.length; i++)
  {
    if(mouseX < 20 || mouseX > width-20 || mouseY > height - 20)
    fill(r,g,b);
    else fill(0,0,0); 
    rect(shapes[i]+10,0,20,100);
  }
  black();
}
 
void black()
{
  fill(0);
  rect(0,0,20,height);
  rect(0,height-20,width,20);
  rect(width-20,0,height,height);
}
