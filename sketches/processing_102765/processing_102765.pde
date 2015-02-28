
// Speed the lines fade at
// Menu object
Menu menu;
// Used to open menu
boolean MENU;
// Used to show instructions
boolean INSTRUCTIONS;
PImage instructions;

// Arraylist to hold lines in
ArrayList lines;
// Cached lines for operating on indvidual arraylist elements
EndlessLine el;
EndlessLine el2;

// Max number of endless lines
int MaxLines;
// Current line being drawn
int CurrentLine;

// How fast the lines fade in the background
int Fade;


void setup()
{
  size(480, 720);
  //size(640,960);
  colorMode(HSB,255,255,255,255);
  background(0);
  
  // Init menu and turn it on to start
  menu = new Menu();
  MENU = false;
  
  INSTRUCTIONS = true;
  instructions = loadImage("instructions.jpg");
  
  // Maximum number of lines  
  MaxLines = 5; 
  
  // Init lines arrayList
  lines = new ArrayList();
  // Add 5 lines to it
  for(int i=0; i<MaxLines; i++) {
    lines.add(new EndlessLine());
  } 
  
  // Set the initial fade speed
  Fade = 2;
  // Set the menus fade slider to reflect initial fade speed
  menu.SetFadeSlider();
}

void draw()
{
  if(INSTRUCTIONS) {
    image(instructions,0,0,width,height);
  }
  // If the menu is open, draw the menu
  if(MENU) {
    menu.DrawMenu();
  }
  // If the menu isn't open
  else {
    // For each line in the arrayList lines:
    for(int i=0; i<lines.size(); i++) {
      el = (EndlessLine) lines.get(i);
      // If the line is set to be drawn
      if(el.DrawMe)
        // Draw the line
        el.Draw();
    }
    fadeScreen();
  }
}

void mousePressed() {
  if(INSTRUCTIONS) {
    INSTRUCTIONS = !INSTRUCTIONS;
    clearScreen();
  }

  // Press the very top of screen for menu
  if(mouseY<40) {
    // Open the menu
    MENU = !MENU;
    // Set the sliders in the menu reflect the initial
    // values of the lines
    menu.SetMenuElements();
    // Clear the screen
    clearScreen();
  }
  // If pressed not at the very top of the screen
  else {
    // If the menu is open
    if(MENU) {
      // Check to see if any of the buttons or tabs are pressed
      menu.CheckMenuElements();
    } 
    // If the menu isn't open
    else {
      // Set el2 to the current line we want to draw
      el2 = (EndlessLine) lines.get(CurrentLine);
      // Make sure it doesn't draw before we are done it
      el2.DrawMe = false;
      // Reset its length so it starts recording at the beginning
      el2.animLength = 0;
      // Reset the index so when it does draw it will start at the beginning
      el2.animIndex = 0;
      // Increment CurrentLine so that the 
      // next time we draw, it will be a different line
      CurrentLine = (CurrentLine + 1) % MaxLines;
    }
  }
}
void mouseDragged()
{
  // As long as the menu isn't open
  if(!MENU && el2 != null) {
    // Set the stroke colour and weight to that of el2
    stroke(el2.Hue,el2.Saturation,el2.Brightness,el2.Alpha);
    strokeWeight(el2.LineWeight);
    // Draw a line between the last and current mouse position
    line(pmouseX,pmouseY,mouseX,mouseY);
    // Create a PVector of the current mouse position
    PVector point = new PVector(mouseX,mouseY);
    // Add that PVector to el2's lineArray
    el2.AddPoint(point);
  }
  // If the Menu is open
  else {
    // Set the values from the sliders to the line
    menu.SetLineValues();
  }
}

void mouseReleased()
{
  // As long as the menu isn't open
  if(!MENU && el2 != null) {
    // If the line is too short
    if(el2.animLength < 2) {
      // Remove the most recently added line
      lines.remove(lines.size()-1);
      // Add a new one to replace it
      lines.add(new EndlessLine());
    }
    // If the line isn't too short
    else {
      // Set the offset of the line
      el2.SetOffset();
      // Set the line as ready to draw
      el2.DrawMe = true;
    }
  }
  else {
    // Set the values from the sliders to the line
    menu.SetLineValues();
  }
}

