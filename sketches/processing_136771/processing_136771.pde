
// place your shapes
// the intention is to paint with clicks. Explore the shapes an colors.
// The shapes are rotated by random.

// There are diffrent shapes fom triangle to nonagon,   
// witch you choose with pressing the keys '3' to '9'. 
// you can chosse a random color when pressing the 'r' key.
// You can use '+' to increase the shape  size and '-' to drcreas shape size.
// if you click, the choosen shape is painted centered around the x/y-Position of the mouse.
/*
choose shape through keypress
 press key '3' to '9' to choose a triangle to nonagon
 press 'r' to pick a new random color
 press '+' to increase the radius by 10px. Maximum is the width
 press '-' to decrease the radius by 10px down to minimum 10 px
 press 'd' or 'D' to clean the canvas
 press 's' to save the image as png
 
 */

int vertexCount = 3; // the count of nodes in the shape
int radius = 50;  // initial radius around the shape
int radiusSteps = 10; // increse/drcrease steps 
int minRadius = 10; // minimal radius around the shape
int bgColor = 0;
void setup() {
  size(800, 600);
  colorMode(HSB, width, height, 100);
  noStroke();
  fill(0);
  bgColor = width; // white
  background(bgColor); 
  noLoop();
}

void draw() {
if(mousePressed){
   float angle = TWO_PI / vertexCount; // the angle depends on the count of edges in the shape
    
    float rotation = random(angle); // rotate the shape randomly
    beginShape(); 
    for (int i=0; i<=vertexCount; i++) {
      float x = mouseX   + cos(angle*i + rotation) * radius;
      float y = mouseY  + sin(angle*i + rotation) * radius;
      vertex(x, y);
    }
    endShape();
}
}
void mousePressed(){
  redraw();  // call draw(), whean mouse is pressed => the shape is painted
 
}
// handle keystrokes
void keyReleased() {
  switch(key) {
  // the shapes
  case '3':  // triangle
  case '4':  //rectangle
  case '5':  // pentagon
  case '6':  // hexagon
  case '7':  // heptagon
  case '8':  // octagon
  case '9':  // nonagon
    vertexCount = int(key) -int('0');
    break;
  // random color
  case 'r':  
  case 'R':
    float hue = random(width);
    float saturation =  random(height) ;
    fill(hue, saturation, 100);
    // border same color a litle bit darker
    stroke(hue, saturation, 80);
    break;
  // save Image
  case 's':
  case 'S':
    saveFrame("image_##.png");
    break;
  // erease canvas
  case 'd':
  case 'D':
    background(bgColor); // reset canvas
    redraw();
    break;
  // increase shape size
  case '+':
     // not bigger tha width
     radius = radius + radiusSteps > width ? width : radius + radiusSteps;
     break;
  // decrease shape size
  case '-':
     // not smaler than minradius
     radius = radius - radiusSteps < minRadius ? minRadius : radius - radiusSteps;
     break;
  }
}


