
//Under Sketch click Add file and add REngine.jar and RserveEngine.jar
//also boot up R and type:
/*
library(Rserve)
Rserve()
*/
import peasy.*;
import org.rosuda.REngine.Rserve.*;
import org.rosuda.REngine.*;
import org.gicentre.utils.stat.*;

private PeasyCam pcam;
double W;
double[] data;
Flocks flock; // a collection of predator and prey flocks
BarChart barChart;
BarChart predChart;

void setup() {
  size(1000, 1000, P3D);
  colorMode(RGB);
   
   flock = new Flocks(this);  
  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    flock.addPrey(new Prey(width/4+random(-50,50),width/2+random(-50,50),width/2+random(-50,50)));    
  }
  for (int i = 0; i < 10; i++) {
    flock.addPred(new Pred(width/2,width/2,width/2));//3*width/4+random(-50,50),width/2+random(-50,50),width/2+random(-50,50)));    
  }
  barChart = new BarChart(this); 
  barChart.setMinValue(0);
  barChart.setMaxValue(2);
  predChart = new BarChart(this); 
  predChart.setMinValue(0);
  predChart.setMaxValue(2);
  textFont(createFont("Serif",20),50);
  barChart.showValueAxis(true);  
  barChart.showCategoryAxis(true);
  predChart.showValueAxis(true);  
  predChart.showCategoryAxis(true); 
  pcam = new PeasyCam(this, width/2, width/2, width/2, 5*width);
  pcam.setMinimumDistance(-width);
  pcam.setMaximumDistance(5*width);    
}

void draw() {
  background(50);  
  flock.run();  
  //pcam.rotateY(PI/400);
  // OUTLINE THE BORDERS
  fill(100,100,100);
  stroke(100,100,100);
  line(0,0,0,width,0,0);
  line(0,0,0,0,width,0);
  line(0,0,0,0,0,width);

  line(width,0,0,width,width,0);
  line(width,0,0,width,0,width);
  line(0,width,0,width,width,0);
  line(0,width,0,0,width,width);
  line(0,0,width,0,width,width);
  line(0,0,width,width,0,width);

  line(width,width,width,0,width,width);
  line(width,width,width,width,0,width);
  line(width,width,width,width,width,0);
  
  /*line(width/2,width/2,width/2,width/2,width/2,width/2+100);
  text("z",width/2,width/2,width/2+100);
  line(width/2,width/2,width/2,width/2,width/2+100,width/2);
  text("y",width/2,width/2+100,width/2);
  line(width/2,width/2,width/2,width/2+100,width/2,width/2);
  text("x",width/2+100,width/2,width/2);*/
  
  barChart.draw(15,15,width-30,width-30);
  pushMatrix();
    rotateY(-PI/2); 
    translate(0,0,-width); 
    predChart.draw(15,15,width-30,width-30);
  popMatrix();  
}

/*
void mousePressed() {
  if (mouseX > width/2+300) pcam.rotateY(PI/3);
  if (mouseX < width/2-300) pcam.rotateY(-PI/3);
  if (mouseY > width/2+500) pcam.rotateX(PI/3);
  if (mouseY < width/2-500) pcam.rotateX(-PI/3);  
}
*/

double variate(float d){  
  data = new double[1];
  data[0] = (double)d;  
  try { // connect to R      
    RConnection c = new RConnection();
    c.assign("d",data);                
    W = c.eval("rbinom(1,1,.5+exp(-d^2))").asDouble();  
    c.close();      
  }
  catch ( REXPMismatchException rme ) {
    rme.printStackTrace();
  }
  catch ( REngineException ree ) {
    ree.printStackTrace();
  } 
  return W;
}
// The Flocks (two lists, one of Prey objects & one of Pred objects)

class Flocks {  
  PApplet applet;
  ArrayList<Prey> preys; // An ArrayList for all the boids
  ArrayList<Pred> preds; // An ArrayList for all the boids  
  int max_pop_prey=250;
  int max_pop_pred=250;

  Flocks(PApplet app) {
    applet = app;
    preys = new ArrayList<Prey>(); // Initialize the ArrayList
    preds = new ArrayList<Pred>(); // Initialize the ArrayList    
  }

