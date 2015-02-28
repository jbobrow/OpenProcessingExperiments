
import controlP5.*;           // Import library for sliders (http://www.sojamo.de/libraries/controlP5/)
import processing.net.*;      // Import library for sockets

ControlP5 controlP5;          // Declare library for sliders
Client myClient;              // Declare socket connection

ImageButtons turnLeft;        // Declare image buttons
ImageButtons turnRight;
ImageButtons holdForward;
ImageButtons holdReverse;
ImageButtons stepForward;
ImageButtons stepReverse;
ImageButtons spinLeft;
ImageButtons spinRight;
ImageButtons spinLeftStep;
ImageButtons spinRightStep;
//ImageButtons camUp;
//ImageButtons camDown;

int straight     = 1;         // Declare variables for sliders
int straightstep = 1;
int outerturn    = 1;
int innerturn    = 1;
int spinhold     = 1;
int spinstep     = 1;

int sliderOffsetX = 20;       // Variables for position and size of sliders
int sliderOffsetY = 220;
int sliderWidth   = 100;
int sliderHeight  = 10;

String[] forwardArray = new String[8];  //Declare arrays which contain Lego PF speeds
String[] reverseArray = new String[8];

void setup()
{
  size(205, 480);                                      // Set size of canvas
  background(255);                                     // Set white background
  controlP5 = new ControlP5(this);                     // Initialize library for sliders
  
  myClient = new Client(this, "10.0.0.18", 2000);   // Open socket connection
  
  controlP5.setColorLabel(0x00ff0000);                 // Set colors for sliders
  controlP5.setColorValue(0xffffffff);
  controlP5.setColorForeground(0xffff0000);
  controlP5.setColorBackground(0xff660000);

  forwardArray[0] = "08";    // Fill Lego PF speed arrays
  forwardArray[1] = "01";
  forwardArray[2] = "02";
  forwardArray[3] = "03";
  forwardArray[4] = "04";
  forwardArray[5] = "05";
  forwardArray[6] = "06";
  forwardArray[7] = "07";
  
  reverseArray[0] = "08";
  reverseArray[1] = "15";
  reverseArray[2] = "14";
  reverseArray[3] = "13";
  reverseArray[4] = "12";
  reverseArray[5] = "11";
  reverseArray[6] = "10";
  reverseArray[7] = "09";
  
  // Initialize sliders
  Slider s1 = controlP5.addSlider("straight"    , 0, 7, 1, sliderOffsetX, sliderOffsetY + 0,   sliderWidth, sliderHeight);
  Slider s2 = controlP5.addSlider("straightstep", 0, 7, 1, sliderOffsetX, sliderOffsetY + 30,  sliderWidth, sliderHeight);
  Slider s3 = controlP5.addSlider("outerturn"   , 0, 7, 1, sliderOffsetX, sliderOffsetY + 60,  sliderWidth, sliderHeight);
  Slider s4 = controlP5.addSlider("innerturn"   , 0, 7, 1, sliderOffsetX, sliderOffsetY + 90,  sliderWidth, sliderHeight);
  Slider s5 = controlP5.addSlider("spinhold"    , 0, 7, 1, sliderOffsetX, sliderOffsetY + 120, sliderWidth, sliderHeight);
  Slider s6 = controlP5.addSlider("spinstep"    , 0, 7, 1, sliderOffsetX, sliderOffsetY + 150, sliderWidth, sliderHeight);

  // Configure slider labels
  s1.captionLabel().set("Straight");      // Set label value
  s1.captionLabel().toUpperCase(false);   // Disable forced uppercase
  s2.captionLabel().set("Straight Step");
  s2.captionLabel().toUpperCase(false);
  s3.captionLabel().set("Outer Turn");
  s3.captionLabel().toUpperCase(false);
  s4.captionLabel().set("Inner Turn");
  s4.captionLabel().toUpperCase(false);
  s5.captionLabel().set("Spin Hold");
  s5.captionLabel().toUpperCase(false);
  s6.captionLabel().set("Spin Step");
  s6.captionLabel().toUpperCase(false);

  s1.setNumberOfTickMarks(8);    // Set number of ticks for sliders
  s2.setNumberOfTickMarks(8);
  s3.setNumberOfTickMarks(8);
  s4.setNumberOfTickMarks(8);
  s5.setNumberOfTickMarks(8);
  s6.setNumberOfTickMarks(8);

  // Declare and initialize the three button states
  PImage imgUp    = loadImage("controlpanelup.png");
  PImage imgHover = loadImage("controlpanelhover.png");
  PImage imgDown  = loadImage("controlpaneldown.png");
  
  // Initialize buttons
  turnLeft      = new ImageButtons(0  , 0  , 77, 78, imgUp, imgHover, imgDown);
  turnRight     = new ImageButtons(129, 0  , 79, 78, imgUp, imgHover, imgDown);
  holdForward   = new ImageButtons(78 , 0  , 50, 49, imgUp, imgHover, imgDown);
  holdReverse   = new ImageButtons(78 , 158, 50, 50, imgUp, imgHover, imgDown);
  spinLeft      = new ImageButtons(0  , 79 , 49, 50, imgUp, imgHover, imgDown);
  spinRight     = new ImageButtons(158, 79 , 50, 50, imgUp, imgHover, imgDown);
  spinLeftStep  = new ImageButtons(50 , 79 , 29, 50, imgUp, imgHover, imgDown);
  spinRightStep = new ImageButtons(129, 79 , 28, 50, imgUp, imgHover, imgDown);
  stepForward   = new ImageButtons(78 , 50 , 50, 30, imgUp, imgHover, imgDown);
  stepReverse   = new ImageButtons(78 , 128, 50, 28, imgUp, imgHover, imgDown);
 // camUp         = new ImageButtons(0  , 128, 77, 78, imgUp, imgHover, imgDown);
  //camDown       = new ImageButtons(129, 128, 79, 78, imgUp, imgHover, imgDown);
  
}

