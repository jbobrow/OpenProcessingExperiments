
/* @pjs preload="bikini_bottom.jpg"; /*
/* @pjs preload="spongebob.png"; */
/* @pjs preload="patrick.png"; */

// Java imports
//import java.text.DecimalFormat;

// Graphics
PImage backgroundImage;
final static String BACKGROUND_IMAGE = "bikini_bottom.jpg";
PImage spongebobImage;
final static String SPONGEBOB_IMAGE = "spongebob.png";
PImage patrickImage;
final static String PATRICK_IMAGE = "patrick.png";

// Sprites
Sprite spongebob;
Sprite patrick;

// GUI elements
MyStatusBar myMyStatusBar;
Checkbox chkSpongebob;
Checkbox chkPatrick;
Slider sliderSpongebobSpeed;
Slider sliderPatrickSpeed;
Button btnStartStop;

// button labels
final static String LABEL_START = "Start";
final static String LABEL_STOP = "Stop";

// Height of the are for the UI controls
float UIAreaHeight = 80;

// Height for the movement box that the sprites move in
float movementBoxHeight;

// Flag for animation
boolean animating = false;

long timeToWait = 1000;
long time;

void setup() {
  
  time = millis();
  
  size(800,600);
  backgroundImage = loadImage(BACKGROUND_IMAGE);
  
  // GUI
  myMyStatusBar = new MyStatusBar(MyStatusBar.POSITION_BOTTOM);  
  
  chkSpongebob = new Checkbox(5, 500, 25, "Show Spongebob");
  chkSpongebob.setChecked(true);
  
  chkPatrick = new Checkbox(5, 535, 25, "Show Patrick");
  chkPatrick.setChecked(false);
  
  sliderSpongebobSpeed = new Slider(370, 513, 300, 30, "Spongebob's Speed");
  sliderSpongebobSpeed.setValue(0.5);
  
  sliderPatrickSpeed = new Slider(370, 550, 300, 30, "Patrick's Speed");
  sliderPatrickSpeed.setValue(0.5);
  
  btnStartStop = new Button(LABEL_START, 700, 530, 100, 30);
  
  // Movement box max height
  movementBoxHeight = height-myMyStatusBar.getMyStatusBarHeight()-UIAreaHeight;
  
  // images
  spongebobImage = loadImage(SPONGEBOB_IMAGE);
  patrickImage = loadImage(PATRICK_IMAGE);
  
  // Sprites  
  spongebob = new Sprite(spongebobImage, random(0,width-spongebobImage.width), random(0, movementBoxHeight-spongebobImage.height));
  patrick = new Sprite(patrickImage, random(0,width-patrickImage.width), random(0, movementBoxHeight-patrickImage.height));
  
}

void draw() {
  // background image
  image(backgroundImage,0,0);
  
  // status bar
  myMyStatusBar.display();
  
  // Update the status bar
  if (millis() - time > timeToWait) {
    updateMyStatusBar();
    time = millis();
  }
  
  // An area to play the UI controls
  drawUIArea();
  
  // Draw UI elements
  chkSpongebob.display();
  chkPatrick.display();
  sliderSpongebobSpeed.display();
  sliderPatrickSpeed.display();
  btnStartStop.display();
  
  // Sprites
  if (chkSpongebob.isChecked()) {
    spongebob.display();
  }
  if (animating) {
    spongebob.moveWithinBounds(0, 0, width, movementBoxHeight);
  } else {
    spongebob.stopMoving();
  }
  
  if (chkPatrick.isChecked()) {
    patrick.display();
  }
  if (animating) {
    patrick.moveWithinBounds(0, 0, width, movementBoxHeight);
  } else {
    patrick.stopMoving();
  }
    
}

float calculateSpeed(float _currentSpeed, float _sliderValue) {
  float speed = map(_sliderValue, 0, 1, 0, 5);
  if (_currentSpeed < 0) {
    return speed*-1;
  } else {
    return speed;
  }
}

