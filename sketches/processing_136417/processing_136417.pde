


/*
My goal with this assignment was to create a polar clock, but instead, 
I got sidetracked playing around with circles going around in circles 
(trying to figure out the trigonometry) and couldn't stop.
I don't know exactly what this is, but it's kind of mesmerizing.
It has sliders, control buttons and even a 2D array for the color palettes
See what happens when you move the sliders 
(between 6º and 7º,  the circles seem to change direction)
and please give it a minute to load - it will run eventually.

References:
sliders: http://rotormind.com/processing/slider_test.pde
buttons: http://processing.org/examples/button.html
trigonometry: http://www.processing.org/tutorials/trig/
2D arrays: http://www.processing.org/tutorials/2darray/
Unicode greek: http://en.wikipedia.org/wiki/Greek_alphabet#Greek_in_Unicode
modulo: http://www.processing.org/reference/modulo.html
download: https://www.dropbox.com/s/pxlzsv1u6snj0xd/Assignment2.zip
*/

// screen variables
int width = 1280;
int height = 720;

//circle variables
int angle;
int paletteNum;
float cx = 100 + width / 2.0;
float cy = height / 2.0;
float px, py;
float theta = -radians(90); // start drawing the circles at the top of the stop button

// control button variables
int stopBtnRadius = 100;
//control button colors
color stopBtnHighlight;
color stopBtnColor;
color resetBtnHighlight;
color resetBtnColor;
// control button booleans
boolean paused;
//boolean overStopBtn;
boolean stopBtnOver;
//boolean overResetBtn;
boolean resetBtnOver;

// sliders
VSlider changeThetaSlider;
VSlider swapPaletteSlider;

