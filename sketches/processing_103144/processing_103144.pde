
Mover[] pallette = new Mover[20];
PVector wind, gravity;
PFont font;

void setup() {
  size(640, 480);
  frameRate(60);
  smooth();
  
  font = loadFont("ComicSansMS-16.vlw");
  
  for (int i=0; i<pallette.length; ++i) {
    pallette[i] = new Mover(random(0.5, 6), random(width), 20);
  }
  
  wind = new PVector(0.01, 0);
  
}


void draw() {
  background(255);
  
  //rettangolo blu in cui la pallina passandoci sperimente solo la frizione
  noStroke();
  fill(175, 245, 255);
  rect(0, height/3, width/2, height/3);
  
  //rettangolo viola in cui la pallina passandoci sperimente la frizione opposta
  noStroke();
  fill(200, 98, 255);
  rect(width/2, height/3, width/2, height/3);
  
  //testo a schermo
  textFont(font);
  fill(0);
  text("mouse click to reset", width-120, 15);
  text("gravita' + vento + frizione", 5, 15);
  text("gravita' + vento + frizione", 5, height-10);
  text("solo frizione", 5, height/3+15);
  text("frizione opposta", width-125, height/3+15);
 
  for (int i=0; i<pallette.length; ++i) {
    
    float m = pallette[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    
    float mu = 0.05;
    float normal = 1;
    PVector friction = pallette[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mu*normal);
    
    float x = pallette[i].location.x;
    float y = pallette[i].location.y;
    
    if ( (y>=height/3) && (y<=(2*height)/3) ) {
      
      if ( x<=width/2 ) {
        pallette[i].applyForce(friction);
      } else  {
        friction.mult(-1);
        pallette[i].applyForce(friction);
      }
      
    } else {
      
      pallette[i].applyForce(friction);
      pallette[i].applyForce(wind);
      pallette[i].applyForce(gravity);
      
    }
 
    pallette[i].update();
    pallette[i].checkEdges();
    pallette[i].display();
  }
}


void mousePressed() {
    for (int i=0; i<pallette.length; ++i) {
        pallette[i] = new Mover(random(0.5, 6), random(width), 20);
    }
  
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius;
  
  Mover(float m, float x, float y) {
    mass = m;
    radius = mass*8;
    location = new PVector(x, y );
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(50, 80);
    //noStroke();
    fill(120, 80);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
  
  void checkEdges() {
    if (location.x> width-radius) {
      location.x = width-radius;
      velocity.x *= -1;
    } else if (location.x < 0+radius) {
      location.x = 0+radius;
      velocity.x *= -1;
    }
    
    if (location.y> height-radius) {
      velocity.y *= -1;
      location.y = height-radius;
    } else if (location.y < 0+radius) {
      location.y = 0+radius;
      velocity.y *= -1;
    }
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acceleration.add(force);
    
  }
  
  
}
    