void updateMyStatusBar() {
  String text = "FPS: " + nf(frameRate,0,1) + " | ";
  text += "Elapsed time: " + time/1000 + " seconds | ";
  text += "Spongebob Position: (" + nf(spongebob.getXPosition(),0,1) + "," + nf(spongebob.getYPosition(),0,1) + ") | ";
  text += "Patrick Position: (" + nf(patrick.getXPosition(),0,1) + ", " + nf(patrick.getYPosition(),0,1) + ")";
  myMyStatusBar.setStatusText(text);
}

void drawUIArea() {
  rectMode(CORNER);
  stroke(0,0,0);
  fill(128,128,128,128);
  rect(-1,height-myMyStatusBar.getMyStatusBarHeight()-UIAreaHeight,width+1,UIAreaHeight);
}

void moveSpongebob() {
  spongebob.setXSpeed( calculateSpeed( spongebob.getXSpeed(), sliderSpongebobSpeed.getValue() ) );
  spongebob.setYSpeed( calculateSpeed( spongebob.getYSpeed(), sliderSpongebobSpeed.getValue() ) );
}

void movePatrick() {
  patrick.setXSpeed( calculateSpeed( patrick.getXSpeed(), sliderPatrickSpeed.getValue() ) );
  patrick.setYSpeed( calculateSpeed( patrick.getYSpeed(), sliderPatrickSpeed.getValue() ) );
}

void mousePressed() {
  
  if(btnStartStop.isMouseOverButton()) {
    btnStartStop.setUpdating(true);
  }
  
  if (chkSpongebob.isMouseInCheckbox()) {
    chkSpongebob.setUpdating(true);
  }
  
  if (chkPatrick.isMouseInCheckbox()) {
    chkPatrick.setUpdating(true);
  }
  
  if (sliderSpongebobSpeed.contains(mouseX, mouseY)) {
    sliderSpongebobSpeed.setUpdate(true);
  }
  
  if (sliderPatrickSpeed.contains(mouseX, mouseY)) {
    sliderPatrickSpeed.setUpdate(true);
  }
  
}

void mouseDragged() {
  
  if(sliderSpongebobSpeed.isUpdating()) {
    float value = sliderSpongebobSpeed.interp(mouseX);
    sliderSpongebobSpeed.setValue(value);
    moveSpongebob();
  }
  
  if(sliderPatrickSpeed.isUpdating()) {
    float value = sliderPatrickSpeed.interp(mouseX);
    sliderPatrickSpeed.setValue(value);
    movePatrick();
  }
  
}

void mouseReleased() {
  
  if (btnStartStop.isUpdating()) {
    if (btnStartStop.isMouseOverButton()) {
      if(btnStartStop.getLabel().equals(LABEL_START)) {
        animating = true;
        moveSpongebob();
        movePatrick();
        btnStartStop.setLabel(LABEL_STOP);
      } else if (btnStartStop.getLabel().equals(LABEL_STOP)) {
        animating = false;
        btnStartStop.setLabel(LABEL_START);
      }
    }
    btnStartStop.setUpdating(false);
  }
  
  if (chkSpongebob.isUpdating()) {
    if (chkSpongebob.isMouseInCheckbox()) {
      chkSpongebob.toggle();
    }
    chkSpongebob.setUpdating(false);
  }
  
  if (chkPatrick.isUpdating()) {
    if(chkPatrick.isMouseInCheckbox()) {
      chkPatrick.toggle();
    }
    chkPatrick.setUpdating(false);
  }
  
  if (sliderSpongebobSpeed.isUpdating()) {
    sliderSpongebobSpeed.setUpdate(false);
  }
  
  if (sliderPatrickSpeed.isUpdating()) {
    sliderPatrickSpeed.setUpdate(false);
  }
  
}
class Button {
  
  private String label;
  private float buttonWidth, buttonHeight;
  private float x,y;
  private float borderColorR = 0, borderColorG = 0, borderColorB = 0;
  private float buttonColorR = 255, buttonColorG = 255, buttonColorB = 255;
  private float labelColorR = 0, labelColorG = 0, labelColorB = 0;
  private boolean updating = false;
  
  Button(String label) {
    this.label = label;
  }
  
