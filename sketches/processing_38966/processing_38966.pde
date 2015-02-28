
// 09/23/11
// Ben Light
// bl1236@nyu.edu
// ICM Week 2
// Spinning ellipse with smaller ellipses rotating around it.  
// Clicking the left mouse button will change the colors of the squares.  
// Clicking the right will change the rotation of the spin and reset the colors to white
// When the "F" key is pressed widths go up, height goes down
// When the "J" key is pressed widths go down, height goes up

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
  
  widthAlpha = 300;  //width of large ellipse
  heightAlpha = 300;  // height of large ellipse
  
  widthOmega = 20;  // width of small ellipse
  heightOmega = 20;  // height of small ellipse
  
}

void draw(){
  
  rotIndex += 0.005;  //the number being added controls the speed of the rotation
  
  if(keyPressed) {
    // If "F" is pressed widths go up, height goes down
    if (key == 'f' || key == 'F') {
      widthAlpha += 1;
      widthOmega += .5;
      heightAlpha -= 1;
      heightOmega -= .5;
    }
  } else {
    widthAlpha = widthAlpha;
    widthOmega = widthOmega;
    heightAlpha = heightAlpha;
    heightOmega = heightOmega;
  }
  
  if(keyPressed) {
    // If "J" is pressed widths go down, height goes up
    if (key == 'j' || key == 'J') {
      widthAlpha -= 1;
      widthOmega -= .5;
      heightAlpha += 1;
      heightOmega += .5;
    }
  } else {
    widthAlpha = widthAlpha;
    widthOmega = widthOmega;
    heightAlpha = heightAlpha;
    heightOmega = heightOmega;
  }
  
  pushMatrix();
  
    // Big Ellipse
    speed = 2;
    fill(255,255,colorChange);  //color of rectangle changed by right mouse click
    translate(width/2, height/2);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * speed * direction);  //controls speed of rectangle
    rectMode(CENTER);
    ellipse(0, 0, widthAlpha,heightAlpha);  //size of rectangle
    
    // Small elipse
    speed = 10;
    fill(255,255,colorChange);  //color of rectangle changed by right mouse click
    translate(100, 100);   //determines the position of the small rectangle
    rotate(rotIndex * speed * direction);  //controls the speed of the rotation of small square
    ellipse(100,100, widthOmega,heightOmega);  //size of small square
  
  popMatrix();
  
    // Big Ellipse needs to be redrawn due to small ellipse over lap
    speed = 2;
    fill(255,225,colorChange);  //color of rectangle changed by right mouse click
    translate(width/2, height/2);  //determines the position of the rectangle, if divided by 2 it is in the center
    rotate(rotIndex * speed * direction);  //controls speed of rectangle
    rectMode(CENTER);
    ellipse(0, 0, widthAlpha,heightAlpha);  //size of rectangle
  
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    direction = direction * -1;
  }
  if (mouseButton == LEFT) {
    colorChange = colorChange - 3;
  } else {
    colorChange = 255;
  }
}




