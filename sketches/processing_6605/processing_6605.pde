
/*
  Program to geenerate cartesian coordinates from
 polar coordinates
 */

PFont font;

PGraphics hud;

float radius;
float theta;
float x, y;

float panX, panY;
float panStartX, panStartY;
float panSensitivity;

void drawAxes()
{
  textFont(font, 12);
  stroke(255, 0, 0);
  line(0, 0, (width/2)-25, 0);
  text("X", (width/2)-23, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, (height/2)-25);
  text("Y", -2, (height/2)-10);

  stroke(255, 0, 0);
  if (theta < 0){
    arc(0, 0, radius/10, radius/10, radians(theta),0);
  }
  else {
    arc(0, 0, radius/10, radius/10, 0, radians(theta));
  }
}

void calculateCartesianCoordinates() {
  x = radius * cos(radians(theta));
  y = radius * sin(radians(theta));
}

void drawPolarArm()
{
  calculateCartesianCoordinates();
  stroke(127);
  line(0, 0, x, y);
  text("radius= "+(int)radius+"\nangle= "+(int)theta, x/2, y/2);
  text("("+(int)x+", "+(int)y+")", (int)(x+2), (int)y);
}

/**
BLH BLAH
*/
void createHeadsUpDisplay()
{
  hud = createGraphics(width, 50, P2D);
  hud.beginDraw();
  {
    hud.background(0, 0);
    hud.noFill();
    hud.stroke(50);
    hud.strokeWeight(5);
    hud.rect(0, 0, hud.width-1, hud.height-1);
    hud.textFont(font, 12);
    hud.text("Polar coordinates to Cartesian coordinates conversion demo", 5, 15);
  }
  hud.endDraw();
}

void setup()
{
  size(720, 546);
  background(0);
  smooth();
  strokeWeight(3);
  strokeCap(ROUND);

  font = loadFont("comicsans.vlw");
  textFont(font, 12);

  createHeadsUpDisplay();

  panX = 2;
  panY = 2;
  panStartX = 0;
  panStartY = 0;
  panSensitivity = 0.01;

  radius = width/3.5;
  theta = 45;
  calculateCartesianCoordinates();
}

void draw()
{
  background(0);
  pushMatrix();
  {
    translate(panX, panY);
    drawAxes();
    drawPolarArm();
  }
  popMatrix();

  image(hud, 0, height-hud.height);
}

void mousePressed() 
{
  switch(mouseButton) {
  case CENTER:
    panStartX = mouseX;
    panStartY = mouseY;
    break;
  }
}

void mouseDragged()
{
  switch(mouseButton) {
  case LEFT:
    theta += 5.0;
    break;
  case RIGHT:
    theta -= 5.0;
    break;
  case CENTER:
    panX += (mouseX-panStartX)*panSensitivity;
    panY += (mouseY-panStartY)*panSensitivity;
    break;
  }

  if (abs((int)theta) == 360) 
    theta = 0.0;
}

void mouseReleased() 
{
  switch(mouseButton) {
  case CENTER:
    panStartX = 0;
    panStartY = 0;
    break;
  }
}







































