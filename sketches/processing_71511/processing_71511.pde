
//Benjamin Z. Computer Programming 1 16/17, User Import
int l=0;
int p=1;
void setup()
{
  background(255);


  smooth();
  size(600, 600);
}
void draw()
{
  qwer();
  if (key == 'q')
  {
    fill(255, 0, 0);
  }
  if (key == 'w')
  {
    fill(0, 255, 0);
  }

  
  if (mouseButton==LEFT)
  {
    ellipse(mouseX, mouseY, 50, 50);
    ellipse(mouseX, 600-mouseY, 50, 50);
  }
 if (mouseButton == RIGHT)
  {
    fill(random(255), random(255), random(255), 35);
    ellipse(mouseX-20, mouseY-20, 40, 40);
    fill(random(255), random(255), random(255), 15);
    ellipse(mouseX+20, mouseY-20, 40, 40);

    fill(random(255), random(255), random(255), 105);
    ellipse(mouseX-20, mouseY+40, 40, 40);
    fill(random(255), random(255), random(255), 55);
    ellipse(mouseX+20, mouseY+40, 40, 40);
  }
}
void qwer()
{
  line(l, 0, l, 600);
  stroke(random(255),random(255),random(255),100);
  l=l+p;
  if (l>600)
  {
    p=p-1;
  }
  if (l==0)
  {
    p=p+1;
  }
}

