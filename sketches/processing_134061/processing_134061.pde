

float gravX;
float gravY;


Bug[] myBugs;

void setup() {
  size( 500, 500 );
  myBugs = new Bug[2000];

  int counter = 0;

  for (int i = 0; i<myBugs.length; i++) {    
    myBugs[i] = new Bug(random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i<myBugs.length ; i++) {
    myBugs[i].update();
    myBugs[i].display();
  }

  gravX = mouseX-width/2;
  gravY = mouseY-height/2;

  gravX = map(gravX, -250, 250, -0.5, 0.5);
  gravY = map(gravY, -250, 250, -0.5, 0.5);
}

void mouseClicked() {
  resetPositions();
}

void resetPositions() {

  int counter = 0;
  for (int i = 0; i<myBugs.length ; i++) {

    myBugs[i].setPosition(random(width), random(height));
  }
}



class Bug {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float   myRotation;

  Bug(float theX, float theY) {
    position = new PVector( random(width), random(height) );
    velocity = new PVector( 0, 0);
    acceleration = new PVector( 50, 50 );
    myRotation = radians(random(-45, 90));
  }

  void update() {
    addGravity();
    addShake();
    followMouse();

    velocity.add(acceleration);   // influence velocity
    velocity.limit(20);            // influence speed
    position.add(velocity);       // influence position 
    //acceleration.set(0, 0);       // reset acceleration

    stayWithinBounds();
  }

  void addGravity() {
    PVector force = new PVector( gravX, gravY );
    acceleration.add(force);
  }

  void setPosition(float theX, float theY) {
    position.x = theX;
    position.y = theY;
  }

  void addShake() {
    PVector force = new PVector( random(-1, 1), random(-1, 1));
    force.limit(100);
    acceleration.add(force);
  }

  void followMouse() {
    PVector mouse = new PVector( mouseX, mouseY );
    // calculate a vector pointing from the bug position
    // the mouse position
    PVector force = PVector.sub( mouse, position );
    force.limit(1.5);
    acceleration.add(force);
  }

  void stayWithinBounds() {
    if ( position.x > width + 10 ) {
      position.x = width + 10;
    }
    if ( position.x < -10 ) {
      position.x = -10;
    }
    if ( position.y > height + 10 ) {
      position.y = height + 10;
    }
    if ( position.y < -10 ) {
      position.y = -10;
    }
  }   

  void display() {
    stroke(0.2);
    pushMatrix();
    translate(position.x, position.y);
    rotate(myRotation);
    line( 0, 0, 7, 7 );
    popMatrix();
  }
}