//color palette arrays
color reds[] =  {#FF0000, #C91000, #8E0000, #FD3F49, #FD7279};
color yellows[] =  {#FFDF00, #BFAE30, #A69100, #FFE740, #FFEE73 };
color greens[] =  {#15DE00, #36A72A, #0E9100, #4DEF3C, #78EF6B };
color blues[] = {#5449FA, #2A1FD8, #0D0771, #4177E1, #6C93E1};
color oranges[] =  {#FF6F00, #BF6E30, #A64800, #FF9340, #FFB073};
color purples[] =  {#FF00EE, #C500B4, #750062, #E239D4, #E266D8};
//put all the palettes into a 2D array for easier access
color palettes[][] =  {reds, yellows, oranges, blues, purples, greens};

// used to create font
PFont myFont;

void setup(){
  size(width, height);
  frameRate(30);
  ellipseMode(CENTER);
  colorMode(HSB, 60);
  //the sliders
  changeThetaSlider = new VSlider (40, 190, 50, 450);
  changeThetaSlider.setValue(0);
  swapPaletteSlider = new VSlider (150, 190, 50, 450);
  swapPaletteSlider.setValue(0);
  //the buttons
  resetBtnColor = #ED841C;
  stopBtnColor = #00A287;
  resetBtnHighlight = #ECF722;
  stopBtnHighlight = #15FF00;
  background (#2A4D92);
  // generate processing font from system font
  myFont = createFont("CourierBold", 24, true);
  textFont(myFont);
  textAlign(CENTER);
}

void draw(){
  stroke(20);
 
  // check if mouse is over a button  
  updateBtn(mouseX, mouseY);
  
  // Slider function
  changeTheta();
  
  // draw the start screen
  displayStartScreen();
  
  // draw the circles
  drawCircles();
}

// Function to draw the start screen
void displayStartScreen(){
  // draw control buttons
  drawresetBtn();
  drawStopBtn();

   // display sliders 
   displaySliderText();
   swapPaletteSlider.display();
   changeThetaSlider.display(); 
}

// Function to draw the reset button
void drawresetBtn(){
  setBtnColor(resetBtnOver, resetBtnColor, resetBtnHighlight);
  rect(40, 20, 160, 75);
  noFill();
  rect(50, 30, 140, 55);
  fill(0);
  text("RESET", 120, 70);  
  
}

// Function to draw the stop button
void drawStopBtn(){
  setBtnColor(stopBtnOver, stopBtnColor, stopBtnHighlight);
  ellipse(cx, cy, stopBtnRadius, stopBtnRadius);
  fill(#030F6F);
  if (paused == false){text("STOP", cx, cy + 10);}
  else {text("START", cx, cy + 10);}
}

// Function to display text for the sliders
void displaySliderText(){
  fill(#FFBB00);
  text(angle + "º", 67, 170);
  // put palette names into a string array
  String innerRingPalette[] =  {"reds", "yellows", "oranges", "blues", "purples", "greens"};
  text(innerRingPalette[paletteNum], 175, 170);
  // use unicode for delta theta (change in theta)
  text("\u0394\u03B8       inner-ring", 141, 670); 
  text("palette", 177, 700); 
}

// Function to have circles go in circles(?)
void Circles(int w, float radius,  color col){
  fill(col);
  px = cx + cos(theta)*(radius);
  py = cy + sin(theta)*(radius);    
  // draw outer ellipse
  ellipse(px, py, w, w);
  // draw inner ellipse with random color
  fill(palettes[int(random(6))][int(random(5))]);
  ellipse(px, py, w/5, w/5);
}

// Function to draw circles with randomized colors and slider-controlled palettes
void drawCircles(){
  fill(0);
  // x and y coordinates
  int xPos[] = {-50, 55, -65, 80, -90, 105};
  int yPos[] = {-75, 125, -180, 250, 325, 405};
  // if not paused, button text says 'stop' 
  if (paused == false){
 
     // change the palettes with the slider 
     for (int i = 0; i < 6;  i++){
       
       // slider values are between 0 and 1 so divide by 6 to get 6 palette numbers
       if (swapPaletteSlider.getValue() > i/6.0 && swapPaletteSlider.getValue() <= (1+i)/6.0 ){paletteNum = i;}
       // when (paletteNum + i) reaches 6 (out of bounds) use modulo to return to zero 
       Circles(xPos[i], yPos[i], (palettes[(paletteNum + i) % 6][int(random(5))]));

       // update and draw the slider
       swapPaletteSlider.update();
       swapPaletteSlider.display();       
      }
      
  }
}

// Function to determine if the mouse is over the stop button
boolean overStopBtn(){
  // distance of the mouse to the stop button
  float disX = (int)cx - mouseX;
  float disY = (int)cy - mouseY;
  // determine if the mouse is over the stop button
  if (sqrt(sq(disX) + sq(disY)) < stopBtnRadius/2 ) {return true;}
  else{return false;}
}

// Function to determine if the mouse is over the reset button
boolean overResetBtn(){
  if (mouseX > 40 && mouseY > 20  && mouseX < 200 && mouseY < 95) {return true;}
  else {return false;}
}

// code that happens when the mouse is clicked on a button   
void mousePressed(){
  // if mouse clicked on stop button, stop everything
  if (stopBtnOver) {paused = !paused;}
  
 // if mouse clicked on reset button, stop everything and redraw the start screen
  if (resetBtnOver) {
    paused = true;
    background (#2A4D92);
    displayStartScreen();

  }
}

// Function to set control button colors
void setBtnColor(boolean btnOver, color btnColor, color btnHighlightColor){
  if (btnOver) {fill(btnHighlightColor);
  } else {fill(btnColor);}
}

// Function to keep track of the control buttons' boolean states
void updateBtn(int x, int y){
  if (overStopBtn()){
    stopBtnOver = true;
    resetBtnOver = false;
    cursor(HAND);
  }else if (overResetBtn()){
    resetBtnOver = true;
    stopBtnOver = false;
    cursor(HAND);  
  }else{
    resetBtnOver = stopBtnOver = false;
    cursor(ARROW);
   }
}

// Function to change the value of theta (the angle the circles are moving in) with the slider
void changeTheta(){
  // keep the change between 3 and 12 degrees (more interesting)
  for (int i = 0; i < 10;  i++){
    // make 10 slider values between 0 and 1 
    if(changeThetaSlider.getValue() >= i*0.10) {
      // have those values read between 12 and 3
      angle = 12 - (1*i);
      theta += radians(angle);
      // this prevents text overwriting
      noStroke();
      fill(#2A4D92); //background color
      rect(5, 640, 230, 100);
      rect(5, 140, 230, 50);    
     } 
    // update and draw the slider
    changeThetaSlider.update();
    changeThetaSlider.display();
   }
}  
// adapted from: http://rotormind.com/processing/slider_test.pde

class ColorScheme {

  color bar_outline = color(0, 0, 0);
  color slider_fill; //  =  (100, 100, 100);
  color bar_hover; // =  (100, 200, 200);
  color bar_background = color(0, 150, 200);
  color slider_press; // = (255, 255, 255);
  
  color sliderColors (color sliderColor,  int x){       
    for (int i = 0; i < 6;  i++){
        sliderColor = palettes[paletteNum][x];
      }
    return sliderColor;
  }

}

/* global colorscheme, change colors above */
/* to change instance colors, subclass and overwrite */
ColorScheme global_cs = new ColorScheme();

class VSlider
{
  int barWidth, barHeight; // width and height of bar. NOTE: barWidth also used as slider button height.
  int Xpos, Ypos;          // upper-left position of bar
  float Spos, newSpos;     // y (upper) position of slider
  int SposMin, SposMax;    // max and min values of slider
  boolean over;            // True if hovering over the Slider
  boolean locked;          // True if a mouse button is pressed while on the Slider
  int roundRad = 5;             // radius of rounded rectangle for thumb

  ColorScheme cs = global_cs;
  color barOutlineCol  = cs.bar_outline;
  color barFillCol     = cs.bar_background;
  color sliderFillCol  = cs.slider_fill;
  color barHoverCol    = cs.bar_hover;
  color sliderPressCol = cs.slider_press;


  VSlider (int X_start, int Y_start, int bar_width, int bar_height) {
    barWidth = bar_width;
    barHeight = bar_height;

    Xpos = X_start;
    Ypos = Y_start;
    Spos = Ypos + barHeight/2 - barWidth/2; // center it initially
    newSpos = Spos;
    SposMin = Ypos;
    SposMax = Ypos + barHeight - barWidth;
  }

  void update() {
    over = overit();
    if (mousePressed && over) locked = true; 
    else locked = false;

    if (locked) {
      newSpos = constrain(mouseY-barWidth/2, SposMin, SposMax);
    }
    Spos = newSpos;
  }

  // Return true if mouse is over thumb of slider
  boolean overit() {
    if (mouseX > Xpos && mouseX < Xpos+barWidth &&
      mouseY > Ypos && mouseY < Ypos+barHeight) {
      return true;
    } 
    else {
      return false;
    }
  }


  void display() {
    stroke(barOutlineCol);
    fill(barFillCol);
    rect(Xpos, Ypos, barWidth, barHeight);
    if (over) {
      fill(barHoverCol);
      //change barHoverCol to second color of inner-ring palette
      barHoverCol  = cs.sliderColors(barHoverCol, 1);
    }  
    
    if (locked) {
      fill(sliderPressCol);
      //change sliderPressColor to first color of inner-ring palette
      sliderPressCol = cs.sliderColors(sliderPressCol,  0);       

    }
    if (!over && !locked) {
      fill (sliderFillCol);
      //change sliderFillCol to third color of inner-ring palette
      sliderFillCol = cs.sliderColors (sliderFillCol,  2); 

    }
    if (abs(Spos-newSpos)>0.1) fill (sliderPressCol);
    rect(Xpos, Spos, barWidth, barWidth,roundRad);
  }
  
  float getValue() {
    // Convert slider position Spos to a value between 0 and 1
    return (Spos-Ypos) / (barHeight-barWidth);
  }

  // set the value of this slider
  void setValue(float value) {
    // convert a value (0 to 1) to slider position Spos
    if (value<0) value=0.0;
    if (value>1) value=1.0;
    Spos = Ypos + ((barHeight-barWidth)*value );
    newSpos = Spos;
  }

}
    

