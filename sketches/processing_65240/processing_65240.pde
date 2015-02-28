
PImage lupin;
PImage castillo;
 
float xpos;
float ypos;
float drag = 30.0;
 
void setup() {
  size(400, 400);
  lupin = loadImage("lupin.gif");
  castillo = loadImage("castillo.jpg");
  xpos = width/2;
  ypos = height/2;
  // resize the background image so that it fills the screen
  if (castillo.width != width || castillo.height != height) {
    castillo.resize(width, height);
  }
}
 
void draw() {
  background(castillo);
   
  float difx = mouseX - xpos-lupin.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-lupin.width);
  } 
   
  float dify = mouseY - ypos-lupin.height/2;
  if (abs(dify) > 1 ) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-lupin.height);
  } 
   
  // Display the sprite at the position xpos, ypos
  image(lupin, xpos, ypos);
}