void draw()
{
  // Call update and display functions for the buttons
  // Each button is updated with the corresponding slider value
  // to form a command to be send via socket connection
  turnLeft.update("z" + forwardArray[outerturn] + reverseArray[innerturn] + "1x", "z08080x");
  turnLeft.display();
  turnRight.update("z" + forwardArray[innerturn] + reverseArray[outerturn] + "1x", "z08080x");
  turnRight.display();
  
  holdForward.update("z" + forwardArray[straight] + reverseArray[straight] + "1x", "z08080x");
  holdForward.display();
  holdReverse.update("z" + reverseArray[straight] + forwardArray[straight] + "1x", "z08080x");
  holdReverse.display();
  
  stepForward.update("z" + forwardArray[straightstep] + reverseArray[straightstep] + "0x", "");
  stepForward.display();
  stepReverse.update("z" + reverseArray[straightstep] + forwardArray[straightstep] + "0x", "");
  stepReverse.display();
  
  spinLeft.update("z" + forwardArray[spinhold] + forwardArray[spinhold] + "1x", "z08080x");
  spinLeft.display();
  spinRight.update("z" + reverseArray[spinhold] + reverseArray[spinhold] + "1x", "z08080x");
  spinRight.display();
  
  spinLeftStep.update("z" + forwardArray[spinstep] + forwardArray[spinstep] + "0x", "");
  spinLeftStep.display();
  spinRightStep.update("z" + reverseArray[spinstep] + reverseArray[spinstep] + "0x", "");
  spinRightStep.display();
  
  // The camera does not use a slider, instead,
  // it uses a fixed value in the Arduino code,
  // that is why this only needs a short value.
 // camUp.update("zu", "zs");
//  camUp.display();
 // camDown.update("zd", "zs");
//  camDown.display();
  
}

// Button class from Processing examples
class Button
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;
  
  
  void pressed() {
    if(over && mousePressed) {
      pressed = true;
    } else {
      pressed = false;
    }    
  }
  
  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}

// Image button class from Processing examples
// Modified to support:
// - sprites
// - only one action when mouse is down
// - mouse up action
// - command values for up and down state
class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;
  
  String downValue;              // Declare var for command when button is pressed
  String upValue;                // Declare var for command when button is released
  boolean mouseWasDown = false;  // Declare var to keep track of mouse state

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase.get(ix, iy, iw, ih);  // Apply sprites
    roll = iroll.get(ix, iy, iw, ih);
    down = idown.get(ix, iy, iw, ih);
    currentimage = base;
  }
  
  void update(String sDownValue, String sUpValue) 
  {
    // Set new command values for up and down state
    if(!pressed){
      downValue = sDownValue;
    }
    upValue = sUpValue;
    
    over();
    pressed();
    if(pressed) {
      if(!mouseWasDown){           // Check to make sure command is sent once
        myClient.write(downValue); // Send motor ON command via socket connection
        mouseWasDown = true;       // Make sure command will not be send again
      }
      currentimage = down;
    } else if (over){
      currentimage = roll;
    } else {
      currentimage = base;
    }
    
    if(!pressed && mouseWasDown){  // Check for mouse button release
      myClient.write(upValue);     // Send motor OFF command via socket connection
      mouseWasDown = false;        // Allow new ON command to be send again
    }
  }
  
  void over() 
  {
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() 
  {
    image(currentimage, x, y);
  }
}







