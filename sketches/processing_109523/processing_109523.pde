
/* @pjs preload="bg.jpg,button0.png,button1.png,icon0.png,icon1.png,icon2.png,icon3.png,icon4.png,icon5.png,icon6.png,dpad.png,dpadU.png,dpadR.png,dpadD.png,dpadL.png" */

//Flying image stuff
pngPImage[] imageArray;
final int IMG_COUNT = 7;

//Background stuff
PImage bg;
int bgX, bgY, bgXmin, bgXmax = 0, bgYmin, bgYmax = 0;

//Button Stuff
PImage[] buttonImg;
int buttonX, buttonY, buttonState = 0;
final int buttonW = 80, buttonH = 30;
final String BUTTON_TEXT = "Scramble!";

//Slider stuff
Slider speedSlider;
int sliderX, sliderY, sliderW, sliderH;
final String SLIDER_TEXT = "Speed";

//DPad stuff
PImage[] dpadImg;
int dpadX, dpadY, dpadState = 0;
final int dpadW = 81, dpadH = 81;

//Status bar stuff
int statusX, statusY;
float runtime;

void setup() {
  size(500, 500);
  frameRate(30);
  
  //Sets up background
  bg = loadImage("bg.jpg");
  bgX = 0;
  bgY = 0;
  bgXmin = width - bg.width;
  bgYmin = height - bg.height;
  
  //Sets up flying images.
  imageArray = new pngPImage[IMG_COUNT];
  for (int i = 0; i < IMG_COUNT; i++) {
    imageArray[i] = new pngPImage("icon" + i + ".png");
  }
  
  //Sets up button.
  buttonX = 250;
  buttonY = 430;
  buttonImg = new PImage[]{loadImage("button0.png"),
                           loadImage("button1.png")};
  
  //Sets up slider.
  sliderX = 250;
  sliderY = 460;
  sliderW = 100;
  sliderH = 25;
  speedSlider = new Slider(sliderX, sliderY, sliderW, sliderH, SLIDER_TEXT, 0.1);
  
  //Sets up dpad.
  dpadX = 350;
  dpadY = 435;
  dpadImg = new PImage[]{loadImage("dpad.png"),
                         loadImage("dpadU.png"),
                         loadImage("dpadR.png"),
                         loadImage("dpadD.png"),
                         loadImage("dpadL.png")};
                         
  statusX = 150;
  statusY = height - 7;  
}
  
void draw() {
  //Draws background
  imageMode(CORNER);
  image(bg, bgX, bgY);
  
  //Draws and moves images around
  for (int i = 0; i < IMG_COUNT; i++) {
    imageArray[i].moveRandom();
    imageArray[i].display();
  }
  
  //Draws slider
  speedSlider.display();
  
  //Draws button and dpad
  imageMode(CENTER);
  image(buttonImg[buttonState], buttonX, buttonY);
  image(dpadImg[dpadState], dpadX, dpadY);
  
  //Draws status bar
  rectMode(CENTER);
  fill(0, 150);
  rect(statusX, statusY, statusX*2+1, (height-statusY)*2);
  
  //Draws text on button and status bar.
  fill(255);
  textAlign(CENTER, CENTER);
  text(BUTTON_TEXT, buttonX, buttonY);
  int runtime = int(millis()/1000);
  text("Runtime " + runtime + " seconds. BG Viewframe: " + (width - bgX) + "x" + (height - bgY), statusX, statusY);
}

void mousePressed() {
  //Scramble button listener
  if (mouseInRectangle(buttonX, buttonY, buttonW, buttonH))
      buttonState = 1;
  
  //Sluder listener
  if (mouseInRectangle(sliderX, sliderY, sliderW, sliderH)) {
    speedSlider.setUpdating(true);
    speedSlider.update();
    for (int i = 0; i < IMG_COUNT; i++)
      imageArray[i].setSpeedMult(speedSlider.getBar()*10);
  }

  
  //Pad dpad listener
  if (mouseInRectangle(dpadX, dpadY, dpadW, dpadH)) {
    if (mouseInRectangle(dpadX, dpadY - dpadH/3, dpadW/3, dpadH/3))
      dpadState = 1;
    else if (mouseInRectangle(dpadX + dpadW/3, dpadY, dpadW/3, dpadH/3))
      dpadState = 2;
    else if (mouseInRectangle(dpadX, dpadY + dpadH/3, dpadW/3, dpadH/3))
      dpadState = 3;
    else if (mouseInRectangle(dpadX - dpadW/3, dpadY, dpadW/3, dpadH/3))
      dpadState = 4;
  }
}

