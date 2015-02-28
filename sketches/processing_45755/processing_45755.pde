
PImage bg, UpYours; 
float mouse ;

void setup () 
{
  size (528, 720) ; 
  bg = loadImage ("ass.jpg");
  UpYours = loadImage ("Untitled.png") ;
}
void draw () 
{
{
background (bg);
}
{
  //mouse = MouseInfo.getPointerInfo().getLocation();  
  image (UpYours, mouseX/2.5, mouseY/2) ;
}
}

