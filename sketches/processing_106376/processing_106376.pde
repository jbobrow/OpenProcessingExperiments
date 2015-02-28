
/* @pjs preload="water.jpg"; 
 */

//Separation, Alignment, Cohesion

int NUM_BOIDS = 100; 
ArrayList<Boid> flock = new ArrayList<Boid>();
HScrollbar sep;
HScrollbar ali;
HScrollbar coh;
PFont f = createFont("Lucida Bright Italic", 10.0, true);
PImage water, lightWater;
int BIG_ADD = 10;

void setup(){
  frameRate(40);
  size(640, 480);  
 
  for(int i = 0; i < NUM_BOIDS; i++){
   flock.add(new Boid(300, 300, (int)(Math.random()*360))); 
  }
  
  sep = new HScrollbar(10, 10, 200, 10, 5);
  ali = new HScrollbar(10, 50, 200, 10, 5);
  coh = new HScrollbar(10, 90, 200, 10, 5);
  water = loadImage("water.jpg");
  image(water,0,0);
}

void draw(){
  //background(18, 86, 137);
  //tint(255,50);
  image(water,0,0);
  
  
  
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
  
  fill(255);
  text("Number of Boids: " + flock.size(), width-200, 15);
}

void mousePressed(){
  if(mouseButton==LEFT)
     flock.add(new Boid(mouseX, mouseY,(int)(Math.random()*312))); 
  if(mouseButton==RIGHT){
    int H = (int)(Math.random()*360);

   for(int i = 0; i < BIG_ADD; i++){
     flock.add(new Boid(mouseX, mouseY, H));
   } 
  }
     
}

void keyPressed(){
  //System.out.println(key);
 if(key == 'c'){
 // if(key==RETURN){
  //  System.out.println("RETURN");
    for(Boid b : flock){
     b.H = (float)(Math.random()*360);
     b.S = (float)(Math.random()*50)+50;
     b.B = (float)(Math.random()*50) + 50;
   // } 
  }
 } 
}
//Separation, Alignment, Cohesion



class Boid{
 
 int size = 2;
 int COLOR_NUM = 20;
 int RANDOM_COLOR_CHANGE = 10;
 float visionCone = PI/6;
 float comfortZone = 15*size;
 float eyeSight = 37*size;
 float colorVision = 30*size;
 float speedLimit = 6*size;
 float forceLimit = .03*size;

  
 float sepWeight = 10;
 float aliWeight = .1;
 float cohWeight = .1; 
 
 PVector position;
 PVector velocity;
 PVector steeringForce;
 
 float H, S, B;

 
 public Boid(int x, int y, int H_){
  //position = new PVector((int)(Math.random()*width), (int)(Math.random()*height));
  position = new PVector(x, y);
  float angle = random(TWO_PI);
  velocity = new PVector(cos(angle), sin(angle));
  
    H = H_;
  
  S = (float)(Math.random()*50)+50;
  B = (float)(Math.random()*50) + 50;

 }
 
 void update(ArrayList<Boid> flock){
 
  steeringForce = new PVector(0,0);

  steeringForce.add(forces(flock));
  velocity.mult(.5);
  velocity.add(steeringForce);
  if(velocity.mag()<1)
    velocity.mult(2);
  velocity.limit(speedLimit);
  position.add(velocity);
  
    if (position.x < size){
      position.x = width-size;
    }
    if (position.y < size) {
      position.y = height-size;
    }
    if (position.x > width-size) {
      position.x = size;
    }
    if (position.y > height-size){
      position.y = size;
    }
 }

 PVector forces(ArrayList<Boid> flock){
   PVector steering = new PVector(0,0);
   PVector separation = new PVector(0,0);
   PVector alignment = new PVector(0,0);
   PVector cohesion = new PVector(0,0);
   PVector mouse = new PVector(mouseX, mouseY);
   int sepCount = 0;
   int counter = 0;
   int colorCount = 0;
   float frontColor = 0;
   for(Boid b: flock){
    //check if within eyesight for cohesion and alignment

    float dist =PVector.dist(this.position, b.position);
     if(dist < eyeSight && dist != 0){ 
       
       //alignment
       counter++;
       PVector temp = new PVector(b.velocity.x, b.velocity.y);
       temp.normalize();
       temp.div(dist);
       alignment.add(temp);
       
       //cohesion
       temp = PVector.sub(b.position, position);
       temp.normalize();
       temp.div(dist);
       temp.mult(100);
       cohesion.add(temp);
     }
     //separation
     if(dist < comfortZone && dist > 0){
       PVector temp = PVector.sub(position, b.position);
       temp.normalize();
       temp.div(dist);
       temp.mult(100);
       separation.add(temp);
       sepCount++;
     }
     
     if(dist < colorVision && dist>0){
       //color
       PVector disp = PVector.sub(b.position, this.position);
       float head = heading2D(disp);
       //if the other boid is ahead of this one
       if(Math.abs(head-heading2D(velocity))<PI/2 && Math.abs(head-heading2D(b.velocity)) < visionCone){
         frontColor += b.H;
         colorCount++;
       }
     }     
   } 
      
  if(colorCount==0){
  // H += (int)(Math.random()*RANDOM_COLOR_CHANGE);
   if( H > RANDOM_COLOR_CHANGE/2){
    //H-=RANDOM_COLOR_CHANGE/2; 
   }
    
  } else if (colorCount > 3){
    float otherColor = frontColor/colorCount;
    H = otherColor;
    //H = (H*COLOR_NUM + otherColor)/(COLOR_NUM+1);
    
  } else {
    float otherColor = frontColor/colorCount;
    H = (otherColor + H)/2;
  }
      
  mouse.sub(position);
  float dist = mouse.mag();
  mouse.normalize();
  mouse.div(dist);
  mouse.mult(5);  
 if(!mousePressed){
   if(keyPressed){
     if(key == ' '){
       //if(keyCode == CONTROL){
         steering.sub(mouse);
       //}
     }
   }
 }
  if(counter > 0)
    alignment.div(counter);
  if(counter > 0)
    cohesion.div(counter);
  if(sepCount > 0)
     separation.div(sepCount); 

  alignment.mult(aliWeight);
  alignment.limit(forceLimit);
  steering.add(alignment);
  
  cohesion.mult(cohWeight);
  cohesion.limit(forceLimit);
  steering.add(cohesion);
  
  separation.mult(sepWeight);
  separation.limit(forceLimit);
  steering.add(separation);
  
  return steering;
 }


void render() {
    H %= 360;
    // Draw a triangle rotated in the direction of velocity
    float theta = heading2D(velocity) + PI/2;
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    colorMode(HSB, 360, 100, 100);
    fill(H,S,B);
    noStroke();
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, size);
    vertex(-2*size,4*size);
    vertex(2*size, 4*size);
    endShape();
    ellipseMode(CENTER);
    ellipse(0,-size,2*size,6*size);
    popMatrix();
  }
 
  float heading2D(PVector pvect){
     return (float)(Math.atan2(pvect.y, pvect.x));  
  }

  void rotate2D(PVector v, float theta) {
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
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
    colorMode(RGB, 255, 255, 255);
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
    
    return .6*(sqrt(sqrt(spos -sposMin)))-.6400;
  }
}


