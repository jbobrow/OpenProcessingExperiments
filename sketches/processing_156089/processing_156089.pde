
//declare
int value = 0;
PImage myImage;
PFont awesomeFont;


void setup(){
//load (in setup)
  background (255,200,200);
  size (1200,1200);
  myImage=loadImage("COP.jpg");
  awesomeFont=loadFont("Archive-48.vlw");

  }
  
  void draw (){
  //draw it at 0,0 (in draw)
  image(myImage, mouseX, mouseY);
  textFont(awesomeFont);
  text("I love this album!",200,mouseY);
  fill(value);
  rect(25, value, 50, 50);

  }

void mouseDragged() 
{
  value = value + 10;
  if (value > 255) {
    value = 0;
  }
}


