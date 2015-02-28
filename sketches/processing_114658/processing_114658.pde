
int[] Partner1;
int[] Partner2;
int numBs = 35;
Bubble[] bubbles; 
float curBX, curBY, connect1X, connect1Y, connect2X, connect2Y;

float g = 0.4;

int _size = 800;
int _m = 10;


void setup() {
  size(_size, _size);
  bubbles = new Bubble[numBs];
  Partner1 = new int[numBs];
  Partner2 = new int[numBs];

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(_m, random(width), random(height), random(5,20));
    Partner1[i] = int(random(0, numBs));
    Partner2[i] = int(random(0, numBs));
  }
}

void draw() {
  background(136, 83, 197);
  for (int i =0; i<bubbles.length;i=i+1) {
    bubbles[i].display();
    bubbles[i].KeepMoving();
    bubbles[i].keepInScreen();
  }
  interact();
  connect();
}

void interact() {
  for (int i = 0; i < bubbles.length; i++) {
    for (int j = 0; j < bubbles.length; j++) {
      if (dist(bubbles[i].location.x, bubbles[i].location.y, bubbles[j].location.x, bubbles[j].location.y)<60  && dist(bubbles[i].location.x, bubbles[i].location.y, bubbles[j].location.x, bubbles[j].location.y)>30) {
        PVector force = bubbles[j].attract(bubbles[i]);
        bubbles[i].applyForce(force);
      }
      bubbles[i].update();
      bubbles[i].display();
    }
  }
}

void connect() {
   for (int i = 1; i < numBs; i++) {
    // Create variable for the xy pos of both the 'cur' and 'previous' Bs
    // Variables created to make the code easier to follow
    curBX = bubbles[i].curL.x;
    curBY = bubbles[i].curL.y;
    
    connect1X = bubbles[Partner1[i]].curL.x;
    connect1Y = bubbles[Partner1[i]].curL.y;
    
    connect2X = bubbles[Partner2[i]].curL.x;
    connect2Y = bubbles[Partner2[i]].curL.y;

    stroke(255);
    strokeWeight(.3);
    line(curBX, curBY, connect1X, connect1Y);
    line(curBX, curBY, connect2X, connect2Y);
  }
} 

  
void mouseDragged() {
  for (int i = 0;i<bubbles.length;i++) {
    if (bubbles[i].isMouseOverMe() ==true) {
      bubbles[i].location.x = mouseX;
      bubbles[i].location.y = mouseY;
    }
  }
}

void mousePressed() {
  for (int i = 0;i<bubbles.length;i++) {
    if (bubbles[i].isMouseOverMe() == true)  
      bubbles[i].buttonState = !bubbles[i].buttonState;
  }
}

class Bubble {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector curL;
  float mass;
  float Bsize;//the diameter of the bubble
  float val;
  float var;

  Boolean buttonState =  false;


  Bubble(float m, float x, float y, float c) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);

    acceleration = new PVector(0, 0);
    this.Bsize = c;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    curL = location.get();
  }

  void display() {

    if (buttonState == true) {
      fill(255, 0, 0) ;
    }
    else {
      fill(255);
    }
    noStroke();
    ellipse(location.x, location.y, Bsize, Bsize);
  }


  void KeepMoving() {
    location.x = location.x+random(-2, 2);
    location.y = location.y+random(-2, 2);
  }



  PVector attract(Bubble m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 25.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }


  void keepInScreen() {
    if ((location.x-2)<Bsize/2 || (location.x+2)>(width-Bsize/2)) {
      location.x = -location.y;
      if ((location.y-2)<Bsize/2 || (location.y+2)>=(height-Bsize/2)) {
        location.y = -location.y;
      }
      else {
        location.y = location.y;
      }
    }
    if ((location.x-2)<(width-Bsize/2)&&(location.x+2)>Bsize/2) {
      location.x = location.x;
      if ((location.y-2)<Bsize/2||(location.y+2)>=(height-Bsize/2)) {
        location.y = -location.y;
      }
      else {
        location.y = location.y;
      }
    }
  }


  Boolean isMouseOverMe() {

    if (dist(mouseX, mouseY, location.x, location.y)<=Bsize/2) {
      return true;
    }
    else {
      return false;
    }
  }
}



