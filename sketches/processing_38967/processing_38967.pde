
// 09/23/11
// Ben Light
// bl1236@nyu.edu
// ICM Week 2
// Spinning square with smaller square rotating around it.  Clicking the left mouse button will change 
// the colors of the squares.  Clicking the right will change the rotation of the spin and reset the colors 
// to white

float rotIndex;
float speed = 10;

float widthAlpha;
float heightAlpha;

float widthOmega;
float heightOmega;

int direction;
int colorChange;

void setup(){
  
  size(620, 620);  //size of sketch
  background(0);  // color of background
  smooth();
  
  rotIndex = 0;
  direction = 1;
  colorChange = 255;
  
  widthAlpha = 300;  //width of large rectangle
  heightAlpha = 300;  // height of large rectangle
  
  widthOmega = 20;  // width of small rectangle
  heightOmega = 20;  // height of small rectabgle
  
}


void draw(){
  
  rotIndex += 0.005;  //the number being added controls the speed of the rotation
  
  pushMatrix();
  
    // Big Rectangle
    speed = 2;
    fill(255,255,colorChange);  //color of rectangle changed by right mouse click
    translate(width/2, height/2);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * speed * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthAlpha,heightAlpha);  //size of rectangle
    
    // Small Square
    speed = 10;
    fill(255,255,colorChange);  //color of rectangle changed by right mouse click
    translate(100, 100);   //determines the position of the small rectangle
    rotate(rotIndex * speed * direction);  //controls the speed of the rotation of small square
    rect(100,100, widthOmega,heightOmega);  //size of small square
  
  popMatrix();
    // Big Rectangle needs to be re draw due to small square over lap
    speed = 2;
    fill(255,225,colorChange);  //color of rectangle changed by right mouse click
    translate(width/2, height/2);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * speed * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, 300,300);  //size of rectangle
  
  
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    direction = direction * -1;
  }
  if (mouseButton == LEFT) {
    colorChange = colorChange - 2;
  } else {
    colorChange = 255;
  }
}


