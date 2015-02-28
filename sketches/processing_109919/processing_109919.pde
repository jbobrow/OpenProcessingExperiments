
// graphics
Ball ball;
PImage img; 
final static String STONES = "bball21 background.jpg";

// sliders
Slider sliderx;
Slider slidery;
final static String XSPEED = "x speed"; // label of x slider
final static String YSPEED = "y speed"; // label of x slider

//button(s)
Button button;
final static String STOP = "STOP";
final static String START = "START";

void setup() {
  size(400, 325);
  img = loadImage(STONES);

  // Init shamrock
  ball = new Ball();

  //GUI
  button = new Button(60, 60, 60, 30, STOP);
  sliderx = new Slider(180, 120, 300, 30, XSPEED);
  sliderx.setValue(0.6);
  slidery = new Slider(180, 180, 300, 30, YSPEED);
  slidery.setValue(0.3);
}

void draw() {
  image(img, 0, 0);

  button.display();
  sliderx.display();
  slidery.display();

  if (button.says("STOP")) // Move and display image when we are "running"
    ball.move();

  ball.display();
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
    ball.setXspeed(map(prevValue,0,1,-5,5));
  }
  if (slidery.isUpdating()) {
    float prevValue = slidery.interp(mouseX, mouseY);
    slidery.setValue(prevValue);
    ball.setYspeed(map(prevValue,0,1,-5,5));
  }
}

void mouseReleased() {

  //see if the mouse loc is within the button boundary 
  if ( button.contains(mouseX, mouseY) ) //stop/start accordingly 
    if (button.says(STOP)) 
      button.setText(START);
    else 
      button.setText(STOP);

  if (sliderx.isUpdating()) sliderx.setUpdate(false);
  if (slidery.isUpdating()) slidery.setUpdate(false);
}

class Ball {
  
  private PImage img; 
  private final static String Ball = "bball.JPEG";
  
  private float x,y; // location
  private float xspeed,yspeed; // speed
  
  // Constructor
  Ball() {
   img = loadImage(Ball);
   x = random(width);
   y = random(height);
   xspeed = random(-5,5);
   yspeed = random(-5,5);
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
  
  // Draw the ball
  void display() {
      image(img, x, y);
  }
    
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


