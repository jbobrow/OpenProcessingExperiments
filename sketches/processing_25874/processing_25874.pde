

// Very simplified demo of an angular (tosrional) spring, using Euler integration. 
// Golan Levin, April 2011 / golan@flong.com

AngularSpring aSpring;
PImage fork;

//=============================================================
void setup() {
  size(500,350);
  fork = loadImage("fork.gif");
  
  float restAng = DEG_TO_RAD * -55.0;
  aSpring = new AngularSpring(width/2,height-50,120, 1.0,0.15,0.95, restAng);
}

//=============================================================
void draw() {
  background(255); 

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
    cx                 = x;
    cy                 = y;
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
    spingDamping       = 0.95;
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
    
    // draw a goofy fork. 
    pushMatrix();
    translate(cx,cy);
    rotate( atan2(py,px) - HALF_PI); 
    translate (-33,-20); // translate to the fork's "registration point"
    image(fork, 0,0); 
    popMatrix();
    
    // draw a geometric spike or something.
    noStroke();
    fill(#7CAA87, 120);
    pushMatrix();
    translate(cx,cy);
    
    beginShape();
    vertex(-150,-15); 
    vertex(-75,-15);
    vertex(px*1.6, py*1.6); 
    vertex( 75,-15);
    vertex( 150,-15);
    vertex( 150, 20); 
    vertex(-150, 20); 
    endShape(CLOSE);
    
    popMatrix();
  }

  //------------------------------------------------------------
  // just a simple draw function for the angular spring. 
  void draw() {
    pushMatrix();
    translate(cx,cy);
 
    smooth();
    
    // draw the rest angle 
    stroke(0,0,0, 64);
    line(0,0, radius*cos(angleRest), radius*sin(angleRest));
    
    // draw the spring
    stroke(0,0,0);
    line(0,0, px,py);

    // draw the particles
    fill(180,180,180); 
    ellipse(0,0, 24,24);
    fill(100,200,100); 
    ellipse(px,py, 30,30);

    // text indicates which end is which.
    fill (0,0,0);
    text ("P", px-3,py+6); 
    text ("C", -5,6);
    popMatrix();
  }
}


