

class ShamrockLeaf {
  
  private PImage img; 
  private final static String SHAMROCK = "lucky-smaller.png";
  
  private float x,y; // location
  private float xspeed,yspeed; // speed
  
  // Constructor
  ShamrockLeaf() {
   img = loadImage(SHAMROCK);
   x = random(width);
   y = random(height);
   xspeed = random(-15,15);
   yspeed = random(-15,15);
       
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

import java.awt.event.*;

float a;


// graphics
ShamrockLeaf shamrockleaf;

color bColor = color(255,255,255,255);
color currentColor;

// sliders
Slider sliderx;
Slider slidery;
final static String XSPEED = "x speed"; // label of x slider
final static String YSPEED = "y speed"; // label of x slider

//button(s)
Button button;
Button buttonb;


//directional pad
Button dpadup;
Button dpaddown;

StatusBar statusbar;


final static String STOP = "STOP";
final static String START = "START";
final static String BCOLOR = "BCOLOR";
final static String ZOOMUP = " +";
final static String ZOOMDOWN = " -";



void setup() {
  size(800,650);

addMouseWheelListener(new java.awt.event.MouseWheelListener() {
public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
mouseWheel(evt.getWheelRotation());
 }});
 
 // Init shamrock
  shamrockleaf = new ShamrockLeaf();



  //GUI

  button = new Button(60, 60, 60, 30, STOP);
  buttonb = new Button(60, 30, 60, 30, BCOLOR);
  sliderx = new Slider(180, 120, 300, 30, XSPEED);
  sliderx.setValue(0.6);
  slidery = new Slider(180, 180, 300, 30, YSPEED);
  slidery.setValue(0.3);
  dpadup = new Button(300,50,25,25,ZOOMUP);
  dpaddown = new Button(300,75,25,25, ZOOMDOWN);
  statusbar = new StatusBar( 400,600,799, 25 );
 
}

void draw() {
  
  background(bColor);
  
  if (button.contains(mouseX, mouseY)){
     cursor(HAND);
  } else if(buttonb.contains(mouseX,mouseY)){
    cursor(HAND);
  } else if (dpadup.contains(mouseX,mouseY)){
    cursor(HAND);
  } else if (dpaddown.contains(mouseX,mouseY)){
    cursor(HAND);
  } else if(sliderx.contains(mouseX,mouseY)){
    cursor(ARROW);
  } else if (slidery.contains(mouseX,mouseY)){
    cursor(ARROW);
  } else{
    cursor(CROSS);
  }
  
  button.display();
  buttonb.display();
  sliderx.display();
  slidery.display();
  dpadup.display();
  dpaddown.display();
  statusbar.display();

  if (button.says("STOP")) // Move and display image when we are "running"
    shamrockleaf.move();


  shamrockleaf.display();


}

  
void mouseWheel(int delta) {
  if(delta > 0){
    bColor = color(random(0,127.5));
    System.out.println(hex(bColor,6));
  }else if(delta <0){
    bColor = color(random(127.5,255));
    System.out.println(hex(bColor,6));
  }
  println("mouse has moved by " + delta + " units."); 
}
 

void mousePressed() {
  if (buttonb.contains(mouseX, mouseY)){
    bColor = color(random(255),random(255),random(255));
       System.out.println(hex(bColor,6));
  }
  if (sliderx.contains(mouseX, mouseY)) {
    sliderx.setUpdate(true);
  }
  if (slidery.contains(mouseX, mouseY)) {
    slidery.setUpdate(true);
  }
  
  
  if(dpadup.contains(mouseX, mouseY)){
    bColor = color(random(0,127.5));
    System.out.println(hex(bColor,6));
  } else if (dpaddown.contains(mouseX,mouseY)) {
    bColor = color(random(127.5, 255)); 
        System.out.println(hex(bColor,6));
  } 
}
  
void keyPressed(){
  
  if (key == ' ') {
 
  
  bColor = color(255,255,255);
  System.out.println(hex(bColor,6));
  
}
    
}

void mouseDragged() {
  if (sliderx.isUpdating()) {
    float prevValue = sliderx.interp(mouseX, mouseY);
    sliderx.setValue(prevValue);
    shamrockleaf.setXspeed(map(prevValue,0,1,-5,5));
   
  }
  if (slidery.isUpdating()) {
    float prevValue = slidery.interp(mouseX, mouseY);
    slidery.setValue(prevValue);
    shamrockleaf.setYspeed(map(prevValue,0,1,-5,5));
   

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
    
   
    
    // draw the underlaying box
    fill(255,64);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
    
     fill(255,0,255);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
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
int x,y,w,h; 

class StatusBar{
  

 StatusBar(int _x, int _y, int _w, int _h){
   x= _x;
   y= _y;
   w = _w;
   h = _h;
    }
  
  void display(){
    fill(0);
    stroke(0);
    rect (x,y,w,h);
    fill(255);
    text("Background Color = " + hex(bColor, 6), 400, 600); 
    text("Mouse",150,600);
    text("X: " + mouseX, 200,600);
    text("Y: " + mouseY, 275, 600);
    
  }
  
  
}



