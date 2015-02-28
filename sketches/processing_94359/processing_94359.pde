
// Lollipop Factory

int w=640,h=480;              // Canvas size
int x=w/2, y=h/2;             // Center x y
PImage bgr;                   // Background image
ArrayList lollipops;          // Dynamic array to store lollipop objects
boolean init;                 // Init to display bgr image in processing.js

void setup(){
  size(640,480,P2D);
  noFill();
  smooth(8);
  background(0);
  colorMode(HSB);
  bgr = loadImage("bgr.jpg");
  lollipops = new ArrayList();
  init = false;
}

// Draw all lollipops in the array and delete grown lollipops
void draw(){
  if (!init && millis()>2000) {    // Preload the image
    image(bgr,0,0);
    init=true;
  } 
  for (int i = lollipops.size()-1; i >= 0; i--) { 
    Lollipop Lollipop = (Lollipop) lollipops.get(i);
    Lollipop.drawLollipop();
    if (Lollipop.grown) {
      lollipops.remove(i);
    }
  }  
}

class Lollipop {
  float R, angle, k, hue;     // Radius, angle, pattern repetition, hue
  float a_change, r_change;   // Angle change, radius change    
  int x, y, w, iteration;     // Lolli center XY, stroke size, pattern iteration
  boolean grown;              // Is the lollipop done and pattern drawn?
  int repeat;                 // How many times to draw the pattern?
 
Lollipop() {
  iteration=0;
  repeat=5;
  x = mouseX;
  y = mouseY;
  reset();
  a_change=random(1.0,2.0);
  r_change=random(0.1,0.2);
  w=int(random(8,13));  
}
 
void drawLollipop() {
if (iteration>repeat) {           // If lollipop is done, set the bool and exit 
    grown=true; return; 
  } else {
    if (iteration==0) {           // If iteration is 0, draw the lollipop base and stick
      strokeWeight(R/w+1); 
      stroke(hue,25,255); 
      ellipse(x,y,2*R,2*R); 
      point(x,y+3*R); 
    } else {
      strokeWeight(R/w);          // Else draw the pattern!
      stroke(hue,255,255,255);
      point(R*cos(angle) + x, R*sin(angle) + y);
    }
    R+=r_change; angle+=a_change; k--;    // Update pattern variables
    if (k<0) {                            // Move iteration further and reset pattern vars
      iteration++;
      reset();
    }
  }  
}

void reset() {   // Reset vars before new pattern
  k=250;
  R=0;
  hue=random(256);
  angle=random(360);
}
  
}

void mousePressed() {
  lollipops.add(new Lollipop());    // Create new lollipop at click
}

void keyPressed() {
  lollipops = new ArrayList();
  image(bgr,0,0); 
}


