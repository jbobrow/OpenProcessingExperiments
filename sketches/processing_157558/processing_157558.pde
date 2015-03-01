

ArrayList<Particle> particles;
int NumOfParticles = 150;
float lifespanVal = 165.0;
int diameter = 15;
int diamax = 20;
int diamin = 8;
float lifespanDecrem = 0.1;

boolean mousePres1 = false;
float colrandom = random(150,180);
PVector mousetemp;
float maxspeed = 9;
int m = 0;
float R;
int ColRsign =1;
float G;
int ColGsign =1;
float B;
int ColBsign =1;
float incColor = 0.5;

void setup() {
  size(600,600);
  smooth();
  background(0);
  R = random(0,incColor);
  G = random(0,incColor*4);
  B = random(0,incColor*4);
  
  particles = new ArrayList<Particle>();
}

void draw() {
  m = millis();

  if (R > incColor*5) {
      ColRsign = -1;
    }
  if (R < 0) {
      ColRsign = 1;
    }    
  R = R + incColor * ColRsign * (m % 22000)/21500;

  if (G > incColor*10) {
      ColGsign = -1;
    }
  if (G < 0) {
      ColGsign = 1;
    }    
  G = G + incColor * ColGsign * (m % 22100)/21500;
  
  if (B > incColor*15) {
      ColBsign = -1;
    }
  if (B < 0) {
      ColBsign = 1;
    }    
  B = B + incColor * ColBsign * (m % 22200)/21500;  
  
  background(R, G, B);
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update(); 
    p.checkEdges();
    p.display();
    if (p.isDead()) {
      particles.remove(i);
    }    
  }
}

void mousePressed() {
  mousePres1 = true;
  if (particles.size() < NumOfParticles) {
    for (int i = 0; i < (random(1,12)); i++) {
      particles.add(new Particle(new PVector(mouseX+random(-4*diameter,4*diameter),mouseY+random(-4*diameter,4*diameter))));
    }
  }
}

void mouseDragged() {
  mousePres1 = true;
  if (particles.size() < NumOfParticles) {
    particles.add(new Particle(new PVector(mouseX+random(-4*diameter,4*diameter),mouseY+random(-4*diameter,4*diameter))));
  } 
}  

void mouseReleased() {
  mousePres1 = false;
  mousetemp = new PVector (pmouseX, pmouseY);
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  PVector randomized;  
  float lifespan;
  color colorOfParticle;
  color colorOfStroke; 
  float diam;
  float incrediam = 0.1;
  int sign = 1;  
  float m1;
  
  
  Particle(PVector l) {

    location = l.get();
    
    m1 = random (500, 1000);
    
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001,0.01);

    diam = diameter + random (-diameter/2, diameter/2);

    topspeed = maxspeed-random(0,maxspeed/2);

    colorOfParticle = color(colrandom+random(-30,30),colrandom+random(-30,30),colrandom+random(-30,30));
    colorOfStroke = color(colrandom+random(-50,0),colrandom+random(-50,0),colrandom+random(-50,0));    
    
    lifespan = lifespanVal-random(0,110);
    
  }
  
  void update() {
    PVector mouse = new PVector(0, 0);
    if (mousePres1 == true) {
      mouse = new PVector(mouseX,mouseY);
      }
    else {
      if ((m % 5000) > 1500) {
        mouse = new PVector(random(0,width),random(0,height));        
      }
      else {
        mouse = mousetemp;
      }
    }      
    PVector dir = PVector.sub(mouse,location);
    dir.normalize(); 
    dir.mult(0.5); 
    randomized = PVector.random2D();
    randomized.mult(random(0.4));
    dir.add(randomized); 
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    lifespan -= lifespanDecrem;
  }
  void display() {
    
    if (diam > diamax) {
      sign = -1;
    }
    if (diam < diamin) {
      sign = 1;
    }    
    
    diam = diam + sign*incrediam*((m % m1)/500);
//    diam = diam + incrediam*((m % 1000)/500);
//    println((m % 500)/500);
    
    stroke(colorOfStroke-lifespan/3,lifespan);
    fill(colorOfParticle,lifespan);
    ellipse(location.x,location.y,diam,diam);
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
  boolean isDead() { 
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


