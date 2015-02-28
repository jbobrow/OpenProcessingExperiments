
PImage lupin;

float xpos;
float ypos;
float drag = 30;

void setup() {
  size(400, 400);
  lupin = loadImage("lupin.gif");
  xpos = width/2;
  ypos = height/2;
}

void draw() { 
  background(203,97,97);
  
  float difx = mouseX - xpos-lupin.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-lupin.width);
  }  
  
  float dify = mouseY - ypos-lupin.height/2;
  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-lupin.height);
  }  
  
  // Display the sprite at the position xpos, ypos
  image(lupin, xpos, ypos);
}


