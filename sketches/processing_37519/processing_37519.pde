
// HW 3 - Computing for the Arts with Processing
// © Asa Foster 2011

AngularSpring aSpring;
PImage body;
PImage head;

//=============================================================
void setup() {
  size(500,500);
  body = loadImage("Body.png");
  head = loadImage("Head.png");
   
  float restAng = DEG_TO_RAD * -55.0;
  aSpring = new AngularSpring(width/2,height-50,120, 1.0,0.15,0.95, restAng);
}
 
//=============================================================
void draw() {
  background(255);
  imageMode(CORNER);
  image(body, 0, 0, 500, 500);
 
  if (mousePressed == true) {
    aSpring.setPositionFromMouse();
     
  }
  aSpring.update();
  aSpring.drawDecoratedVersion();
  aSpring.draw();
}
 
 
 
//=============================================================
class AngularSpring {
 
  float angleRest;         // the rest angle of the spring
  float angleDisplacement; // angular displacement of the spring from the rest angle
  float angleVelocity;     // current speed of the spring, in radians per animation-frame
  float radius;            // radius of the spring's arm
  float spingDamping;      // friction (damping) constant (0...1)
  float springConstant;    // stiffness of the spring
  float mass;              // mass of the spring's particle
  float cx,cy;             // center point of rotation
  float px,py;             // distal point of rotation
  boolean bPositionForced; // are we overriding the spring
 
 
  //------------------------------------------------------------
  AngularSpring() {
    setDefaults();
  }
 
  //------------------------------------------------------------
  AngularSpring (float x, float y, float r, float m, float k, float d, float Ar) {
    // creates an angular spring with zero initial velocity and displacement.
    cx                 = 270;
    cy                 = 180;
    radius             = r;
    spingDamping       = d;
    springConstant     = k;
    mass               = m;
    angleRest          = Ar;
    angleDisplacement  = 0;
    angleVelocity      = 0;
    bPositionForced = false;
    initialize();
  }
 
  //------------------------------------------------------------
  void setDefaults() {
    setCenterPoint (width/2, height/2);
    radius             = 100;
    spingDamping       = 1;
    springConstant     = 0.1;
    mass               = 1.0;
    angleRest          = 0;
    angleDisplacement  = 0;
    angleVelocity      = 0;
    bPositionForced = false;
    initialize();
  }
 
  //------------------------------------------------------------
  void setCenterPoint (float x, float y) {
    cx = x;
    cy = y;
  }
 
  void setPositionFromMouse() {
    float dx = mouseX - cx;
    float dy = mouseY - cy;
    float orientation = atan2 (dy, dx);
    px = radius * cos(angleRest + orientation);
    py = radius * sin(angleRest + orientation);
    angleDisplacement = orientation - angleRest;
    bPositionForced = true;
  }
 
  //------------------------------------------------------------
  void initialize() {
    px = radius * cos(angleRest + angleDisplacement);
    py = radius * sin(angleRest + angleDisplacement);
  }
 
 
  //------------------------------------------------------------
  void update() {
 
    if (bPositionForced == false) {
       
      // Compute Spring force via Hooke's law, F = -kx
      float angleForce  = 0 - springConstant*angleDisplacement;
      float angleAcceleration = angleForce / mass;
 
      // Integrate position and apply damping.
      // Warning: dumbass Euler integration. YMMV.
      angleVelocity     += angleAcceleration;
      angleVelocity     *= spingDamping;
      angleDisplacement += angleVelocity;
    }
 
    px = radius * cos(angleRest + angleDisplacement);
    py = radius * sin(angleRest + angleDisplacement);
    bPositionForced = false;
  }
   
  //------------------------------------------------------------
  void drawDecoratedVersion(){
    imageMode(CENTER); 
    pushMatrix();
    translate(cx,cy);
    rotate( atan2(py,px) + radians(35));
    image(head, 0, 0, 240, 250);
    popMatrix();
     
    // draw a geometric spike or something.
    noStroke();
    fill(#7CAA87, 120);
    pushMatrix();
    translate(cx,cy);
    
    popMatrix();
  }
 
  //------------------------------------------------------------
  // just a simple draw function for the angular spring.
  void draw() {
    smooth();
  }
}

