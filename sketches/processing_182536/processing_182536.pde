
/* 

This interactive sketch allows users to create colourful spinning 
tops by dragging their mouse across the canvas and assigning colours
with the keyboard. The program generates different sized tops every time
it runs. 

Keyboard Colour Controls:
1 - Grey 
2 - Blue 
3 - Green
4 - Yellow
5 - Orange 
6 - Red
7 - Purple

Delete or Backspace creates a new blank canvas.

The S key saves image as a .tif file. 

*/

// Global Variables
int h = int(random(5,500));
color strokeColor = color(0,10);

// Setup Block
void setup(){
  size(800,800);
  colorMode(HSB,360,100,100,100);
  smooth();
  noFill();
  background(360);
}

// Drawing Block
void draw(){
  if(mousePressed){
    ellipse(mouseX,mouseY,int(random(5,100)),h);
    stroke(strokeColor);
  }
}

// Keyboard Command Block
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("interactive_drawing.tif");
 
  switch(key){
  case '1':
    strokeColor = color(0, 10);  // gray
    break;
  case '2':
    strokeColor = color(203, 64, 40, 10);  // blue
    break;
  case '3':
    strokeColor = color(100, 41, 33, 10); // green
    break;
  case '4':
    strokeColor = color(66, 54, 90, 10);  // yellow
    break;
  case '5':
    strokeColor = color(41, 83, 87, 10); //orange
    break;
  case '6':
    strokeColor = color(6, 76, 58, 10); //red
    break;  
  case '7':
    strokeColor = color(289, 45, 67, 10); // purple
    break;   
  }
}


