
//Sarah Anderson, seanders
//hold left mouse button to draw
//press space to clear

void setup()
{
size(400,400);  
background(50);
}

void draw()
{

}

void mouseDragged()
{
fill(random(255),random(255),random(255));
float mx=width-mouseX;
float my=height-mouseY;
ellipse(mx,my,10,10);
ellipse(mouseX,mouseY,10,10);
ellipse(mouseX,my,10,10);
ellipse(mx,mouseY,10,10);  
}

void keyPressed()
{
if (key==' ')
  {
   background(50); 
  }
}
