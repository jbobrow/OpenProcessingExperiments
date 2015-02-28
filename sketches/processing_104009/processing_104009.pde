
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


// Images Stuff
PImage [] images;
int pos = 0;
int currentPosition = 0;


// Audio Stuff
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

Maxim maxim;

boolean playit1;
boolean playit2;
boolean playit3;
boolean playit4;

float power=0;
float powerAve=0;
int arrayLength=0;
int numPlays=0;

int currentBeat=0;
int speed=0;

boolean[] track1;
boolean[] track2;
boolean[] track3;
boolean[] track4;
int trackPos=0;


// Dimensions
int valWidth = 1024;
int valHeight = 800;

// Rect 1 positions
int X1 = random(200, valWidth-50);
int Y1 = random(200, valHeight-50);

// Rect 2 positions
int X2 = random(200, valWidth-50);
int Y2 = random(200, valHeight-50);

// Rect 3 positions
int X3 = random(200, valWidth-50);
int Y3 = random(200, valHeight-50);

// Rect 4 positions
int X4 = random(200, valWidth-50);
int Y4 = random(200, valHeight-50);

boolean rect1;
boolean rect2;

// Colors

int r1 = 255;
int g1 = 118;
int b1 = 118;

int r2 = 249;
int g2 = 236;
int b2 = 158;

int r3 = 136;
int g3 = 200;
int b3 = 125;

int r4 = 129;
int g4 = 192;
int b4 = 236;


void setup()
{
  size(1024, 800);
  background(0);
  noStroke();

  // Draw Rect1  
  fill(r1, g1, b1);
  rect(X1, Y1, 50, 50);

  // Draw Rect2
  fill(r2, g2, b2);
  rect(X2, Y2, 50, 50);

  // Draw Rect3
  fill(r3, g3, b3);
  rect(X3, Y3, 50, 50);

  // Draw Rect24
  fill(r4, g4, b4);
  rect(X4, Y4, 50, 50);

  // Audio Setup
  frameRate(30);

  maxim = new Maxim(this);

  // Player1 - Rect1
  player1 = maxim.loadFile("daft1.wav");
  player1.setLooping(true);
  player1.setAnalysing(true);

  // Player12 - Rect2
  player2 = maxim.loadFile("daft2.wav");
  player2.setLooping(true);
  player2.setAnalysing(true);

  // Player3 - Rect3
  player3 = maxim.loadFile("fast1.wav");
  player3.setLooping(true);
  player3.setAnalysing(true);

  // Player4 - Rect4
  player4 = maxim.loadFile("fast2.wav");
  player4.setLooping(true);
  player4.setAnalysing(true);

  playit1 = false;
  playit2 = false;
  playit3 = false;
  playit4 = false;

  // Images Setup
  images = loadImages("seq/eq", ".png", 8);
}

void draw()
{
  playing1();
  playing2();
  playing3();
  playing4();

  drawEq();

  // Increase the speed count
  currentBeat++;
}

void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down

  //FIRST RECTANGLE
  if (mouseX>X1 && mouseX<(X1 + 50)) {
    if (mouseY>Y1 && mouseY<(Y1 + 50)) {
      moveRec1();
    }
  }

  //SECOND RECTANGLE
  if (mouseX>X2 && mouseX<(X2 + 50)) {
    if (mouseY>Y2 && mouseY<(Y2 + 50)) {
      moveRec2();
    }
  }

  //THIRD RECTANGLE
  if (mouseX>X3 && mouseX<(X3 + 50)) {
    if (mouseY>Y3 && mouseY<(Y3 + 50)) {
      moveRec3();
    }
  }

  //FOURTH RECTANGLE
  if (mouseX>X4 && mouseX<(X4 + 50)) {
    if (mouseY>Y4 && mouseY<(Y4 + 50)) {
      moveRec4();
    }
  }
}

