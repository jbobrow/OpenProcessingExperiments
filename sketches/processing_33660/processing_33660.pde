
int mysize = 100;
float xpos = 350;
float ypos = 200;

void setup ()
{
  size (700,400);
  background(255);
  
  
}

void draw()
{
  background(255);
  stroke (0);
  ellipse(xpos,ypos,mysize,100);
  stroke (255,0,0);
  line(mouseX,mouseY, xpos,ypos);
  xpos= xpos + (mouseX - xpos)/25.0;
  ypos = ypos + (mouseY - ypos)/25.0;
}

void mousePressed()
{

 
 
}

void mouseMoved()
{

  
}

