

PImage pomo;

float xpos;
float ypos;
float drag = 30;

void setup() {
  size(300, 300);
  pomo = loadImage("pomo.gif");
  xpos = width/2;
  ypos = height/2;
}

void draw() { 
  background(1);
  
  float difx = mouseX - xpos-pomo.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-pomo.width);
  }  
  
  float dify = mouseY - ypos-pomo.height/2;
  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-pomo.height);
  }  
  
  
  image(pomo, xpos, ypos);
}