  void run() {    
    float av_sep=0;
    float av_ali=0;
    float av_coh=0;
    float av_a=0;    
    for (int i=preys.size()-1; i>=0; i--) {     
      Prey b = preys.get(i);
      av_sep+=b.sep_;
      av_ali+=b.ali_;
      av_coh+=b.coh_;
      av_a+=b.avo_;      
      matePrey(b,i);     
      b.run(preys,preds);  // Passing the entire list of boids to each prey individually            
      if (b.dead) preys.remove(i);
    }
    av_sep/=preys.size();
    av_ali/=preys.size();
    av_coh/=preys.size();
    av_a/=preys.size();
    barChart.setData(new float[] {av_sep,av_ali,av_coh,av_a});
    barChart.setBarLabels(new String[] {"sep","ali","coh","avo"});
    
    av_sep=0;
    av_ali=0;
    av_coh=0;
    av_a=0; 
    for (int i=preds.size()-1; i>=0; i--) {
      Pred b = preds.get(i);   
      av_sep+=b.sep_;
      av_ali+=b.ali_;
      av_coh+=b.coh_;
      av_a+=b.att_;     
      matePred(b,i);
      b.run(applet,preds,preys);  // Passing the entire list of preds to each prey individually      
      if (b.last_ate>b.starvation) preds.remove(i);
    }    
    av_sep/=preds.size();
    av_ali/=preds.size();
    av_coh/=preds.size();
    av_a/=preds.size();
    predChart.setData(new float[] {av_sep,av_ali,av_coh,av_a});
    predChart.setBarLabels(new String[] {"sep","ali","coh","att"}); 
    fill(100,100,100);
    stroke(100,100,100);   
    text("PREY POP",width/2-100,-width/6-50,0);    
    text(preys.size(),width/2,-width/6,0);
    pushMatrix();
      rotateY(-PI/2); 
      translate(0,0,-width); 
      text(preds.size(),width/2,-width/6,0);
      text("PRED POP",width/2-100,-width/6-50,0);
    popMatrix(); 
  }

  void addPrey(Prey b) {
    preys.add(b);
  }
  void addPred(Pred b) {
    preds.add(b);
  }

  void matePrey(Prey b, int i) {
    if (max_pop_prey<=preys.size()) return;
    b.wait++;  
    if (b.wait>b.recover) b.wait=0;
    else return;
    for (int j=preys.size()-1; j>=0; j--){
      Prey p = preys.get(j);
      float d = PVector.dist(b.location,p.location);      
      if (random(1)>d/100 && i!=j){
        PVector position=PVector.add(b.location,p.location);
        position.mult(0.5);
        preys.add(new Prey(position.x,position.y,position.z));
        Prey q = preys.get(preys.size()-1);
        q.velocity = PVector.add(b.velocity,p.location);
        q.velocity.mult(0.5);
        q.sep_ = random(-.5,.5)+(b.sep_+p.sep_)/2;
        q.ali_ = random(-.5,.5)+(b.ali_+p.ali_)/2;
        q.coh_ = random(-.5,.5)+(b.coh_+p.coh_)/2;
        q.avo_ = random(-.5,.5)+(b.avo_+p.avo_)/2;
        q.recover = random(-5,5)+(b.recover+p.recover)/2;
        println("BIRTH");   
        return; // only one baby per round     
      }
    }       
    return; 
  }

 void matePred(Pred b, int i) {
    if (max_pop_pred<=preds.size()) return;
    b.wait++;  
    if (b.wait>b.recover) b.wait=0;
    else return;       
    for (int j=preds.size()-1; j>=0; j--){
      Pred p = preds.get(j);
      float d = PVector.dist(b.location,p.location);      
      if (random(1)>d/100 && i!=j){
        PVector position=PVector.add(b.location,p.location);
        position.mult(0.5);
        preds.add(new Pred(position.x,position.y,position.z));
        Pred q = preds.get(preds.size()-1);
        q.velocity = PVector.add(b.velocity,p.location);
        q.velocity.mult(0.5);
        q.sep_ = random(-.5,.5)+(b.sep_+p.sep_)/2;
        q.ali_ = random(-.5,.5)+(b.ali_+p.ali_)/2;
        q.coh_ = random(-.5,.5)+(b.coh_+p.coh_)/2;
        q.att_ = random(-.5,.5)+(b.att_+p.att_)/2;
        q.recover = random(-5,5)+(b.recover+p.recover)/2;
        println("BAD BIRTH");   
        return; // only one baby per round     
      }
    }       
    return; 
  }


}
// The Pred class is almost identical to the Prey class

class Pred {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float sep_=random(0.2,2);
  float ali_=random(0,0.01);
  float coh_=random(0,0.01);
  float att_=random(0.2,2);
  boolean dead = false;
  float recover=500;  // frames between availability to reproduce 
  int wait = 0;       // how long individual has been waiting to reproduce
  int last_ate=0;     // how long since last ate
  int starvation=3000; // number of frames until pred starves to death

  Pred(float x, float y, float z) {
    acceleration = new PVector(0,0,0);
    velocity = new PVector(random(-1,1),random(-1,1),random(-1,1));
    location = new PVector(x,y,z);
    r = 3.0;
    maxspeed = 10+random(-2,2);
    maxforce = 0.1+random(0,.02);
  }