void mousePressed()
{
  // code that happens when the mouse button
  // is pressed
}



void mouseReleased() {
  // code that happens when the mouse button
  // is released

    fill(0);
  rect(200, 0, width, height);

  // Repaint rectangles for remove the shadow
  repaintRec1();
  repaintRec2();
  repaintRec3();
  repaintRec4();

  // Paint a line between both squares
  //line(X1+25,Y1+25,X2+25,Y2+25);
}

void mouseClicked() {
  swicthPlay1();
  swicthPlay2();
  swicthPlay3();
  swicthPlay4();
}




/*************** Custom Functions ***************/

void repaintRec1() {
  if (playit1==false) {
    fill(r1, g1, b1);
    rect(X1, Y1, 50, 50);
  }
}

void repaintRec2() {
  if (playit2==false) {
    fill(r2, g2, b2);
    rect(X2, Y2, 50, 50);
  }
}

void repaintRec3() {
  if (playit3==false) {
    fill(r3, g3, b3);
    rect(X3, Y3, 50, 50);
  }
}

void repaintRec4() {
  if (playit4==false) {
    fill(r4, g4, b4);
    rect(X4, Y4, 50, 50);
  }
}

void moveRec1() {

  // Reset the sketch
  fill(0);
  rect(200, 0, width, height);

  // Shadow
  fill(238, 238, 238);
  rect(mouseX-23, mouseY-23, 60, 60);

  // Draw the rectangle
  fill(r1, g1, b1);
  rect(mouseX-25, mouseY-25, 60, 60);

  // Save the last position
  X1 = mouseX-25;
  Y1 = mouseY-25;

  // Draw the others rectangle
  repaintRec2();
  repaintRec3();
  repaintRec4();
}

void moveRec2() {
  // Reset the sketch
  fill(0);
  rect(200, 0, width, height);

  // Shadow
  fill(238, 238, 238);
  rect(mouseX-23, mouseY-23, 60, 60);

  // Draw the rectangle
  fill(r2, g2, b2);
  rect(mouseX-25, mouseY-25, 60, 60);
  X2 = mouseX-25;
  Y2 = mouseY-25;

  // Draw the others rectangle
  repaintRec1();
  repaintRec3();
  repaintRec4();
}

void moveRec3() {
  // Reset the sketch
  fill(0);
  rect(200, 0, width, height);

  // Shadow
  fill(238, 238, 238);
  rect(mouseX-23, mouseY-23, 60, 60);

  // Draw the rectangle
  fill(r3, g3, b3);
  rect(mouseX-25, mouseY-25, 60, 60);
  X3 = mouseX-25;
  Y3 = mouseY-25;

  // Draw the others rectangle
  repaintRec1();
  repaintRec2();
  repaintRec4();
}

void moveRec4() {
  // Reset the sketch
  fill(0);
  rect(200, 0, width, height);

  // Shadow
  fill(238, 238, 238);
  rect(mouseX-23, mouseY-23, 60, 60);

  // Draw the rectangle
  fill(r4, g4, b4);
  rect(mouseX-25, mouseY-25, 60, 60);
  X4 = mouseX-25;
  Y4 = mouseY-25;


  // Draw the others rectangle
  repaintRec1();
  repaintRec2();
  repaintRec3();
}

void playing1() {
  if (playit1) {
    player1.play(); 
    power = player1.getAveragePower();
    powerAve += power;

    // Remove previous rectangle 
    fill(0);
    rect(X1, Y1, (power*100)+100, (power*100) + 100);

    fill(r1, g1, b1);
    ellipse(X1+25, Y1+25, power*100, power*100);

    // Set Volume
    player1.volume(setVolume(Y1));
    player1.speed(setSpeed(X1));
  }
}

