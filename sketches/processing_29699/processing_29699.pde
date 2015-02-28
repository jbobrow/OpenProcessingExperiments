
Gira gira;

void setup() {
  size(800,350);
  gira = new Gira();
   for (int i = 0; i < 200; i=i+1) {
    gira.addTac(new Tac(new PVector(width/2,height/2), 3.0, 0.05));
  }
  smooth();
}

void draw() {
  background(5);
  gira.run();
}
class Gira {
  ArrayList boids; 

  Gira() {
    boids = new ArrayList(); 
  }

  void run() {
    for (int i = 0; i < boids.size(); i++) {
      Tac b = (Tac) boids.get(i);  
      b.run(boids);  
    }
  }

  void addTac(Tac b) {
    boids.add(b);
  }

}




class Tac {

  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    
    

    Tac(PVector l, float ms, float mf) {
    acc = new PVector(0,0);
    vel = new PVector(random(0,256),random(-256,0));
    loc = l.get();
    r = 9.0;
    
    maxforce = mf;
  }

  void run(ArrayList boids) {
    gira(boids);
    update();
    borders();
    render();
  }

  
  void gira(ArrayList Tac) {
    PVector sep = separate(Tac);     
    sep.mult(2);
    acc.add(sep);
  }

  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }

  
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  
    PVector desired = target.sub(target,loc);  
    float d = desired.mag(); 
    if (d > 10) {
      desired.normalize();
      steer = target.sub(desired,vel);  
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }
  
  

  void render() {
    
    strokeWeight(random(2)); 
    float theta = vel.heading2D() + PI/2;
  
    if(theta < 6) { 
    stroke(#9F1B8B); 
  }
   
   if(theta > 2) {   
    stroke(#B9B8B9); 
  } 
  
 
    
  float x1 = random(width); 
  float x2 = random(height);
    
    
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(theta);
    line(mouseX,x2,second()/100,millis()/100);
    line(mouseX,x2,second()/60,millis()/70);
    line(mouseX,x2,second()/40,millis()/10);
    popMatrix();
    
  }

 
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }

  
  PVector separate (ArrayList boids) {
    float desiredseparation = 1.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
      for (int i = 0 ; i < boids.size(); i++) {
      Tac other = (Tac) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(loc,other.loc);             
        steer.add(diff);
                    
      }
    }
     
    if (steer.mag() > 0) {
      steer.normalize();
      steer.sub(vel);

    }
    return steer;
  }

  

  
}
                