  void run(PApplet app, ArrayList<Pred> preds,ArrayList<Prey> preys) {
    pred(preds,preys);     
    update();
    //borders();
    render(app);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void pred(ArrayList<Pred> preds,ArrayList<Prey> preys) {
    PVector sep = separate(preds);   // Separation
    PVector ali = align(preds);      // Alignment
    PVector coh = cohesion(preds);   // Cohesion
    PVector att = attack(preys);
    // Arbitrarily weight these forces
    sep.mult(sep_);
    ali.mult(ali_);
    coh.mult(coh_);
    att.mult(att_);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(att);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset acceleration to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }
  
  void render(PApplet app) {        
    // Draw a cone rotated in the direction of velocity   
    fill(210, 50, 50);    
    stroke(200, 30, 30);
    pushMatrix();
    translate(location.x,location.y,location.z);
    //drawCylinder(6,8,25,velocity.get());
    sphereDetail(3);
    sphere(9);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.z < -r) location.z = width+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
    if (location.z > width+r) location.z = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Pred> preds) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Pred other : preds) {
      float d = PVector.dist(location,other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location,other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Pred> preds) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    for (Pred other : preds) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0,0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Pred> preds) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Pred other : preds) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(0,0,0);
    }
  }
  
  // Attack!
  // Find nearest prey and eat it
  // Yet to implement field of vision
  PVector attack (ArrayList<Prey> preys) { 
    last_ate++;    
    PVector dinner = new PVector(0,0,0);   // Start with empty vector
    PVector wrap = new PVector(width,height,width);
    wrap.sub(location);    
    float min = sqrt(pow(width,2)+pow(height,2)+pow(width,2));      
    for (Prey p : preys) {
      float d = PVector.dist(location,p.location);      
      if (d < min && !p.dead) {               
        min = d;  
        dinner = p.location; // Set nearest prey       
      }                  
    }       
    dinner = seek(dinner);
    return dinner;  // Steer away from predator  
  }
}
// The Prey class


// when you begin evolving traits maybe
// make it so that they have to slow down
// to reproduce. this way an arms race doesn't
// escalate off to inf

// response: i've made it so they must be within a certain dist to mate 

class Prey {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector filler, stroker;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  boolean dead;
  int max_pop=250;
  
  // traits to be evolved
  float sep_=random(0.2,2);
  float ali_=random(0.2,2);
  float coh_=random(0.2,2);
  float avo_=random(0.2,2);
  float bor_=0;
  float recover=200;  // frames between availability to reproduce
  int wait = 0;       // how long individual has been waiting to reproduce
  

  Prey(float x, float y, float z) {
    dead = false;
    filler = new PVector(200,200,200);
    stroker = new PVector(255,255,255);
    acceleration = new PVector(0,0,0);
    velocity = new PVector(random(-1,1),random(-1,1),random(-1,1));
    location = new PVector(x,y,z);
    r = 2.0;  // r is 
    maxspeed = 7+random(-2,2);
    maxforce = 0.125+random(0,.2);
  }

  void run(ArrayList<Prey> preys,ArrayList<Pred> preds) {
    prey(preys,preds); 
    update();    
    borders();  // wraparound  
    render();
    return;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void prey(ArrayList<Prey> preys,ArrayList<Pred> preds) {
    PVector sep = separate(preys);   // Separation
    PVector ali = align(preys);      // Alignment
    PVector coh = cohesion(preys);   // Cohesion
    PVector avo = avoid(preds);
    PVector bor = walls();
    // weight these forces, some of them by distance
    sep.mult(sep_);
    ali.mult(ali_);
    coh.mult(coh_);
    avo.mult(avo_);
    bor.mult(bor_);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(avo); 
    //applyForce(bor);
  }  

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);    
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target
    
