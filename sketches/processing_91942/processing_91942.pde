
ArrayList carFleet;
ArrayList explosions;

void setup() {
  size(600, 600);
  carFleet = new ArrayList();
  explosions = new ArrayList();
}

//Move cars around
void draw() {
  Car car1, car2;
  Explosion exp;
  int i, j;
  float energy;
  background(255);
  makeTitle("Bump Cars");
  //interact
  for (i=0; i < carFleet.size(); i++) {
    car1 = (Car) carFleet.get(i);
    for (j=0; j < i; j++) {
      car2 = (Car) carFleet.get(j);
      if (crash(car1, car2)) {
        energy = collide(car1, car2);
        twoCarDisjoint(car1, car2);
        explosions.add(explosion(car1, car2, energy));        
      }
    }
  }
  //move cars
  for (i=0; i < carFleet.size(); i++) {
    car1 = (Car) carFleet.get(i);
    car1.drive();
  }
  //draw cars and explosions
  for (i=0; i < carFleet.size(); i++) {
    car1 = (Car) carFleet.get(i);
    car1.display();
  }
  for (j=0; j < explosions.size(); j++) {
    exp = (Explosion) explosions.get(j);
    exp.display();
  }
  //clean explosions
  for (j=0; j < explosions.size(); j++) {
    exp = (Explosion) explosions.get(j);
    if ( exp.getTimer() >= exp.getDuration() ){
      explosions.remove(j);
    }
  }
}

//On mouse press add car if empty. Otherwise remove car(s).
void mousePressed() {
  boolean removed = false;
  for (int i=0; i < carFleet.size(); i++) {
    Car car = (Car) carFleet.get(i);
    if (car.isHere(mouseX, mouseY)) {
      carFleet.remove(i);
      removed = true;
    }
  }
  if (!removed) {
    carFleet.add(genCar(mouseX, mouseY));
  }
}

//Create a new car at position (x,y) with random color and speed.
Car genCar(int x, int y) {
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  float m = random(900, 1400);
  float v = random(.4, 2.);
  float[] p = {x, y};
  return new Car(color(r, g, b), m, p, v);
}

Explosion explosion(Car car1, Car car2, float energy) {    
  boolean translationX = false;
  boolean translationY = false;
  float[] p1 = car1.getPos(); 
  float[] p2 = car2.getPos(); 
    
  /* ------Begin ----
  To accurately determine
  a two-car explosion centre
  in a cyclic boundary canvas,
  a half-width translation may
  be required.
  */
  if (abs(p2[0] - p1[0]) > width/2) { 
    translationX = !translationX;
    
    p2[0] = (p2[0] + width/2)%width;
    p1[0] = (p1[0] + width/2)%width; 
  }
  if (abs(p2[1] - p1[1]) > height/2) { 
    translationY = true;
    p2[1] = (p2[1] + height/2)%height;
    p1[1] = (p1[1] + height/2)%height; 
  }
  /* ---- end -----*/
  
  float[] newPos = {(p1[0] + p2[0])/2, (p1[1] + p2[1])/2};
  
  /* ----- begin ----
  Revert the half-width translation.
  */
  if (translationX) { newPos[0] = (newPos[0] + width/2)%width; }
  if (translationY) { newPos[1] = (newPos[1] + height/2)%height; }
  /* ----- end ----- */

 //Explosion size should be a function of cars energy difference.
  energy = energy/17; 
  float[] newSize = {energy, 2*energy};
  
  return new Explosion(newSize, newPos);
/*
  stroke(0);
  fill(color(255,0,0)); //Red explosion
  ellipse(x,y,30,30);
*/
}

 //Do these cars crash?
 boolean crash(Car car1, Car car2){
   boolean crash = false;
   float[] p1 = car1.getPos();
   float[] s1 = car1.getSize();
   float[] p2 = car2.getPos();
   float[] s2 = car2.getSize();
   float[] d = new float[2];
   float[] l = new float[2];
   d[0] = abs(p1[0] - p2[0]);
   if (d[0] > 1.2*width/2) { d[0] = width - d[0]; }
   d[1] = abs(p1[1] - p1[1]);
   l[0] = (s1[0] + s2[0])/2;
   l[1] = (s1[1] + s2[1])/2;
   if (l[0] >= d[0]){
     if (l[1] >= d[1]) {
       crash = true;
       print("Crash: dx " + d[0] + ", dy " + d[1] + ", lx " + l[0] + ", ly " + l[1] + ".\n");
     }
   }
   return crash;
 } 
 
 // Collide cars and resolve the kinematics:
 float collide(Car car1, Car car2){
 /*
  Let us consider two objects with respective 
  masses and velocities given by (m,M) and (v,V).
  Pre-collision velocities are annotated with a subscripted i
  and post-collisions are subscripted with f.
  Let us define the velocity variations post-collision:
  dV = Vf - Vi
  dv = vf - vi
  Applying momentum and kinetic energy conservation laws:
  M*Vi + m*vi = M*Vf + m*vf
  M*Vf^2 + m*vi^2 = M*Vf^2 + m*vf^2
  A little algebra yields:
  dv = 2/(m/M+1)*(Vi-vi)
  dV = 2/(M/m+1)*(vi-Vi)
  and the final velocities are:
  Vf = Vi + dV
  vf = vi + dv 
 */
  float m1 = car1.getMass();
  float v1 = car1.getVelX();
  float m2 = car2.getMass();
  float v2 = car2.getVelX();
  float[] dV = {2/(m1/m2+1)*(v2-v1), 2/(m2/m1+1)*(v1-v2)};
  car1.accel(dV[0]);
  car2.accel(dV[1]);
  float energy = (m1/2*dV[0]*dV[0] + m2/2*dV[1]*dV[1])/2;
  return energy; 
}
 
