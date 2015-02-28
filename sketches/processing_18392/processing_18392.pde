
// Attempt at recreating a photographic image by analyzing and averaging pixel
// data and drawing shapes based on that data, accompanied with minor randomized
// jitter to create a more layered effect, and EFFING INTERACTIVITY because I can.

// William A. Clark / January 18th, 2010 / Math, Programming, and Art (CCA)

/** HERE BE DRAGONS **/

// IMPORT LIBRARIES
import ijeoma.motion.*;                        // import motion library (ijeoma)
import ijeoma.motion.tween.*;                  // import tween library (ijeoma)
import controlP5.*;

// INIT CONTROLS
ControlP5 control;
Textfield url;

String textValue = "";

//INIT PIMAGE
PImage img;                                    //initialize image vessel

// INIT VARIABLES
int c = 0;                                     // counter variable
int s = 40;                                    // size variable (size of each square/pixel element).
int s2 = s/2;                                  // size divided by 2 (keeps things easy).
int so = s;                                    // backup of s
int s2o = s2;                                  // backup of s2
int op1 = 65;                                  // opacity variable 1
int op1o = op1;                                // backup
int op2 = 100;                                 // opacity variable 2
int op2o = op1;                                // backup
int y = 0;                                     // init y
float rs1 = 0;                                 // variable to hold random number
float rs2 = 0;                                 // variable to hold random number
float r = 0;                                   // randomize?
int sh;                                        // shape variable (0 = one shape / 1 = another, etc)
int anim;                                      // animate, or stay static

// INIT TWEENS
Tween t;
Tween t2;
Tween f;

/** SETUP LOOP **/
void setup() {
  img = loadImage("marilyn.jpg");              // set image location
  size(550, 625);
  background(255);
  smooth();
  noStroke();
  
  // CREATE CONTROL ASSETS
  control = new ControlP5(this);
  control.addBang("animate", 10, height - 45, 20, 20).setTriggerEvent(Bang.RELEASE);
  control.controller("animate").setLabel("animate!");
  
  control.addBang("shape", 60, height - 45, 20, 20).setTriggerEvent(Bang.RELEASE);
  control.controller("shape").setLabel("change shape");
  
  url = control.addTextfield("url", 180, height - 45, width - 280, 20);
  control.controller("url").setLabel("image");
  url.setFocus(true);
  url.setAutoClear(false);
  
  control.addButton("setimg", 0, width - 85, height - 45, 20, 20);
  control.controller("setimg").setLabel("set");
  
  // CREATE RANDOM NUMBERS
  rs1 = random(-1,15);                   
  rs2 = random(-2,5);  
  
  // TWEEN SETUP
  Motion.setup(this);                            // initialize motion/tween
  t = new Tween(s2/1.5,s2*1.75, 150f);           // create tween (start, end, duration in frames)
  t.repeat();                                    // tell tween to repeat when it reaches end
  t.setRepeatMode(MotionConstant.REVERSE);       // when tween is repeated, reverse start and end points
  t.play();

  t2 = new Tween(s, s*random(1.2,3), 100f);
  t2.repeat(MotionConstant.REVERSE);
  t2.play();
  
  f = new Tween(op2, 0, 50f);
  f.pause();

  println("ENTERING DRAW LOOP");               // for diagnostic purposes
}

  // change size and opacity of units upon mouse drag
  void mouseDragged() {
    s2 = s2 + (mouseX/200);
    s = s + (mouseY/200);
    op1 = op1 + (mouseX/2);
    op2 = op2 - (mouseY/2);
  }

  // reset unit sizes and opacity to normal upon mouse release
  void mouseReleased() {
    s2 = s2o;
    s = so;
    op1 = op1o;
    op2 = op2o;
  }


  /** DRAW LOOP **/
  void draw() {

    //  loop through every x pixel (distance between each pixel sample defined by variable s), sample that pixel's color and
    //  then draw a shape with that color at location (x,y). Increment x and y as necessary, creating new 'pixel' blocks which
    //  can then be manipulated further. Randomize the size/location of these blocks as desired to create a 'jitter' effect
    //  
    //  was going to attempt to group blocks of pixels and average the color in each block, but this method proved too
    //  complicated, as well as inefficient given the task 
    //  (simply sampling every couple of pixels yields an image that is still recognizable)

    int dimensions = width * height;
    
    /** LAYER ONE **/
    while(c < 900) {    
      // '900' is an arbitrary number here: at first calculated dimensions of image and used that, but that caused 
      // some strange issues with rendering. This works just fine, currently
      for (int x = 0; x < width; x+=s) {
        // sample pixel color
        color p = img.get(x,y);
        fill(p,op1);
        // draw an shape at current x and y location, fill with sampled color, animate size
        rect(x,y,t2.getPosition(),t2.getPosition());
      }
      c = c + s; // increment counter variable
      y = y + s; // increment y
    }


    /** LAYER TWO **/
    // reset variables for next loop
    c = 0;
    y = 0;

    // the if() clause is only here for diagnostic purposes, in case I want to quickly disable this layer
    if(1 == 1) {
      while(c < 900) {
        for (int x = 0; x < width; x+=s2) {
          // sample color
          color p = img.get(x,y);
          fill(p,f.getPosition());
          // draw shape, fill, jitter location and jitter/animate size
          if((sh == 1) && (anim == 1)) {
            ellipse(x+rs2,y+rs2,t.getPosition(),t.getPosition()); } // size depends on tween (animate)
          if((sh == 0) && (anim == 1)) {
            // here, try to adjust X and Y position in correspondence w/ tween so that unit does not shift position with growth
            rect((x+rs2)-(t.getPosition()/2),(y+rs2)-(t.getPosition()/2),t.getPosition(),t.getPosition()); }
            
          if((sh == 1) && (anim == 0)) {
            ellipse(x+rs2,y+rs2,s/2,s/2); }
          if((sh == 0) && (anim == 0)) {
            rect(x+rs2,y+rs2,s/2,s/2); }
        }
        c = c + s2; // increment counter variable
        y = y + s2; // increment y
        
        // bottom toolbar
        fill(25);
        rect(0, height - 55, width, 55);
      }
    }
  }
  
 public void animate() {
   println("animate!");
   if(anim == 0) {
     anim = 1;
   }
   else {
     anim = 0;
   }
 }

public void shape() {
   println("change shape!");
   if(sh == 1) {
     sh = 0;
   }
   else {
     sh = 1;
   }
}

void setimg() {
  img = loadImage(url.getText());
}

