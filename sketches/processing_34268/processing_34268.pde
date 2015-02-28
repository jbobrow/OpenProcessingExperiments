
/*****************************************************************
 A simple sketch with for trippy, colorful bubble patterns.
 Size of the bubbles depends on X-Position of the mouse.
 Speed depends on Y-position of the mouse.
 Click anywhere on the screen to change the amount of rows along the
 X-axis and Y-axis
 ******************************************************************/

float numX = 20;
float numY = 20;

void setup() {
  size(800, 700, P2D);
  frameRate(24);
  noStroke();
}

void draw() {
  //calculate a background that smoothly oscillates between black and white
  float back = ((int)frameCount/255)%2 == 0 ? frameCount%255 : 255 - frameCount%255;
  background(back);
  for (int x = 0; x < width + 10; x += numX) {
    for (int y = 0; y < height + 10; y += numY) {
      fill(255*cos(x+y+frameCount*.01), 255*sin(y+x+frameCount*.01), 255*tan(x+y+frameCount*.01));
      ellipse(x, y, circleSize()*sin(x+y+frameCount*speed()) + 8, circleSize()*cos(x+y+frameCount*speed()) + 8);
    }
  }
}

float circleSize() { 
  return map(mouseX, 0, width, width/500, width/12);
}
float speed() { 
  return map(mouseY, 0, height, .06, .2);
}

void mouseClicked() {
  numX = map(mouseX, 0, width, width/230, width/4);
  numY = map(mouseY, 0, height, height/230, height/4);
}


