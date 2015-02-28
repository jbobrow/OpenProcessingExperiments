

 
PImage teddy;
PImage sky;

float xpos;
float ypos;
float drag = 30.0;

void setup() {
  size(600, 600);
  teddy = loadImage("400.jpg");
  sky = loadImage("sky.jpg");
  xpos = width/2;
  ypos = height/2;
  }


void draw() {
  
  
  float difx = mouseX - xpos-teddy.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-teddy.width);
  }  
  
  float dify = mouseY - ypos-teddy.height/2;
  if (abs(dify) > 1 ) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-teddy.height);
  }  
  

  image(teddy, xpos, ypos);
}