void mouseDragged() {
  if (speedSlider.getUpdating()) {
  speedSlider.update();
  for (int i = 0; i < IMG_COUNT; i++)
    imageArray[i].setSpeedMult(speedSlider.getBar()*5);
  }
}

void mouseReleased() {
  int oldDpadState = dpadState;
  //Releases all held things
  buttonState = 0;
  dpadState = 0;
  speedSlider.setUpdating(false);
  
  //Activates button pressed event if button released after being pressed.
  if (mouseInRectangle(buttonX, buttonY, buttonW, buttonH)) {
    for (int i = 0; i < IMG_COUNT; i++)
      imageArray[i].scrambleMagnitude();
  }
  
  
  
  //Activates dpad pressed event if dpad released after being pressed.
  if (oldDpadState == 0);
  else if (oldDpadState == 1 && bgY + 20 <= bgYmax &&
           mouseInRectangle(dpadX, dpadY - dpadH/3, dpadW/3, dpadH/3))
    bgY += 20;
  else if (oldDpadState == 2 && bgX - 20 >= bgXmin &&
           mouseInRectangle(dpadX + dpadW/3, dpadY, dpadW/3, dpadH/3))
    bgX -= 20;
  else if (oldDpadState == 3 && bgY - 20 >= bgYmin &&
           mouseInRectangle(dpadX, dpadY + dpadH/3, dpadW/3, dpadH/3))
    bgY -= 20;
  else if (oldDpadState == 4 && bgX + 20 <= bgXmax &&
           mouseInRectangle(dpadX - dpadW/3, dpadY, dpadW/3, dpadH/3))
    bgX += 20;
}

//Returns true if mouse is in the region of pass rectangle (CENTER MODE)
boolean mouseInRectangle(int x, int y, int w, int h) {
  return (mouseX >= x - w/2 && mouseX <= x + w/2 &&
          mouseY >= y - h/2 && mouseY <= y + h/2);
}
class Slider {
  int x, y, w, h;
  boolean updating;
  float bar;
  String label;
  
  Slider(int x, int y, int w, int h, String label, float f) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.bar = f;
    updating = false;
  }
  
  void setBar(float f) {
    this.bar = f;
  }
  
  void setUpdating(boolean b) {
    updating = b;
  }
  
  float getBar() {
    return bar;
  }
  
  boolean getUpdating() {
    return updating;
  }
  
  void update() {
    float newBar = norm(mouseX, x - w/2, x + w/2);
    if (newBar < 0)
      bar = 0;
    else if (newBar > 1)
      bar = 1;
    else
      bar = newBar;
  }
  
  void display() {    
    //Underbox
    fill(0, 90);
    rectMode(CENTER);
    rect(x, y, w, h);
    
    //Overbox
    fill(0, 180);
    rect(x - (w-w*bar)/2, y, w*bar, h);
    
    //Label
    fill(255);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
}
class pngPImage {
  PImage img;
  int x, y, xV, yV, xBound, yBound;
  float speedMult;
  
  public pngPImage(String fileName) {
    img = loadImage(fileName);
    xBound = width-img.width;
    yBound = height-img.height;
    x = (int) random(xBound);
    y = (int) random(yBound);
    scrambleMagnitude();
    speedMult = 1;
  }
  
  void display() {
    imageMode(CORNER);
    image(img, x, y);
  }
  
  void moveRandom() {
    if (x > xBound) {
      xV *= -1;
      x = xBound;
    }
    else if (x < 0) {
      xV *= -1;
      x = 0;
    }
    if (y > yBound) {
      yV *= -1;
      y = yBound;
    }
    else if (y < 0) {
      yV *= -1;
      y = 0;
    }
    x += xV*speedMult;
    y += yV*speedMult;
  }
  
  void scrambleMagnitude() {
    do {
      xV = (int) random(-5, 5);
    } while (xV == 0);
    do {
      yV = (int) random(-5, 5);
    } while (yV == 0);
  }
  
  void setSpeedMult(float f) {
    speedMult = f;
  }
}


