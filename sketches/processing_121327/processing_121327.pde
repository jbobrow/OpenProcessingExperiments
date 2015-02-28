
Attractor a;
Attractor b;
Attractor c;
MoteSystem ms1;
MoteSystem ms2;
float buff = 200;
PImage logo;


void setup() {
  size(1920, 1080);
  ms1 = new MoteSystem(new PVector(width/2, height/2));
  ms2 = new MoteSystem(new PVector(width/2, height/2));
  a = new Attractor(width/2, height/2, 100);
  b = new Attractor(width-buff, height/2, 300);
  c = new Attractor(buff, height/2, 300);
  logo = loadImage("EDP_logo_trans.png");
  background(0);
  for(int i = 0; i < 600; i++) {
    ms1.addMote(random(width), random(height), 150);
    ms2.addMote(random(width), random(height), 300); 
  }
}

void draw() {
    fill(0, 4);
    rect(0, 0, width, height);
    imageMode(CENTER);
    image(logo, width/2, height/2, width, height);
  ms1.update();
  ms1.display();
  ms2.update();
  ms2.display();
  ms1.attract(a);
  ms2.attract(b);
  ms2.attract(c);
}


class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector center;
  PVector location;   // Location
  PVector velocity;
  PVector acceleration;
 
  Attractor(float x, float y, float m) {
    center = new PVector(width/2, height/2);
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    acceleration = new PVector(0, 0);
    mass = m;
    G = 1;
  }

  PVector attract(Mote m) {
    PVector force = PVector.sub(location,m.location);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration = PVector.sub(center, location);
    acceleration.normalize();
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    noStroke();
    fill(160, 100);
    ellipse(location.x,location.y, mass, mass);
  }

}




class Mote {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float hueStart;
  float moteG;
  color moteColor;

  Mote(float x, float y, color c) {
    location = new PVector(x,y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0,0);
    mass = 1;
    hueStart = c;
    moteG = 3;
    moteColor = color(hueStart, random(50, 80), random(40, 60), 100);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    moteColor = color(hueStart, random(50, 80), random(40, 60), 100);
    hueStart++;
    if(hueStart >= 360) hueStart = 0;
    
  }

  void display() {
    noStroke();
    colorMode(HSB, 360, 100, 100);
    fill(moteColor);
    ellipse(location.x,location.y,2,2);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }
  
  boolean dropout() {
   if (location.z < -700 || location.z > 500) return true;
   if (location.y < 0 || location.y > height) return true;
   else return false;
 }

}

class MoteSystem {
  ArrayList<Mote> motes;

  MoteSystem(PVector location) {
    motes = new ArrayList<Mote>();
  }

  void applyForce(PVector f) {
    for (Mote m : motes) {
      m.applyForce(f);
    }
  }
  
  void addMote(float x, float y, color c) {
    motes.add(new Mote(x, y, c));
  }


  void display() {
    for (Mote m : motes) {
      m.display();
    }
  }


  void update() {
    for (int i = motes.size()-1; i >= 0; i--) {
      Mote m = motes.get(i);
      m.update();
      if(m.dropout()) motes.remove(i);
    }
  }
  
  void attract(Attractor a) {
    for(Mote m : motes) {
      PVector force = PVector.sub(a.location,m.location);   // Calculate direction of force
      float G = m.moteG;
      float d = force.mag();                              // Distance between objects
      d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
      force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
      float strength = (G * a.mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
      force.mult(strength);       // Get force vector --> magnitude * direction
      m.applyForce(force);
    }
  }


}



