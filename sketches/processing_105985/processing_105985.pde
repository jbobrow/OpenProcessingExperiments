
//Separation, Alignment, Cohesion

int NUM_BOIDS = 100; 
ArrayList<Boid> flock = new ArrayList<Boid>();
HScrollbar sep;
HScrollbar ali;
HScrollbar coh;
PFont f = createFont("Lucida Bright Italic", 10.0, true);


void setup(){
  frameRate(60);
  size(600, 400);
 
  for(int i = 0; i < NUM_BOIDS; i++){
   flock.add(new Boid(300, 300)); 
  }
  
  sep = new HScrollbar(10, 10, 200, 10, 5);
  ali = new HScrollbar(10, 50, 200, 10, 5);
  coh = new HScrollbar(10, 90, 200, 10, 5);
}

void draw(){
  background(50);
  
  
  
  for(Boid b: flock){

    b.sepWeight = sep.getPos();
    b.aliWeight = ali.getPos();
    b.cohWeight = coh.getPos();
    b.update(flock);
    b.render(); 
   
  }
  
  sep.update();
  sep.render();
  textFont(f, 10);
  fill(255);
  textAlign(LEFT);
  text("Separation: " + sep.getPos(), 210, 15);
  
  ali.update();
  ali.render();
  fill(255);
  text("Alignment: " + ali.getPos(), 210, 55);
  
  coh.update();
  coh.render();
  fill(255);
  text("Cohesion: " + coh.getPos(), 210, 95);
}

void mouseClicked(){
 flock.add(new Boid(mouseX, mouseY)); 
}
//Separation, Alignment, Cohesion



class Boid{
  
 float comfortZone = 25;
 float eyeSight = 200;
 float speedLimit = 5;
 float forceLimit = .03;
 float r = 2.0;
  
 float sepWeight = 10;
 float aliWeight = .1;
 float cohWeight = .1; 
 
 PVector position;
 PVector velocity;
 PVector steeringForce;

 
 public Boid(int x, int y){
  //position = new PVector((int)(Math.random()*width), (int)(Math.random()*height));
  position = new PVector(x, y);
  float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));
 }
 
 void update(ArrayList<Boid> flock){
 
  steeringForce = new PVector(0,0);
  steeringForce.add(alignment(flock));
  steeringForce.add(cohesion(flock));
  steeringForce.add(separation(flock));
  
 
  velocity.add(steeringForce); 
  velocity.limit(speedLimit);
  position.add(velocity);
  
    if (position.x < r){
      position.x = width-r;
    }
    if (position.y < r) {
      position.y = height-r;
    }
    if (position.x > width-r) {
      position.x = r;
    }
    if (position.y > height-r){
      position.y = r;
    }
 }
 
 PVector edges(){
   PVector toRet = new PVector (0,0);
   if(position.x < comfortZone){
      toRet.add(new PVector(position.x, 0));
    } else if (position.x > width-comfortZone){
     toRet.add(new PVector(position.x-width, 0)); 
    }
    if(position.y< comfortZone){
     toRet.add(new PVector(0, position.y));
    } else if(position.y > height-comfortZone){
      toRet.add(new PVector(0, position.y-height));
  }
  toRet.mult(.1);
  return toRet;
 }
 
 PVector separation(ArrayList<Boid> flock){
   PVector toRet = new PVector(0,0);
   int count = 0;
   for(Boid b: flock){
     float dist = PVector.dist(this.position, b.position);
     if(dist < comfortZone && dist > 0){
        PVector toSub = PVector.sub(position, b.position);
       toSub.normalize();
       toSub.div(dist);
       toRet.add(toSub);
       count++;
     }
   }
    if(count != 0){
     toRet.div(count); 
    }
   toRet.mult(sepWeight);
   toRet.limit(forceLimit);
   return toRet;
 }
 
 PVector alignment(ArrayList<Boid> flock){
  PVector toRet = new PVector(0,0);
  int counter = 0;
  for(Boid b : flock){
   float dist = PVector.dist(this.position, b.position);
     if(dist < eyeSight && dist != 0){
       counter++;
       PVector toSub = new PVector(b.velocity.x, b.velocity.y);
       toSub.normalize();
       toSub.div(dist);
       toRet.add(toSub);
     }
  }
  if(counter > 0){
    toRet.div(counter);
  }
  toRet.mult(aliWeight);
  toRet.limit(forceLimit);
  return toRet; 
 }
 
 PVector cohesion(ArrayList<Boid> flock){
  PVector toRet = new PVector(0,0);
  int counter = 0;
  for(Boid b : flock){
   float dist = PVector.dist(this.position, b.position);
     if(dist < eyeSight && dist > 0){
       counter++;
       toRet.add(b.position);
     }
  }
  if(counter > 0){
    toRet.div(counter);
  }
  toRet.sub(position);
  toRet.mult(cohWeight);
  toRet.limit(forceLimit);
  return toRet; 
 }
 
 
void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    
    fill(255);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -10);
    vertex(-5,10);
    vertex(5, 10);
    endShape();
    popMatrix();
  }

}
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void render() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    
    return .6*(sqrt(sqrt(spos -sposMin)))-.55;
  }
}