  Button(String _label, float _x, float _y, float _buttonWidth, float _buttonHeight) {
    this.label = _label;
    this.x = _x;
    this.y = _y;
    this.buttonWidth = _buttonWidth;
    this.buttonHeight = _buttonHeight;
  }
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setDimensionss(float buttonWidth, float buttonHeight) {
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }
  
  void setWidth(float buttonWidth) {
    this.buttonWidth = buttonWidth;
  }
  
  float getWidth() {
    return buttonWidth;
  }
  
  void setHeight(float buttonHeight) {
    this.buttonHeight = buttonHeight;
  }
  
  float getHeight() {
    return buttonHeight;
  }
  
  void setXPosition(float x) {
    this.x = x;
  }
  
  float getXPosition() {
    return x;
  }
  
  void setYPosition(float y) {
    this.y = y;
  }
  
  float getYPosition() {
    return y;
  }
  
  void setButtonColor(float r, float g, float b) {
    this.buttonColorR = r;
    this.buttonColorG = g;
    this.buttonColorB = b;
  }
  
  void setBorderColor(float r, float g, float b) {
    this.borderColorR = r;
    this.borderColorG = g;
    this.borderColorB = b;
  }
  
  void setLabelColor(float r, float g, float b) {
    this.labelColorR = r;
    this.labelColorG = g;
    this.labelColorB = b;
  }
  
  boolean isMouseOverButton() {
    return (mouseX >= x-(buttonWidth/2) 
      && mouseX <= (x+buttonWidth/2) 
      && mouseY >= (y-buttonHeight/2) 
      && mouseY <= (y+buttonHeight/2));
  }
  
  void display() {
    
    if (updating) {
      stroke(255,0,0);
    } else {
      stroke(borderColorR, borderColorG, borderColorB);
    }
    fill(buttonColorR, buttonColorG, buttonColorB);
    rectMode(CENTER);
    rect(x,y,buttonWidth,buttonHeight,10);
    textSize(buttonHeight*0.5);
    textAlign(CENTER, CENTER);
    fill(labelColorR, labelColorG, labelColorB);
    text(label,x,y);
  }
  
  void setLabel(String label) {
    this.label = label;
  }
  
  String getLabel() {
    return label;
  }
  
  boolean isUpdating() {
    return updating;
  }
  
  void setUpdating(boolean _updating) {
    this.updating = _updating;
  }
}
class Checkbox {
  
  private String label;
  private boolean checked = false;
  private float boxWidth, x, y;
  private boolean updating = false;
  
  Checkbox(float _x, float _y, float _boxWidth, String _label) {
    this.x = _x;
    this.y = _y;
    this.boxWidth = _boxWidth;
    this.label = _label;
  }
  
  boolean isChecked() {
    return checked;
  }
  
  void toggle() {
    if (checked) {
      checked = false;
    } else {
      checked = true;
    }
  }
  
  void display() {
    rectMode(CORNER);
    stroke(0,0,0);
    fill(255,255,255);
    
    // outer box
    rect(x,y,boxWidth,boxWidth);
    
    if (checked) {
      rectMode(CENTER);
      fill(0,0,0);
      rect(x+boxWidth/2,y+boxWidth/2,boxWidth*0.70,boxWidth*0.70);
    }
    
    fill(0,0,0);
    textSize(boxWidth*0.8);
    textAlign(LEFT,CENTER);
    text(label,x+boxWidth+5,y+boxWidth/2);
  }
  
  boolean isMouseInCheckbox() {
    return (mouseX >= x
            && mouseX <= x+boxWidth
            && mouseY >= y
            && mouseY <= y+boxWidth);
  }
  
  void setChecked(boolean _checked) {
    this.checked = _checked;
  }
  
  boolean isUpdating() {
    return updating;
  }
  
  void setUpdating(boolean _updating) {
    this.updating = _updating;
  }
}
class MyStatusBar {
  
  public static final String POSITION_TOP = "top";
  public static final String POSITION_BOTTOM = "bottom";
  
  private String position;
  private String statusText = "";
  private float statusBarHeight = 30;
  