void twoCarDisjoint(Car one, Car two) {
/*
  Correct positions to avoid overlapped cars
*/
    float[] p1 = one.getPos();
    float[] s1 = one.getSize();
    float[] p2 = two.getPos();
    float[] s2 = two.getSize();
    float[] newP2 = new float[2];
    if ( p2[0] - p1[0] > 0){
      newP2[0] = p1[0]+(s1[0]+s2[0])/2;
    } else {
      newP2[0] = p1[0]-(s1[0]+s2[0])/2;
    }
    newP2[1] = p2[1];
    two.setPos(newP2);
}

void makeTitle(String title) {
  textSize(80);
  fill(0, 102, 153);
  text(title, width/9, height/8);
  //Instructions
  textSize(28);
  text("(mouse click)", width/3, height/2);
  //Credits
  text("guillaume riflet, 2013 ", width/4, height*11/12);
}

class Car {
  
  //properties
  private color paint; 
  private float mass;
  private float[] pos = new float[2];
  private float[] vel = new float[2];
  private float[] sizec = new float[2];
  private float[] domain = new float[2];
  
  //constructor
  Car(color inC, float inM, float[] inP, float inVx){
    paint = inC;
    mass = inM; 
    pos[0] = inP[0];
    pos[1] = inP[1];
    vel[0] = inVx;
    vel[1] = 0;
    sizec[0] = 40; 
    sizec[1] = 20;
    domain[0] = float(width); domain[1] = float(height);
  }
  
  //Sets and Gets
  color getPaint(){ return paint; }
  void setPaint(color c) { this.paint = c; }
  float getMass(){ return mass; }
  void setMass(float m) { this.mass = m; }
  float[] getPos() { return pos; }
  void setPos(float[] p) { this.pos[0] = p[0]; this.pos[1] = p[1]; }  
  float[] getVel() { return vel; }
  void setVel(float[] v) { this.vel[0] = v[0]; this.vel[1] = v[1]; }
  float[] getSize() { return sizec; }
  void setSize(float[] s) { this.sizec[0] = s[0]; this.sizec[1] = s[1]; }
  float getVelX() { return vel[0]; }
    
  //methods
  void display() {
    rectMode(CENTER);
    //draw wheels
    stroke(0);
    fill(110); //tire color;
    rect(pos[0]+sizec[0]/3,pos[1]+sizec[1]/2,sizec[0]/5,sizec[1]/5); //fl wheel
    rect(pos[0]+sizec[0]/3,pos[1]-sizec[1]/2,sizec[0]/5,sizec[1]/5); //fr wheel
    rect(pos[0]-sizec[0]/3,pos[1]+sizec[1]/2,sizec[0]/5,sizec[1]/5); //bl wheel
    rect(pos[0]-sizec[0]/3,pos[1]-sizec[1]/2,sizec[0]/5,sizec[1]/5); //br wheel
    //draw car chassis
    noStroke();
    fill(paint); //car paint color
    rect(pos[0],pos[1],sizec[0],sizec[1]); //chassis
  }
    
  void accel(float accelX){
    vel[0] = vel[0] + accelX;
  }
  
  void drive() {
    add(vel[0]);
  }
  
  float add(float vector){
    pos[0] = (pos[0] + vector + width)%width;
    return pos[0];
  }
 
  //is the car located at these coordinates? 
  boolean isHere(int pX, int pY) {
    boolean b = false;
    float dx = abs(pos[0] - pX);
//    if (dx > width/2) { dx = width - dx; }
    float dy = abs(pos[1] - pY);
    if (dx <= sizec[0]/2) {
      if (dy <= sizec[1]/2) {
        b = true;
      }
    }
    return b;
  }
  
}

class Explosion {
  
  //Properties
  private float[] sizex = new float[2];
  private float[] pos = new float[2];
  private float[] domain = new float[2];
  private int timer;
  private int duration;
  
  //Constructor
  Explosion(float[] inS, float[] inP) {
    sizex[0] = inS[0];
    sizex[1] = inS[1];
    pos[0] = inP[0];
    pos[1] = inP[1];
    domain[0] = float(width); 
    domain[1] = float(height);
    //sets the timer to zero
    timer = 0;
    //Computes duration of explosion
    duration = 20;
  }
  
  //Gets and Sets
  float[] getSizex(){ return sizex; }
  void setSizex(float[] inS) { this.sizex[0] = inS[0]; this.sizex[1] = inS[1]; }
  float[] getPos(){ return pos; }
  void setPos(float[] inP) { this.pos[0] = inP[0]; this.pos[1] = inP[1]; }
  long getTimer() { return timer; }
  long getDuration() { return duration; }
  
  //Methods
  void display(){
    updateSize();
    stroke(0);
    fill(color(255,0,0)); //Red explosion
    ellipse(pos[0],pos[1],sizex[0],sizex[1]);    
    timer++; //increment timer
  }
  
  void updateSize(){ 
    float reductor = float(duration - timer)/float(duration);
    sizex[0] = sizex[0]*reductor;
    sizex[1] = sizex[1]*reductor;
  }

}
