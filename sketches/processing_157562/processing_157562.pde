

ArrayList<Particle> particles;
int NumOfParticles = 200;

ArrayList<CircleFood> circles;
int NumOfCircles = 10;

int lifespanCircleVal = 3400;
int diameter = 15;

int lifespanDecrem = 2;

float Cfriction = 0.050;

PVector mousetemp = new PVector(0,0);

boolean mousePres1 = false;
PVector mouselast = new PVector (mouseX, mouseY);
PVector mouse;

float maxspeed = 9;

int diamax = 20;
int diamin = 8;

int m = 0;

float colrandom = random(60,90);

void setup() {
  frameRate(20);
  size(600,600);
  smooth();
  
  circles = new ArrayList<CircleFood>();    
  particles = new ArrayList<Particle>();  
}

void draw() {
  background(11,20,70);
  
//  println(circles.size());
  
  FishButton();
  
  m = millis();

  mouse = new PVector(0, 0);
  if (mousePres1 == true) {
      mouse = new PVector(mouseX,mouseY);
      }
  else {
    if ((m % 5000) > 3000) {
      PVector Vtemp;       
      Vtemp = PVector.random2D( );
      Vtemp.mult(80);      
      mouse = PVector.add(mouselast, Vtemp);
      }
    else {
      mouse = mouselast;
      }
    }
    
  for (int i = circles.size()-1; i >= 0; i--) {
    CircleFood cir = circles.get(i);
    cir.update(); 
    cir.checkEdges();
    cir.display();   
    if (cir.isDead()) {
      circles.remove(i);
    }
   
  }

  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update(); 
    p.checkEdges();
    p.display();    
    if (p.isDead()) {
      particles.remove(i);
    }
  }
  
}

void FishButton() {
  pushMatrix();
  ellipseMode(CENTER);
  translate(diamax*2.8,diamin*3.2);
  stroke(0);
  fill(210);
  triangle(-3*(diamax/3),0,(-2.5*diamax),(-3*2*diamin/5),(-2.5*diamax),(3*2*diamin/5));
  triangle(0,0,(-3*diamax/2),(-3*diamin),0,(-3*diamin/2));
  triangle(0,0,(-3*diamax/2),(3*diamin),0,(3*diamin/2));
  ellipse(0,0,4*diamax,3*diamin);
  textSize(14);
  textAlign(CENTER);  
  fill(20);  
  text("FISH:", -diamax/1.35, diamin/2); 
  text(particles.size(), diamax/1.1, diamin/2);   
  popMatrix();
}
  
void mousePressed() {
  mousePres1 = true;
  
  if ((particles.size() < NumOfParticles) && (mouseX < diamax*6) && (mouseY < diamin*6)) {
    for (int i = 0; i < int(random(1,(NumOfParticles-particles.size()))); i++) {
      particles.add(new Particle(new PVector(mouseX+random(-10,10),mouseY+random(-10,10))));
    }
  }
}

void mouseDragged() {
  mousePres1 = true; 
}  

void mouseReleased() {
  mousePres1 = false;
  mouselast = new PVector (pmouseX, pmouseY);
  
  if ((circles.size() < NumOfCircles) && (mouseX > diamax*6) && (mouseY > diamin*6)) {
    for (int i = 0; i < NumOfCircles-circles.size(); i++) {
      mousetemp = new PVector(mouseX+random(-1*diameter,1*diameter),mouseY+random(-1*diameter,1*diameter));
      circles.add(new CircleFood(mousetemp));
    }
  }
}

class CircleFood {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector temp;
  float topspeed;
  PVector randomized;  
  int lifespan;
  color colorOfParticle;
  color colorOfStroke; 
  float diam;
  float incrediam = 0.05;
  float m1;
  
  CircleFood(PVector l) {
    location = l.get();   
    temp = mousetemp;    
    m1 = random (500, 1000);    
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001,0.001);
    diam = diameter/2 + random (-diameter/5, diameter/5);
    topspeed = (maxspeed/4)-random(maxspeed/6,maxspeed/5);
    colorOfParticle = color(colrandom+random(-30,30),colrandom+random(-30,30),colrandom+random(-30,30));
    colorOfStroke = color(colrandom+random(-50,0),colrandom+random(-50,0),colrandom+random(-50,0));        
    lifespan = int(random(lifespanCircleVal/2,lifespanCircleVal));    
  }
  
  void update() {
    PVector dir = PVector.sub(temp,location);
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
    diam = diam - incrediam;
    if (diam < diamin/4) {
      lifespan = 2; 
    }

    stroke(colorOfStroke);
    fill(colorOfParticle);
    ellipse(location.x,location.y,diam,diam);
  }
  
  void checkEdges() {
    if (location.x > width) {
      lifespan = 0;      
    } else if (location.x < 0) {
      lifespan = 0; 
    }
    if (location.y > height) {
      lifespan = 0;    
    } else if (location.y < 0) {
      lifespan = 0;       
    }    
  }
  boolean isDead() { 
    if (lifespan < 10) {
      return true;
    } else {
      return false;
    }
  }
}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector randomized;  
  float topspeed;  
  boolean particleOut = false; 
  float colorOfParticle;
  color colorOfStroke;  

  Particle(PVector l) {

    location = l.get();
    
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001,0.01);
    topspeed = maxspeed-random(0,maxspeed/3);
    
    colorOfParticle = (colrandom+random(-20,20));
    colorOfStroke = color(colrandom+random(-30,0));    

  }
  
  void update() {      
    PVector dir = PVector.sub(mouse,location);
    dir.normalize(); 
    dir.mult(0.5); 
    randomized = PVector.random2D();
    randomized.mult(random(0, 0.55));
    dir.add(randomized); 
    acceleration = dir; 
    
    PVector friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(Cfriction); 
    acceleration.add(friction);    

    velocity.add(acceleration);
    velocity.limit(topspeed);
    
    location.add(velocity);
  }
  
  void display() {
    float angle = velocity.heading2D();
    float opacity = map(angle, -PI, PI, 100.0, 200.0);
    float colorOfParticle2 = colorOfParticle+abs(angle)*35;
    
    stroke(colorOfStroke,opacity);
    fill(colorOfParticle2-30,colorOfParticle2-30,colorOfParticle2+40);
    
    pushMatrix();
    ellipseMode(CENTER);
    translate(location.x,location.y);
    rotate(angle);
    triangle(-diamax/3,0,-diamax,-2*diamin/5,-diamax,2*diamin/5);
    triangle(0,0,-diamax/2,-diamin,0,-diamin/2);
    triangle(0,0,-diamax/2,diamin,0,diamin/2);
    ellipse(0,0,diamax,diamin);    
    popMatrix();
  }
  
  void checkEdges() {
    if (location.x > width) {
      particleOut = true;      
    } else if (location.x < 0) {
      particleOut = true; 
    }
    if (location.y > height) {
      particleOut = true;    
    } else if (location.y < 0) {
      particleOut = true;       
    }    
  }
  
  boolean isDead() { 
    if (particleOut == true) {
      return true;
    } else {
      return false;
    }
  }
}


