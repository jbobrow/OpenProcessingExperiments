
//My Drawing Machine HW

//PImage cat;

color strokeColor = color(0);
int rect1X = 10;
int rect2X = 180;
int rect3X = 355;
int rect4X = 525;
int rectY = 0;
int rectWidth = 175; 
int rectHeight = 40;
color rect1Color= color(255,0,0);
color rect2Color= color(0,255,0);
color rect3Color= color(0,0,255);
color rect4Color= (255);

void setup() {
  size(1024, 683);
  // The background image must be the same size as the parameters
  // into the size() method.
  background(114,114,225);
  reset();
}
  
void draw() {
 //whenever you press the mouse, a line is drawn between pmouseX&Y and mouseX&Y (drawing)
  stroke(strokeColor);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
   

}
//this gets called everytime the mouse is pressed
void mousePressed(){
  //the following checks each rect for mouse press, and sets the stroke color to be the rect color
  if(overRect(rect1X,rectY,rectWidth,rectHeight)){
    strokeColor = rect1Color;
  } else if(overRect(rect2X,rectY,rectWidth,rectHeight)){
    strokeColor = rect2Color;
  } else if(overRect(rect3X,rectY,rectWidth,rectHeight)){
    strokeColor = rect3Color;
  }else if(overRect(rect4X,rectY,rectWidth,rectHeight)){
    reset();
  }
   
}
//chceks if mouseX and mouseY are inside the rectangle defined by the function arguements 
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void reset(){
  background (114,114,225);
    fill(rect1Color);
  rect(rect1X,rectY,rectWidth,rectHeight);
  fill(rect2Color);
  rect(rect2X,rectY,rectWidth,rectHeight);
  fill(rect3Color);
  rect(rect3X,rectY,rectWidth,rectHeight);
  fill(rect4Color);
  rect(rect4X,rectY,rectWidth,rectHeight);
}