  MyStatusBar(String _position) {
    this.position = _position;
  }
  
  void setMyStatusBarHeight(float _statusBarHeight) {
    this.statusBarHeight = _statusBarHeight;
  }
  
  float getMyStatusBarHeight() {
    return statusBarHeight;
  }
  
  void setStatusText(String _text) {
    this.statusText = _text;
  }
  
  String getStatusText() {
    return statusText;
  }
  
  void setPosition(String _position) {
    this.position = _position;
  }

  String getPosition() {
    return position;
  }  
  
  void display() {
    float y = 0;
    float x = 0;
    
    if (position.equals(POSITION_TOP)) {
      y = 0;
    } else if (position.equals(POSITION_BOTTOM)) {
      y = height-statusBarHeight;
    }
    
    rectMode(CORNER);
    fill(0,0,0);
    rect(x,y,width,statusBarHeight);
    
    fill(0,255,0);
    textSize(statusBarHeight/2);
    textAlign(LEFT, CENTER);
    text(statusText,x+5,y+(statusBarHeight/2));
  }
  
}
class Slider {
  private int x,y;      //location
  private int w,h;      // size
  private String label; // tesxt to show
  
  private float value;  // current value for the slider, range is 0 to 1
  private boolean update = false; // flag to signal when slider is being dragged
  
  Slider (int _x, int _y, int _w, int _h, String _label) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
  }
  
  float getValue() {
    return value;
  }
  
  void setValue(float _f) {
      value = _f;
  }
  
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) 
   && (_x<=x+w/2) 
   && (_y>=y-h/2) 
   && (_y<=y+h/2) ) ? true : false;
 }
  
  void display() {
    
    fill(0,0,255);
    textSize(h*0.5);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
    
    // draw the underlaying box
    fill(255,64);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
  }
  
  float interp(int _x) {
    float val = _x - (x-w/2);
    val = val/w;
    if (val < 0) {
      val = 0.0;
    } else if (val > 1) {
      val = 1.0;
    }
    return val;
  }
  
  boolean isUpdating() {
    return update;
  }
  
  void setUpdate(boolean _b) {
    update = _b;
  }
   
}
class Sprite {
  
  private PImage spriteImage;
  private float x,y;
  private float xspeed = 0;
  private float yspeed = 0;
  
  Sprite(String imageLocation, float x, float y) {
    this.spriteImage = loadImage(imageLocation);
    this.x = x;
    this.y = y;
  }
  
  Sprite(PImage _image, float _x, float _y) {
    this.spriteImage = _image;
    this.x = _x;
    this.y = _y;
  }
  
  void setSpriteImage(String imageLocation) {
    this.spriteImage = loadImage(imageLocation);
  }
  
  void setSpriteImage(PImage image) {
    this.spriteImage = image;
  }
  
  float getXPosition() {
    return x;
  }
  
  float getYPosition() {
    return y;
  }
  
  void setXSpeed(float _xspeed) {
    this.xspeed = _xspeed;
  }
  
  float getXSpeed() {
    return this.xspeed;
  }
  
  void setYSpeed(float _yspeed) {
    this.yspeed = _yspeed;
  }
  
  float getYSpeed() {
    return this.yspeed;
  }
  
  void move() {
    x += xspeed;
    y += yspeed;
    
    // Check horizontal edges
    if (x > (width-spriteImage.width) || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-spriteImage.height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // pretty much the same as move() but within a certain area, defined like a rect
  void moveWithinBounds(float _x, float _y, float _width, float _height) {
    x += xspeed;
    y += yspeed;
    
    // check horizontal edge
    if (x < _x || x > (_x + (_width-spriteImage.width))) {
      xspeed *= -1;
    }
    
    // check vertical edge
    if (y < _y || y > (_y + (_height-spriteImage.height))) {
      yspeed *= -1;
    }
  }
  
  void stopMoving() {
    xspeed = 0;
    yspeed = 0;
  }
  
  void display() {
    image(spriteImage,x,y);
  }
  
  float getHeight() {
    return spriteImage.height;
  }
  
  float getWidth() {
    return spriteImage.width;
  }
  
}


