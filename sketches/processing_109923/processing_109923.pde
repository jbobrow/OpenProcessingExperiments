
// graphics
ShamrockLeaf shamrockleaf;
ShamrockLeaf shamrockleaf2;
PImage img; 
final static String STONES = "flintstones background.jpg";

// sliders
Slider sliderx;
Slider slidery;
final static String XSPEED = "x speed/ y speed"; // label of x slider
final static String YSPEED = "y speed/ x speed"; // label of x slider

//button(s)
Button button;
Button button2;
Button status;
final static String STOP = "STOP";
final static String START = "START";
final static String RUN = "Running";
final static String STOPALL = "AnimationStopped";

void setup(){
size(400, 325);
img = loadImage(STONES);

  // Init shamrock
  shamrockleaf = new ShamrockLeaf();
  shamrockleaf2 = new ShamrockLeaf();

  //GUI
  button = new Button(60, 60, 60, 30, STOP);
  button2 = new Button(60, 90, 60, 30, STOP);
  status = new Button(200,300,300,30,RUN);
  sliderx = new Slider(180, 120, 300, 30, XSPEED);
  sliderx.setValue(0.5);
  slidery = new Slider(180, 180, 300, 30, YSPEED);
  slidery.setValue(0.5);
}

void draw() {
  image(img, 0, 0);

  button.display();
  button2.display();
  status.display();
  sliderx.display();
  slidery.display();

  if (button.says("STOP")) // Move and display image when we are "running"
    shamrockleaf.move();
    
  if (button2.says("STOP"))
    shamrockleaf2.move();
   
   
  shamrockleaf.display();
  shamrockleaf2.display();
  
  
}

void mousePressed() {
  if (sliderx.contains(mouseX, mouseY)) {
    sliderx.setUpdate(true);
  }
  if (slidery.contains(mouseX, mouseY)) {
    slidery.setUpdate(true);
  }
}

void mouseDragged() {
  if (sliderx.isUpdating()) {
    float prevValue = sliderx.interp(mouseX, mouseY);
    sliderx.setValue(prevValue);
    shamrockleaf.setXspeed(map(prevValue,0,1,0,5));
    shamrockleaf2.setYspeed(map(prevValue,0,1,0,5));
  }
  if (slidery.isUpdating()) {
    float prevValue = slidery.interp(mouseX, mouseY);
    slidery.setValue(prevValue);
    shamrockleaf.setYspeed(map(prevValue,0,1,0,5));
    shamrockleaf2.setXspeed(map(prevValue,0,1,0,5));
  }
}

void mouseReleased() {

  //see if the mouse loc is within the button boundary 
  if ( button.contains(mouseX, mouseY) ) //stop/start accordingly 
    if (button.says(STOP)) 
      button.setText(START);
    else 
      button.setText(STOP);
      
   if (button2.contains(mouseX, mouseY) ) //stop/start accordingly 
    if (button2.says(STOP)) 
      button2.setText(START);
    else 
      button2.setText(STOP);
      
   
      
  if (sliderx.isUpdating()) sliderx.setUpdate(false);
  if (slidery.isUpdating()) slidery.setUpdate(false);
}

class Button {
  
  private int x,y,w,h;
  private String text;
  
  Button(int _x, int _y, int _w, int _h, String _text) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = _text; 
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x, y);
  }
  
  boolean contains(int _x, int _y) {
   if( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }
  
  boolean says(String s) {
    return text.equals(s) ? true : false;
  }
  
  void setText(String _t) {
    text = _t;  
  }
  
}

class ShamrockLeaf {
  
  private PImage img; 
  private final static String SHAMROCK = "lucky-smaller.png";
  
  private float x,y; // location
  private float xspeed,yspeed; // speed
  
  // Constructor
  ShamrockLeaf() {
   img = loadImage(SHAMROCK);
   x = 100;
   y = 200;
   xspeed = 2.5;
   yspeed = 2.5;
  }
  
  void setXspeed(float _f) {
   xspeed = _f; 
  }
  
  void setYspeed(float _f) {
   yspeed = _f; 
  }
  
    void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > (width-img.width) || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-img.height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // Draw the shamrock
  void display() {
      image(img, x, y);
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
  
  void setValue(float _f) {
      value = _f;
  }
  
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
  
  void display() {
    
    fill(255,0,0);
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
  
  float interp(int _x, int _y) {
   float d = _x - (x-w/2);
   //float new = map (d, x-w/2, x+w/2, 0, 1); // norm is a little easier, conceptually
   float nw = norm (d, x-w/2, x+w/2); 
   //clamp at 0.0, 1.0
   nw = min(1.0, nw);
   nw = max(0.0, nw);
   return nw;
  }
  
  boolean isUpdating() {
    return update;
  }
  
  void setUpdate(boolean _b) {
    update = _b;
  }
   
}


