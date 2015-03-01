
// An animation added to the spring example in
// the 'Nature of Code'  by  Daniel Shiffman (Ch 3)


// Mover object
Bob bob;

// Spring object
Spring spring;

// spring animation object
SpringAnimated spranim;

void setup() {
  frameRate(30);
  size(800,600);
  smooth();
  spring = new Spring(width/2,10,100); 
  bob = new Bob(width/2,100); 
  spranim = new SpringAnimated();

}

void draw()  {
  background(0); 
  
  // Apply a gravity force to the bob
  PVector gravity = new PVector(0,2);
  bob.applyForce(gravity);
  
  // Connect the bob to the spring (this calculates the force)
  spring.connect(bob);
  
  // Update bob
  bob.update();
  // If it's being dragged
  bob.drag(mouseX,mouseY);
  
 
  //spring.displayLine(bob);           // Draw a line between spring and bob
  spranim.animationUpdate(bob, spring);// or draw a spring
  bob.display(); 
  spring.display(); 
  
  
  
  fill(255);
  textSize(20);
  text("click on bob to drag",10,height-5);
  text("length:",10,20);
  text(spranim.l,100,20); 
  text(" angle:",10,50);
  text(degrees(spranim.springDir.heading2D() + HALF_PI),100,50);
  
}


// For mouse interaction with bob

void mousePressed()  {
  bob.clicked(mouseX,mouseY);
}

void mouseReleased()  {
  bob.stopDragging(); 
}


// from Nature of Code - Daniel Shiffman Ch 3
class Bob { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 24;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.99;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Bob(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  // Draw the bob
  void display() { 
    noStroke();
    strokeWeight(2);
    fill(255,0,0);
    if (dragging) {
      fill(50);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  } 

 
  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

// from Nature of Code - Daniel Shiffman Ch 3
class Spring { 

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.02;

  // Constructor
  Spring(float x, float y, int l) {
    anchor = new PVector(x, y);
    len = l;
  } 

  // Calculate spring force
  void connect(Bob b) {
    // Vector pointing from anchor to bob location
    PVector force = PVector.sub(b.location, anchor);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    b.applyForce(force);
  }


  // little square for anchor
  void display() { 
    noStroke();
    fill(255,0,0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 10, 10);
  }

  void displayLine(Bob b) {
    strokeWeight(2);
    stroke(#A0E6ED);
    line(b.location.x, b.location.y, anchor.x, anchor.y);
  }
}





// an animation for the spring physics
class SpringAnimated {
  PVector anchor, springDir, coilDir, coilCenterTop;
  // corners of coil topleft etc. plus bottom center
  PVector tl, tr, bl, br, bc; 
  float  l ; // scalar length of spring
  float w = 100.0; // scalar width of coil
  float  h; // scalar height of coil

  SpringAnimated() {
  }

  void animationUpdate(Bob b, Spring s) {
    // springDir starts as a vec from anchor to bob, through middle of coils
    anchor =  s.anchor;
    springDir = PVector.sub( anchor, b.location);

    l = springDir.mag(); // current spring length
    springDir.normalize(); // now the current angle of spring as a unitVec

    // Move top of top coil away from anchor by arbitrary amount, this is down when the spring is vertical
    coilCenterTop = springDir.get(); // copy the  anchor to bob unitVec to ensure we don't change it
    coilCenterTop.mult(-20);
    coilCenterTop.add(anchor);

    coilDir  = new PVector(-springDir.y, springDir.x);// angle of coil tops and bottoms (a unitVec, normal to the springDir)
    coilDir.mult(w/2); //Offset vec (a distance of w/2, normal to the spring angle),this is to the left when spring is vertical

    // calc scalar coil height 
    float numCoils = 10;
    h = (l - 50.0)/numCoils; // coils need not  fill all of spring length (take off arbitrary 50 from length)

    springDir.mult(h); // springDir is now the coil height vec
    stroke(#A0E6ED);
    line(coilCenterTop.x, coilCenterTop.y, anchor.x, anchor.y); // anchor to top coil connection

    // build coils  at the same angle as the spring (springDir(a unitVec) x  h )
    for (int i = 0; i < numCoils; i++) {
      // calc location of 3 coil corners (not bl yet).  Note adjustments to coilCenterTop, springDir and coilDir above
      tl = PVector.sub(coilCenterTop, coilDir); // to left
      tr = PVector.add(coilCenterTop, coilDir); // to right
      br = PVector.sub(tr, springDir);// down from tr

        //  bottom of bottom coil, plus connection to bob
      if (i == numCoils-1) { // the bottom coil
        bl = PVector.sub(tl, springDir);
        bc = PVector.add(bl, coilDir);
        line(b.location.x, b.location.y, bc.x, bc.y); 
        line(bl.x, bl.y, br.x, br.y );// we only need bl for bottom of last (bottom) coil
      }
      line(tl.x, tl.y, tr.x, tr.y);// alternate coil top/bottom
      line(tl.x, tl.y, br.x, br.y ); //coil diagonal
      
      coilCenterTop.sub(springDir);// increment coil top pos
    }
  }
}



