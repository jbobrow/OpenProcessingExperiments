

class Mover {

  // Our object has two PVectors: location and velocity
  PVector acceleration;
  PVector location;
  PVector velocity;
  PVector mouse;
  int ellipsize = 10;

  Mover() {
    location = new PVector(random(width), random(height));
  }

  void update() {
    // Motion 101: Locations changes by velocity.
    acceleration = new PVector(random(-3, 3), random(-3, 3));
    velocity = new PVector(random(-5, 5), random(-5, 5));
    velocity.add(acceleration);
    location.add(velocity);
    
    if (ellipsize>30){
      ellipsize=10;
    }
    if (ellipsize<7){
    ellipsize=10;
    }
  }

  void display( ) {
    noStroke();
    colorMode(HSB, 100);

    fill( location.x/width*100, location.y/height*100, 80);
    ellipse(location.x, location.y, ellipsize, ellipsize);
  }

  void checkPointer() {
    mouse = new PVector ( mouseX , mouseY);
    PVector s = new PVector(0, 0);
    s=PVector.sub(location, mouse);
    if ( s.mag() < 70)
    {
      ellipsize = ellipsize+2; 
      location = new PVector(random(width), random(height));
    } 

    if ( s.mag() > 200)
    {

      ellipsize = ellipsize - 2; 

      //ellipse(location.x, location.y, ellipsize-10, ellipsize-10);
      location = new PVector(random(width), random(height));
    }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }

  //  void reset(){
  //location = new PVector(random(width), random(height));
  //this.update();
  //  }
}

int n =2000;
Mover[] mover =new Mover[n];


void setup() {
  size(700, 700);
  smooth();
  background(255);
  // Make Mover object array
  for (int i = 0; i < n; i++)
  {
    mover[i] = new Mover();
  }
}

void draw() {
    background(0);

  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  PVector init = new PVector (random (width), random(height));

  // Call functions on Mover object.

  for (int i = 0; i < n; i++)
  {
    mover[i].display();
    mover[i].update();
    mover[i].checkEdges();
    mover[i].checkPointer();
  }



  if (mousePressed)
  {
    for (int i = 0; i < n; i++)
    {
      mover[i].location =init;
      mover[i].ellipsize=16;
    }
  }
  
  delay(50);
}



