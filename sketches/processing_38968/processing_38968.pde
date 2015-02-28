
// 09/23/11
// Ben Light
// bl1236@nyu.edu
// ICM Week 2
// Spinning squares with smaller squares rotating around them.  Clicking the left mouse button will change 
// the colors of the squares.  Clicking the right will change the rotation of the spin and reset the colors 
// to white

int direction;
int colorChange;

float rotIndex;

float widthAlpha;
float heightAlpha;

float widthOmega;
float heightOmega;

void setup(){
  
  size(620, 620);  //size of sketch
  background(0);  // color of background
  smooth();
  direction = 1;
  colorChange = 255;
  
  rotIndex = 0;
  
  widthAlpha = 100;  //width of large rectangle
  heightAlpha = 100;  // height of large rectangle
  
  widthOmega = 40;  // width of small rectangle
  heightOmega = 40;  // height of small rectabgle
  
}


void draw(){
  
  rotIndex += 0.005;  //the number being added controls the speed of the rotation
  
  pushMatrix();
  
    // Big Rectangle - center
    
    fill(255,colorChange,255);  //color of rectangle
    translate(width/2, height/2);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * 50 * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthAlpha,heightAlpha);  //size of rectangle
  
    // Small Square - center
    fill(255,255,colorChange);
    translate(widthAlpha,heightAlpha);   //determines the position of the small rectangle
    rotate(rotIndex);  //controls the speed of the rotation of small square
    rect(25,25,widthAlpha/5,heightAlpha/5);  //size of small square
  
  popMatrix();
  
  // Top Left
  pushMatrix();
  
    // Big Rectangle - top left
    fill(255,255,colorChange);
    translate(width/6, height/6);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * 50 * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthOmega,heightOmega);  //size of rectangle
    
    // Small Square - top left
    fill(255,colorChange,255);
    translate(widthOmega,heightOmega);   //determines the position of the small rectangle
    rotate(rotIndex);  //controls the speed of the rotation of small square
    rect(15,15,widthOmega/4,heightOmega/4);  //size of small square
  
  popMatrix();
  
  // Bottom Right
  pushMatrix();
  
    // Big Rectangle - bottom right
    fill(255,255,colorChange);
    translate(width - width/6, height - height/6);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * -50 * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthOmega,heightOmega);  //size of rectangle
    
    // Small Square - bottom right
    fill(255,colorChange,255);
    translate(widthOmega,heightOmega);   //determines the position of the small rectangle
    rotate(rotIndex*-1);  //controls the speed of the rotation of small square
    rect(15,15,widthOmega/4,heightOmega/4);  //size of small square
  
  popMatrix();
  
  pushMatrix();
  
    // Big Rectangle - bottom left
    fill(255,255,colorChange);
    translate(width/6, height - height/6);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * 50 * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthOmega,heightOmega);  //size of rectangle
    
    // Small Square - bottom left
    fill(255,colorChange,255);
    translate(widthOmega,heightOmega);   //determines the position of the small rectangle
    rotate(rotIndex);  //controls the speed of the rotation of small square
    rect(15,15,widthOmega/4,heightOmega/4);  //size of small square
  
  popMatrix();
  
  pushMatrix();
  
    // Big Rectangle - top right
    fill(255,255,colorChange);
    translate(width - width/6, height/6);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * -50 * direction);  //controls speed of rectangle
    rectMode(CENTER);
    rect(0, 0, widthOmega,heightOmega);  //size of rectangle
    
    // Small Square - top right
    fill(255,colorChange,255);
    translate(widthOmega,heightOmega);   //determines the position of the small rectangle
    rotate(rotIndex*-1);  //controls the speed of the rotation of small square
    rect(15,15,widthOmega/4,heightOmega/4);  //size of small square
  
  popMatrix();
  
}

//void mouseClicked() {
//  // Clicking mouse changes direction of spin 
//  if(direction == 1) {
//    direction = -1;
//  } else {
//    direction = 1;
//  }
//}


void mousePressed() {
  if (mouseButton == RIGHT) {
    direction = direction * -1;
  } else {
    direction = 1;
  }
  if (mouseButton == LEFT) {
    colorChange = colorChange - 5;
  } else {
    colorChange = 255;
  }
}




