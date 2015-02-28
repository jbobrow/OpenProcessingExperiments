
PImage b;
float x = -50;
float y = -50;
float w;
float h;
boolean moving;
boolean scalingUpLeft;
boolean scalingUpRight;
boolean scalingBtLeft;
boolean scalingBtRight;
float handle = 5;

void setup() {
  smooth();
  size(600, 600);
  background(0);
  b = loadImage("logo.jpg");
}


void draw() {
  background(255);
  noFill();
  image(b, x, y, w, h);

  //handles
  rect(x-handle, y-handle, handle, handle);
  rect(x-handle, y+h, handle, handle);
  rect(x+w, y-handle, handle, handle);
  rect(x+w, y+h, handle, handle);
}

void mousePressed() {
  moving = false;
  scalingUpLeft = false;
  scalingUpRight = false;
  scalingBtLeft = false;
  scalingBtRight = false;

  if (insideRect(mouseX, mouseY, x, y, w, h)) {
    moving = true;
  }
  else if (upperLeft(mouseX, mouseY, x, y, w, h)) {
    scalingUpLeft = true;
  }
  else if (upperRight(mouseX, mouseY, x, y, w, h)) {
    scalingUpRight = true;
  }
  else if (BtLeft(mouseX, mouseY, x, y, w, h)) {
    scalingBtLeft = true;
  }
  else if (BtRight(mouseX, mouseY, x, y, w, h)) {
    scalingBtRight = true;
  }
  else {
    w = 0;
    h = 0;
    x = mouseX;
    y = mouseY;
  }
}

void mouseDragged() {
  if (moving)
  {
    x = x + (mouseX - pmouseX);
    y = y + (mouseY - pmouseY);
  }
  else if (scalingUpLeft)
  {
    x = x + (mouseX - pmouseX);
    w = w - (mouseX - pmouseX);
    y = y + (mouseY - pmouseY);
    h = h - (mouseY - pmouseY);
  }
  else if (scalingUpRight)
  {
    x = x;
    w = w + (mouseX - pmouseX);
    y = y + (mouseY - pmouseY);
    h = h - (mouseY - pmouseY);
  }
  else if (scalingBtLeft)
  {
    x = x + (mouseX - pmouseX);
    w = w - (mouseX - pmouseX);
    y = y;
    h = h + (mouseY - pmouseY);
  }
  else if (scalingBtRight)
  {
    x = x;
    w = w + (mouseX - pmouseX);
    y = y;
    h = h + (mouseY - pmouseY);
  }
  else {
    w = mouseX - x;
    h = mouseY - y;
  }
}

boolean insideRect(float mouseX, float mouseY, float x, float y, float w, float h) {
  boolean inside = false;
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    inside = true;
  }
  return inside;
}

boolean upperLeft(float mouseX, float mouseY, float x, float y, float w, float h) {
  boolean canResize = false;
  if (mouseX > x-handle && mouseX < x && mouseY > y-handle && mouseY < y) {
    canResize = true;
  }
  return canResize;
}

boolean upperRight(float mouseX, float mouseY, float x, float y, float w, float h) {
  boolean canResize = false;
  if (mouseX > x+w && mouseX < x+w+handle && mouseY > y-handle && mouseY < y) {
    canResize = true;
  }
  return canResize;
}

boolean BtLeft(float mouseX, float mouseY, float x, float y, float w, float h) {
  boolean canResize = false;
  if (mouseX > x-handle && mouseX < x && mouseY > y+h && mouseY < y+h+handle) {
    canResize = true;
  }
  return canResize;
}

boolean BtRight(float mouseX, float mouseY, float x, float y, float w, float h) {
  boolean canResize = false;
  if (mouseX > x+w && mouseX < x+w+handle && mouseY > y+h && mouseY < y+h+handle) {
    canResize = true;
  }
  return canResize;
}


