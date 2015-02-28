
int a=0,mx1,my1;

void setup()
{
  size(250, 250);
}

void draw()
{
  background(255);
  if(a==1) {fill(255,0,0);ellipse(mx1,my1,50,50);fill(255,255,0);rect(mx1-2.5,my1-25,5,25);}
  fill(255,0,0);
  ellipse(mouseX, mouseY, 50, 50);
  fill(255,255,0);
  rect(mouseX-2.5,mouseY-25,5,25);
  if(mousePressed == true)
  {
      a=1;
      mx1=mouseX;
      my1=mouseY;
  }
  else
  {
  
  }
}
