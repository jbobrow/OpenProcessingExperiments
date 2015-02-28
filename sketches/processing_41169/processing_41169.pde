
//import sms.*;

PImage img;

ParticleSystem ps;
boolean showVectors = false;
 
void setup(){
  size(500, 311, P3D);
  ps = new ParticleSystem(1, new PVector(width/1.4, height/3.2,10));
  //smooth();
  img=loadImage("file:///Network/Servers/digital-locker.design.yorku.ca/Volumes/YSDNSTUD_1/YSDNSTUD_1/jessho/Desktop/sketch_oct06b/garden-hose.jpg");
}
 
void draw(){
  background(255);
  image(img,0,0);
  
  PVector G = new PVector(mouseX - width/2,mouseY - height/2);
  //PVector G = new PVector(-Unimotion.getSMSX(),Unimotion.getSMSZ());
  G.normalize();
   
  ps.gravity = G.get();
  ps.run();
  ps.addParticle();
}
 
void keyPressed() {
  showVectors = !showVectors;
}
class Particle {
   
  PVector loc;
  PVector vel;
  PVector acc;
   
  color c;
  int radio;
   
  float bounce = 0.8;
  float timer;
   
  float mass;
   
  boolean colliding = false;
   
  PImage img;
   
  Particle(PVector setLoc){
     
    loc = setLoc.get();
    vel = new PVector(random(-1,2),random(-2,2));
    acc = new PVector(random(-1,2),random(-2,2));
     
    radio = (int)random(3,10);
     
    mass = radio/2;
     
    c = color(random(0),random(0),random(0));
     
    timer = 255;
     
    img = null;
  }
   
  Particle(PVector setLoc, PImage setImg){
     
    loc = setLoc.get();
    vel = new PVector(random(-2,2),random(-2,0));
    acc = new PVector(0,0);
     
    radio = (int)random(3,10);
     
    mass = radio/2;
     
    c = color(random(0,30),random(40,180),random(200,250));
     
    timer = 255;
     
    img = setImg;
  }
   
  void go(){
    update();
    checkBordes();
    render();
  }
   
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    timer -= 1.0;
  }
   
  void drawShape(){
     
    if (img == null) {
      fill(red(c),green(c),blue(c),timer);
      noStroke();
      ellipse(loc.x,loc.y,radio*2,radio*2);
    } else {
      imageMode(CENTER);
      fill(red(c),green(c),blue(c),timer);
      image(img,loc.x,loc.y,radio,radio);
    }
  }
 
  void render(){
    drawShape();
     
    if (showVectors) {
      drawVector(vel,loc,10);
      //drawVector(G,loc,100);
    }
  }
   
  boolean dead(){
    if (timer <= 0.0){
      return true;
    } else {
      return false;
    } 
  }
   
  void checkBordes(){
    if (loc.y + radio >= height){
      loc.y = height - radio;
      vel.y *= -bounce;
    }
     
    if (loc.y - radio <= 0) {
      loc.y = radio;
      vel.y *= -bounce;
    }
     
     
    if(loc.x + radio >= width){
      loc.x = width - radio;
      vel.x *= -bounce;
    }
     
    if (loc.x - radio <= 0){
      loc.x = radio;
      vel.x *= -bounce;
    }
  }
   
  void applyForce(PVector force){
    force.div(mass);
    acc.add(force);
  }
 
  PVector calcGravForce(Particle p){
    PVector dir = PVector.sub(loc,p.loc);
    float d = dir.mag();
    //d = constrain(d,5.0,25.0);
    dir.normalize();
    float force = (9.8 * radio * p.radio) / (d * d);
    dir.mult(force);
    return dir;
  }
   
  void collideEqualMass(Particle p) {
    float d = PVector.dist(loc,p.loc);
    float sumR = radio + p.radio;
    // Are they colliding?
    if (!colliding && d < sumR) {
      // Yes, make new velocities!
      colliding = true;
      // Direction of one object to another
      PVector n = PVector.sub(p.loc,loc);
      n.normalize();
       
      // Difference of velocities so that we think of one object as stationary
      PVector u = PVector.sub(vel,p.vel);
       
      // Separate out components -- one in direction of normal
      PVector un = componentVector(u,n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      vel = PVector.add(u,p.vel);
      p.vel = PVector.add(un,p.vel);
    } else if (d > sumR) {
      colliding = false;
    }
  }
   
}
class ParticleSystem {
  PVector gravity = new PVector(0,9.8);
       
  ArrayList particles;
  PVector origin;
   
  float t = 0;
   
  PImage img = null;
   
  boolean bouncing = false;
   
  ParticleSystem(int num, PVector v){
    particles = new ArrayList();
    origin = v.get();
    for(int i = 0; i < num; i++){
      particles.add(new Particle(origin));
    }
  }
   
  void run(){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = (Particle) particles.get(i);
       
      if (bouncing) {
        for(int a = 0; a < particles.size(); a++){
          if(a != i){
            Particle pa = (Particle) particles.get(a);
            p.collideEqualMass(pa);
          }
        }
      }
 
      PVector G = gravity.get();
     
      p.applyForce(G);
      p.go();
       
      if (p.dead()){
        particles.remove(i);
      }
    }
     
    t += 0.7;
  }
   
  void addParticle(){
    particles.add(new Particle(origin,img));
  }
   
  void addParticle(Particle p){
    particles.add(p);
  }
   
  boolean dead(){
    if (particles.isEmpty()){
      return true;
    } else {
      return false;
    }
  }
   
}
void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(0);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}
 
PVector componentVector (PVector vector, PVector directionVector) {
  //--! ARGUMENTS: vector, directionVector (2D vectors)
  //--! RETURNS: the component vector of vector in the direction directionVector
  //-- normalize directionVector
  directionVector.normalize();
  directionVector.mult(vector.dot(directionVector));
  return directionVector;
}