// Draw a black rectangle the size of the screen
void clearScreen() {
  noStroke();
  fill(0);
  rect(0,0,width,height);
}
// Draw a black rectangle the size of the screen
// with Fade as the alpha value
void fadeScreen() {
  noStroke();
  fill(0,0,0,Fade);
  rect(0,0,width,height);
}

// Taken from SonicPainter App
void brush5(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
//  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
//  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
//  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
//  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}
//********************//
//    Endless Line    //
//********************//
/*  Takes a drawn line into an array, then draws that array
    repeatedly starting where the last line left off.        */

class EndlessLine {
  
  // Holds line information
  PVector[] lineArray;
  // What we actually draw the lines between
  PVector lineStart, lineEnd;
  // How far to move before drawing the next line
  PVector offset;
  // Offset multiplier, moves beginning of new line
  // to end of last line
  int cycles;
  // Where in the animation of the line we are
  int animIndex;
  // Where in the recording of the line we are
  boolean DrawMe = false;
  // Length of the line animation
  int animLength;
  
  // Whether to cycle colour
  boolean cycleColour;
  // Speed line changes colour
  float colourCycleSpeed;
  // Line attributes
  float Hue, Saturation, Brightness, Alpha, LineWeight;
  
  // Constructor
  EndlessLine() {
    // Array of points that lines are drawn between
    lineArray = new PVector[200];
    // Point to start drawing line at
    lineStart = new PVector(0,0);
    // Point to end drawing line at
    lineEnd = new PVector(0,0);
    // Initial line attributes
    Hue = (int)random(255);
    Saturation = 255;
    Brightness = 255;
    Alpha = 255;
    cycleColour = true;
    colourCycleSpeed = 0.25;
    LineWeight = 3;
  }
  
  // Adds a point to the lineArray
  void AddPoint(PVector newPoint) {
    // Add point to array
    lineArray[animLength] = newPoint;
    // Advance the position to add new points to,
    // wrapping around the total length of the array
    animLength = (animLength + 1) % lineArray.length;
  }
  
  // Sets the offset size so that the next line will start
  // at the end of the first
  void SetOffset() {
    // Resets the offset multiplier
    cycles = 0;
    // Calculates the offset from the end of the line to the beginning
    PVector _offset = new PVector(lineArray[animLength - 1].x - lineArray[0].x,
                                    lineArray[animLength - 1].y - lineArray[0].y);
    // Sets the offset
    offset = _offset;
  }
  
  // Draw line data
  void Draw () {
    // Set drawing points based on lineArray 
    // + (offset * cycles) to continuosly begin the new line at the end of the last one 
    // % to width or height to wrap around right and bottom
    // the following if statement wraps around the top and left sides
    if(cycleColour)
      Hue = (Hue + colourCycleSpeed) % 255;
    lineStart.x = (lineArray[animIndex].x + (offset.x * cycles)) % width;
    if(lineStart.x < 0)
      lineStart.x += width;
    lineStart.y = (lineArray[animIndex].y + (offset.y * cycles)) % height;
    if(lineStart.y < 0)
      lineStart.y += height;
    lineEnd.x = ((int)(lineArray[((animIndex + 1) % animLength)].x + (offset.x * cycles))) % width;
    if(lineEnd.x < 0)
      lineEnd.x += width;
    lineEnd.y = ((int)(lineArray[((animIndex + 1) % animLength)].y + (offset.y * cycles))) % height;
    if(lineEnd.y < 0)
      lineEnd.y += height;
        
    // Cycle through lineArray
    animIndex = (animIndex + 1) % (animLength - 1);
    // Iterate cycles to keep up with moving line 
    if(animIndex == 0)
      cycles++;
      
    // Sets the colour values of the line
    stroke(Hue,Saturation,Brightness,Alpha);
    // if the length of the line to draw is more than half the width, don't draw it
    // this protects against drawing lines across the screen when wrapping around
    if(abs(lineStart.dist(lineEnd)) < (width * 0.5)) {
      //line(lineStart.x,lineStart.y,lineEnd.x,lineEnd.y);
      brush5(lineStart.x,lineStart.y,lineEnd.x,lineEnd.y,LineWeight);
    }
  }
}

class Menu {
  EndlessLine eLine;
  int lineOperatingOn;
  // Image for menu text
  PImage menuText;
  
  // Tabs to switch between lines
  ArrayList tabs;
  // Cached tab used to access individual lines in arrayList
  Tab t;
  
  // This button turns the colour cycling on and off
  Button colourCycleButton;
  // This button resets the line currently being operated on
  Button animationResetButton;
  
  // Sliders to adjust line colour attributes and volume with
  ArrayList sliders;
  // Cached slider to access individual lines in arrayList
  HScrollbar slider;
  // X location and width of sliders
  int scrollX, scrollW;
  
  // Sliders to adjust world values with
  HScrollbar fadeSlider;
  
  // Constructor
  Menu() {
    menuText = loadImage("menu.png");
    
    // Sets the x location and width of sliders
    scrollX = (int)(width * 0.125);
    scrollW = (int)(width * 0.75);
    
    // Inits arrayList of tabs
    tabs = new ArrayList();
    // Adds and places 5 tabs to the arrayList
    for(int i=0; i<5; i++) {
      tabs.add(new Tab(i * (width/5),height - 100, width/5, 100));
    }
    
    // Init and place buttons and fadeSlider
    colourCycleButton = new Button((int)(width * 0.796),(int)(height * 0.18), 50, 50);
    animationResetButton = new Button((int)(width * 0.125),(int)(height * 0.18), 50, 50);
    fadeSlider = new HScrollbar(scrollX,(int)(height * 0.12),scrollW,25,25);
    
    // Init arrayList of line attribute sliders
    sliders = new ArrayList();
    // Adds and places 6 sliders to the arrayList
    for(int i=0; i<6; i++) {
      sliders.add(new HScrollbar(scrollX,(height/10) * (i+3),scrollW, 25,25));
    } 
  }
  
  // Draw the menu
  void DrawMenu() {
    // Make sure we have the current line we are operating on
    eLine = (EndlessLine) lines.get(lineOperatingOn);
    
    // Draw the current line behind the menu
    if(eLine.animLength > 0) {
      // Draw the line
      eLine.Draw();
      // Fade it out
      fadeScreen();
    }
    
    // Draw the tabs
    for(int i=0; i<tabs.size(); i++) {
      // Get the current tab
      t = (Tab) tabs.get(i);
      // If it is the tab we are currently working in set its
      // tabSelected bool to true, or false if it is not
      if(i == lineOperatingOn)
        t.tabSelected = true;
      else
        t.tabSelected = false;
      // Draw the tabs
      t.DrawTab();
    }
    
    // Draw and update the fade slider
    fadeSlider.update();
    fadeSlider.display();
    
    // Draw and update the line sliders
    for(int i=0; i<sliders.size(); i++) {
      slider = (HScrollbar) sliders.get(i);
      slider.update();
      slider.display();
    }
    // Draw the two buttons
    colourCycleButton.DrawButton();
    animationResetButton.DrawButton();
    
    image(menuText,0,0,width,height);
  }
  
  // Checks to see if the buttons or tabs have been pressed
  // and provides their functionality
  void CheckMenuElements() {
    // The mouse is over the button
    if(animationResetButton.OverButton()) {
      // Set the button timer
      animationResetButton.pushTime = millis();
      animationResetButton.buttonPushed = true;
      
      eLine.animLength = 0;
      eLine.DrawMe = false;
      CurrentLine = lineOperatingOn;
      clearScreen();
    }
    if(colourCycleButton.OverButton()) {
      // Button Pushed
      colourCycleButton.pushTime = millis();
      colourCycleButton.buttonPushed = true;
      
      // Button Functionality
      eLine.cycleColour = !eLine.cycleColour;
    }
    
    for(int i=0; i<tabs.size(); i++) {
      t = (Tab) tabs.get(i);
      if(t.OverTab()) {
        lineOperatingOn = i;
        clearScreen();
        SetMenuElements();
      }
      
    }
//    }
  }
  
  void SetLineValues() {
    eLine = (EndlessLine) lines.get(lineOperatingOn);
    for(int i=0; i<sliders.size(); i++) {
      // Set fade speed from fadeSlider
      Fade = (int) map(fadeSlider.getPos(),scrollX,scrollX+scrollW,0,100);
      
      // Set line values from slider array
      slider = (HScrollbar) sliders.get(i);
      if(slider.locked) {
        switch(i) {
          case 0:
            eLine.colourCycleSpeed = map(slider.getPos(),scrollX,scrollX+scrollW,0,10);
            break;
          case 1:
            eLine.Hue = map(slider.getPos(),scrollX,scrollX+scrollW,0,255);
            break;
          case 2:
            eLine.Saturation = map(slider.getPos(),scrollX,scrollX+scrollW,0,255);
            break;
          case 3:
            eLine.Brightness = map(slider.getPos(),scrollX,scrollX+scrollW,0,255);
            break;
          case 4:
            eLine.Alpha = map(slider.getPos(),scrollX,scrollX+scrollW,0,255);
            break;
          case 5:
            eLine.LineWeight = map(slider.getPos(),scrollX,scrollX+scrollW,1,10);
            break;
          default:
            eLine.colourCycleSpeed = map(slider.getPos(),scrollX,scrollX+scrollW,0,10);
            break;
        }
      }
    }
  }
  
  void SetFadeSlider() {
    fadeSlider.setPos(map(Fade,0,100,scrollX,scrollX+scrollW));
  }
  // Sets sliders to reflect the values of the lineOperatingOn being operated on
  void SetMenuElements() {
    eLine = (EndlessLine) lines.get(lineOperatingOn);
    for(int i=0; i<sliders.size(); i++) {
      slider = (HScrollbar) sliders.get(i);
      switch(i) {
        case 0:
          slider.setPos(map(eLine.colourCycleSpeed,0,10,scrollX,scrollX+scrollW));
          break;
        case 1:
          slider.setPos(map(eLine.Hue,0,255,scrollX,scrollX+scrollW));
          break;
        case 2:
          slider.setPos(map(eLine.Saturation,0,255,scrollX,scrollX+scrollW));
          break;
        case 3:
          slider.setPos(map(eLine.Brightness,0,255,scrollX,scrollX+scrollW));
          break;
        case 4:
          slider.setPos(map(eLine.Alpha,0,255,scrollX,scrollX+scrollW));
          break;
        case 5:
          slider.setPos(map(eLine.LineWeight,1,10,scrollX,scrollX+scrollW));
          break;
        default:
          slider.setPos(map(eLine.colourCycleSpeed,0,10,scrollX,scrollX+scrollW));
          break;
      }
    }
    //println(map(eLine.colourCycleSpeed,0,10,scrollX,scrollX+scrollW));

  }
}

//********************//
//       Button       //
//********************//
// based on code at http://processing.org/examples/button.html
class Button {
  int x, y, w, h;
  float pushTime;
  boolean buttonPushed;
  
  Button(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    buttonPushed = false;
  }
  void DrawButton() {
    strokeWeight(1);
    stroke(100);
    if(buttonPushed) {
      fill(150);
      if(millis() - pushTime > 300)
        buttonPushed = false;
    }
    else
      fill(200);
    rect(x,y,w,h);
  }
  boolean OverButton()  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else
      return false;
  }
}

//********************//
//        Tabs        //
//********************//
// based on code at http://processing.org/examples/button.html
class Tab {
  int x, y, w, h;
  float pushTime;
  boolean tabSelected;
  
  Tab(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    tabSelected = false;
  }
  void DrawTab() {
    strokeWeight(1);
    stroke(100);
    if(tabSelected)
      fill(150);
    else
      fill(200);
    rect(x,y,w,h);
  }
  boolean OverTab()  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else
      return false;
  }
}

//********************//
//     HScrollbar     //
//********************//
// Taken directly from http://processing.org/examples/scrollbar.html
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos;// + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos);
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(0,0,204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 100);
    } else {
      fill(0, 0, 150);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  void setPos(float value) {
    newspos = constrain(value,sposMin,sposMax);
  }
}



