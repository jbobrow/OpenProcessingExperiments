
//Derek Kwong Mods 14/15

void setup()
{ 
  size(500, 500);
  smooth();
}
void draw()
{ 
  ellipse1();
  stroke(0);
  fill(0, 0, 0, 10);
  rect(0, 0, 500, 500);
}
void ellipse1()
{ 
  if ( mouseButton== RIGHT)
  { 
    fill(250, 250, 250,255);
    ellipse(mouseX, mouseY, 50, 50);
    fill(250,250,250,10);
    ellipse(250, 250, 500-mouseX, 500-mouseY);
  }
  if (keyPressed==true&&key;=='w')
  {
    mouseY=mouseY-5;
  }
  if (keyPressed==true&&key;=='s')
  {
    mouseY=mouseY+5;
  }
  if (keyPressed==true&&key;=='a')
  {
    mouseX=mouseX-5;
  }
  if (keyPressed==true&&key;=='d')
  {
    mouseX=mouseX+5;
  }
  if (keyPressed==true&&key;=='c')
  {
    mouseX=mouseX+5;
    mouseY=mouseY+5;
  }
  if (keyPressed==true&&key;=='q')
  {
    mouseX=mouseX-5;
    mouseY=mouseY-5;
  }
  if (keyPressed==true&&key;=='e')
  {
    mouseX=mouseX+5;
    mouseY=mouseY-5;
  }
  if (keyPressed==true&&key;=='z')
  {
    mouseX=mouseX-5;
    mouseY=mouseY+5;
  }
}