void playing2() {
  if (playit2) {
    player2.play(); 
    power = player2.getAveragePower();
    powerAve += power;

    // Remove previous rectangle 
    fill(0);
    rect(X2, Y2, (power*100)+100, (power*100) + 100);

    fill(r2, g2, b2);
    ellipse(X2+25, Y2+25, power*100, power*100);

    // Set Volume
    player2.volume(setVolume(Y2));
    player2.speed(setSpeed(X2));
  }
}

void playing3() {
  if (playit3) {
    player3.play(); 
    power = player3.getAveragePower();
    powerAve += power;

    // Remove previous rectangle 
    fill(0);
    rect(X3, Y3, (power*100)+100, (power*100) + 100);

    fill(r3, g3, b3);
    ellipse(X3+25, Y3+25, power*100, power*100);

    // Set Volume
    player3.volume(setVolume(Y3));
    player3.speed(setSpeed(X3));
  }
}

void playing4() {
  if (playit4) {
    player4.play(); 
    power = player4.getAveragePower();
    powerAve += power;

    // Remove previous rectangle 
    fill(0);
    rect(X4, Y4, (power*100)+100, (power*100) + 100);

    fill(r4, g4, b4);
    ellipse(X4+25, Y4+25, power*100, power*100);

    // Set Volume
    player4.volume(setVolume(Y4));
    player4.speed(setSpeed(X4));
  }
}

// "PLAY" BUTTONS

void swicthPlay1() {
  if (mouseX>X1 && mouseX<(X1 + 50)) {
    if (mouseY>Y1 && mouseY<(Y1 + 50)) {
      playit1 = !playit1;

      if (playit1) {
        numPlays++;

        player1.play();
      } 
      else {
        numPlays--;

        player1.stop();
      }
    }
  }
}

void swicthPlay2() {
  if (mouseX>X2 && mouseX<(X2 + 50)) {
    if (mouseY>Y2 && mouseY<(Y2 + 50)) {
      playit2 = !playit2;

      if (playit2) {
        numPlays++;

        player2.play();
      } 
      else {
        numPlays--;

        player2.stop();
      }
    }
  }
}

void swicthPlay3() {
  if (mouseX>X3 && mouseX<(X3 + 50)) {
    if (mouseY>Y3 && mouseY<(Y3 + 50)) {
      playit3 = !playit3;

      if (playit3) {
        numPlays++;

        player3.play();
      } 
      else {
        numPlays--;

        player3.stop();
      }
    }
  }
}

void swicthPlay4() {
  if (mouseX>X4 && mouseX<(X4 + 50)) {
    if (mouseY>Y4 && mouseY<(Y4 + 50)) {
      playit4 = !playit4;

      if (playit4) {
        numPlays++;

        player4.play();
      } 
      else {
        numPlays--;

        player4.stop();
      }
    }
  }
}

void drawEq() {

  if (playit1 || playit2 || playit3 || playit4) {
    fill(0);
    powerAve = powerAve/numPlays;
    arrayLength = round(map(powerAve, 0, 1, 0, 7)) + random(3);

    for (int i=0; i<arrayLength; i++) {
      image(images[i], 0, height-pos);
      pos += 80;
    }

    pos = 0;
  }
  else {
    fill(0);
    rect(0, 0, 200, height);
  }

  powerAve = 0;
}

float setVolume(int posY) {
  if (posY<200) {
    return 0.25;
  }

  if (posY>200 && posY<400) {
    return 0.50;
  }

  if (posY>400 && posY<600) {
    return 0.75;
  }

  if (posY>600) {
    return 1.0;
  }
}

float setSpeed(int posX) {
  if (posX>206 && posX<412) {
    return 0.75;
  }

  if (posX>412 && posX<618) {
    return 1;
  }

  if (posX>618 && posX<824) {
    return 1.15;
  }

  if (posX>824) {
    return 1.30;
  }
}


int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(float r, float g, float b)
  {
    imageTint = color(r,g,b);
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(i >= names.length)
        break;
      sliders[i].setName(names[i]);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i=0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


