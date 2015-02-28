
int mysize = 100;
int xpos = 350;
int ypos = 200;


void setup()
{
size (700,400);
background (255);
  
  
  
  
}





void draw ()
{
  background (255);
  stroke(0);
  PImage c;
// Images must be in the "data" directory to load correctly
c = loadImage("3.jpg");
image (c, mouseX,mouseY, 100,100);
  PImage b;
// Images must be in the "data" directory to load correctly
b = loadImage("1.jpg");

image(b, xpos, ypos, mysize, 100);


  
  xpos = xpos + (mouseX - xpos)/15;
  ypos = ypos + (mouseY - ypos)/15;
}
void mousePressed() {

  
}

void mouseMoved() {
  

 
  
}

