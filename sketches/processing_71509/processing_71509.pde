
int w=10;
int changew=1;
void setup()
{
  size(300, 300);
}
void draw()
{
  fill(0,0,0,10);
  frameRate(100);
  stroke(150, 150, 150);
  rect(0, 0, 300, 300);
  ellipse(150,150,w,w);
  w=w+changew; 
  if (w>300)
  {
    changew=-1;
  }
  if (w<0)
  {
    changew=1;
  }
  mouseDragged();
  keyPressed();
}
void mouseDragged()
{
  if (keyPressed == true && key == 'c')
  {
    stroke(255,175,196,10);
  }  
  rect(mouseX, mouseY, pmouseX, pmouseY);
}
void keyPressed()
{  
  if (keyPressed == true && key == 't')
  {
    stroke(170,50,20,40);
    triangle(mouseX, mouseY, pmouseX, pmouseY, 150, 150);
  }
  if (keyPressed == true && key == 'w')
  {
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  }
}
