
int strokeSize;
color currentColor;
PImage load;
PImage saveImage;
PImage eyedropper;
PImage eyedropperPicked;
boolean ctrlPressed = false;
boolean rPressed = false;
boolean sPressed = false;
boolean oPressed = false;
boolean picker;
import controlP5.*;
ControlP5 ColorSelector;
ControlP5 StrokeSelector;
float red = 0;
float green = 0;
float blue = 0;


void setup() {
  size(500, 500);
  frame.setResizable(true);
  background(#FFFFFF);
  strokeSize = 5;
  picker = false;
  ColorSelector = new ControlP5(this);
  ColorSelector.addSlider("red", 0, 255, 0, 50, 15, 127, 15);
  ColorSelector.controller("red").setColorForeground(color(255, 0, 0));
  ColorSelector.controller("red").setColorBackground(#303030);
  ColorSelector.addSlider("green", 0, 255, 0, 50, 40, 127, 15);
  ColorSelector.controller("green").setColorForeground(color(0, 255, 0));
  ColorSelector.controller("green").setColorBackground(#303030);
  ColorSelector.addSlider("blue", 0, 255, 0, 50, 65, 127, 15);
  ColorSelector.controller("blue").setColorForeground(color(0, 0, 255));
  ColorSelector.controller("blue").setColorBackground(#303030);
  StrokeSelector = new ControlP5(this);
  StrokeSelector.addSlider("strokeSize", 0, 150, 5, 275, 65, 150, 15);
  StrokeSelector.controller("strokeSize").setColorForeground(#808080);
  StrokeSelector.controller("strokeSize").setColorBackground(#303030);
  eyedropper = loadImage("Picker.png");
}


void fileOpen(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    load = loadImage(selection.getAbsolutePath());
    background(#FFFFFF);
    redraw();
    image(load, 0, 100);
  }
}


void fileSave(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    PImage saveImage  = get(0, 100, width, height-100);
    saveImage.save(selection.getAbsolutePath() + ".jpg");
  }
}


void draw() {
  drawLines();
  drawButtons();
  checkKeyPress();
  pickColor();
  fill(currentColor);
  currentColor = color(red, green, blue);
  rect(15, 50, 30, 30);
}


void mouseClicked() {

  if (mouseX >= 15 && mouseX <= 45 && mouseY >= 15 && mouseY <= 45 && picker == false) {
    picker = true;
    eyedropper = loadImage("PickerPicked.png");
    image(eyedropper, 7, 7);
  } 
  else if (mouseX >= 15 && mouseX <= 45 && mouseY >= 15 && mouseY <= 45 && picker == true) {
    picker = false;
    eyedropper = loadImage("Picker.png");
    image(eyedropper, 7, 7);
  }
}


void pickColor() {
  if (picker == true && mousePressed && mouseY >= 100 ) {
    currentColor = get(mouseX, mouseY);
    red = red(get(mouseX, mouseY));
    green = green(get(mouseX, mouseY));
    blue = blue(get(mouseX, mouseY));
    ColorSelector.controller("red").setValue(red); 
    ColorSelector.controller("green").setValue(green); 
    ColorSelector.controller("blue").setValue(blue);
  }
}


void checkKeyPress() {
  if (rPressed == true && ctrlPressed == true) {
    noStroke();
    fill(#FFFFFF);
    rect(0, 100, 500, 400);
    redraw();
  } 
  if (sPressed == true && ctrlPressed == true) {
    selectOutput("Save As...", "fileSave");
    sPressed = false;
  }
  if (oPressed == true && ctrlPressed == true) {
    selectInput("Select a file : ", "fileOpen");
    oPressed = false;
  }
}


void drawLines() {
  if (mouseY >= 90) {
    if (mousePressed && picker == false) {
      strokeWeight(strokeSize);
      currentColor =  get(16, 61);
      stroke(currentColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}


void drawButtons() {
  noStroke();
  fill(#474e65);
  rect(0,0,width,100);
  fill(#30374f);
  rect(0,5,width,90);
  image(eyedropper, 7, 7);
  fill(#FFFFFF);
  text("CTRL+S to Save", 300, 20);
  text("CTRL+O to Open", 300, 35);
  text("CTRL+R to Restart", 300, 50);
  
}


void keyPressed() {
  if (keyCode == CONTROL && ctrlPressed == false) { 
    ctrlPressed = true;
    red = 145;
  }
  if (char(keyCode) == 'R') { 
    rPressed = true;
  }
  if (char(keyCode) == 'S') { 
    sPressed = true;
  }
  if (char(keyCode) == 'O') { 
    oPressed = true;
  }
}


void keyReleased() {
  if (keyCode == CONTROL) { 
    ctrlPressed = false;
  }
  if (char(keyCode) == 'R') { 
    rPressed = false;
  }
  if (char(keyCode) == 'S') { 
    sPressed = false;
  }
  if (char(keyCode) == 'O') { 
    oPressed = false;
  }
}

class ColorButton {

  //fields:
  int x, y;
  int w, h;
  color c;

  //constructor:
  public ColorButton (int _x, int _y, int _w, int _h, color _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }

  void draw() {
    fill(c);
    rect(x, y, w, h);
    if(currentColor == c){
      ellipse(x, y, 10, 10);
    }
  }

  void checkMouse() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h && mousePressed) {
      currentColor = c;
      fill(#000000);
      
    }
  }
}