    // Normalize desired and scale to maximum speed    
    desired.normalize();
    desired.mult(maxspeed);
    
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }
  
  void render() {
    // Draw a triangle rotated in the direction of velocity
    
    // project velocity onto 2D subspaces to find angles of rotation
    /* to save time for now
    PVector vx = new PVector(0,velocity.y,velocity.z);
    PVector vy = new PVector(velocity.x,0,velocity.z);
    PVector vz = new PVector(velocity.x,velocity.y,0);    
    float alpha = acos(velocity.y/vx.mag());
    float beta = acos(velocity.x/vy.mag());
    float gamma = acos(velocity.y/vz.mag());
    */    
    fill(filler.x,filler.y,filler.z);        
    stroke(stroker.x,stroker.y,stroker.z);
    pushMatrix();
    translate(location.x,location.y,location.z);  
    
    sphereDetail(3);
    sphere(5);
    //drawCylinder(6,3,15,velocity.get());
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -3*width-r) location.x = 4*width+r;
    if (location.y < -3*width-r) location.y = 4*width+r;
    if (location.z < -3*width-r) location.z = 4*width+r;
    if (location.x > 4*width+r) location.x = -3*width-r;
    if (location.y > 4*width+r) location.y = -3*width-r;
    if (location.z > 4*width+r) location.z = -3*width-r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Prey> preys) {
    float desiredseparation = 100.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Prey other : preys) {
      float d = PVector.dist(location,other.location);
      PVector dummy = PVector.sub(other.location,location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)){ // && (velocity.dot(dummy)>=0) ) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location,other.location); //diff is direction away from neighbor
        diff.normalize();
        diff.div(pow(d,2));        // Weight by distance
        //diff.mult(100000);
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Prey> boids) {    
    PVector sum = new PVector(0,0,0);
    int count = 0;
    for (Prey other : boids) {
      float d = PVector.dist(location,other.location);
      PVector dummy = PVector.sub(other.location,location);
      if (d > 0 && velocity.dot(dummy)>=0) {
        //dummy = other.location.get();
        //dummy.mult(exp(-d));
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0,0,0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  // Try to set field of vision to be the forward hemisphere
  // Also try to set strengths based on distance
  PVector cohesion (ArrayList<Prey> preys) {    
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations    
    int count = 0;
    for (Prey other : preys) {
      float d = PVector.dist(location,other.location);
      PVector dummy = PVector.sub(other.location,location);
      if (d > 0 && velocity.dot(dummy)>=0) {       // velocity.dot(dummy)>0 implies other boid is in front of current boid
        //dummy = other.location.get();
        //dummy.mult(2.71*log(d)-2.71); // makes cohesion grow with distance
        sum.add(other.location); // Add location                
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(0,0,0);
    }
  }
  
  // Avoid
  // As a predator closes in, move in opposite direction
  PVector avoid (ArrayList<Pred> preds) {    
    int j=0; // index of closest predator
    // if no preds then return PVector(0,0,0);
    if(preds.size()==0) return new PVector(0,0,0);
    PVector enemy = new PVector(0,0,0);   // Start with empty vector        
    float min = 5000;        
    for (int i=preds.size()-1; i>=0; i--) {
      Pred p = preds.get(i);
      float d = PVector.dist(location,p.location);            
      if (d < min) {          
       min = d;            // update nearest pred dist
       enemy = p.location; // Set nearest pred 
       j=i;       
      }                
    }   
    PVector away = PVector.sub(location,enemy);    
    away.div(pow(min,2));
    away.mult(500000);    
    if (min < 50){
      Pred p = preds.get(j);
      selection(min,p);     
    }      
    return seek(away);  // Steer away from predator  
  }
  
  // Borders
  // Stay away from the walls!
  PVector walls () {    
    PVector wall = new PVector(width/2,width/2,width/2);    
    if (location.x < 0) wall.x = width-location.x;
    if (location.y < 0) wall.y = height-location.y;
    if (location.z < 0) wall.z = width-location.z;
    if (location.x > width) wall.x = -location.x;
    if (location.y > height) wall.y = -location.y;
    if (location.z > width) wall.z = -location.z;    
    //line(location.x,location.y,location.z,wall.x,wall.y,wall.z);
    wall.mult(10);
    
    return seek(wall);  // Steer away from wall
  }
  
  void selection(float d, Pred p){        
    if( random(1)>d/10 ){
    //if( (int)variate(d)==1 ){
      print("death!\n");
      dead = true;
      p.last_ate=0;  
    }          
    return;
  }
  
}
void drawCylinder( int n, float r, float h, PVector v)
{
    v.normalize();
    PVector xy = new PVector (v.x, v.y);
    PVector xz = new PVector (v.x, v.z);
    PVector yz = new PVector (v.y, v.z);
    float alpha = yz.heading2D() + PI/2;
    float beta = xz.heading2D() + PI/2;
    float gamma = xy.heading2D() + PI/2;  
    
    float phi = 2*PI / n;    
    /*
    // bottom
    beginShape();
    for (int i = 0; i < n; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x*acos(v.x), y*acos(v.y), halfHeight*acos(v.z));
    }
    endShape(CLOSE);
    */
    // draw body
    v.mult(h);
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < n + 1; i++) {
        float x = cos( i * phi ) * r;
        float y = sin( i * phi ) * r;
        vertex( 0,0,0 );
        vertex( x-v.x, y-v.y, r*cos(i*phi)*sin(beta)-v.z);
    }
    endShape(CLOSE);
}


