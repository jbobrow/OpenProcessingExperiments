
/* @pjs font="PirataOne-Regular.otf"; */

int x = 0 ;
PFont myFont;
PImage myImage;


void setup() {
   size(800, 600) ;
   
  myFont = createFont("PirataOne-Regular.otf", 55);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  
  myImage = loadImage("Hawaii.jpg");
}

void draw() {

 image(myImage, 0, 0, width, height);
 
 fill(#FFFF00);
 text("If happy little blue birds fly", x, height*6/21);
 text("beyond the rainbow why, oh why can't I?", x, height*8/21);
  
  if (x < 400 ) {
  x=x+3/2 ;
  
}
}


