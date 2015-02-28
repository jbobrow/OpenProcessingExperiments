
class Ball {
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  color c;
  int radio;
  float bounce = 0.8;
  
  boolean colliding = false;
  
  PFont f = createFont("Arial",10,true);
  
  Ball(float setX, float setY, color setColor, int setRadio ){
    
    loc = new PVector(setX,setY);
    vel = new PVector(random(-2,2),random(-2,0));
    acc = new PVector(1,2);
    
    radio = setRadio;
    
    c = setColor;
  }
  
  void applyForce(PVector force){
    force.div(radio/2);
    acc.add(force);
  }
  
  void go(){
    update();
    bordes();
    render();
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void bordes(){
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

  PVector calcGravForce(Ball b){
    PVector dir = PVector.sub(loc,b.loc);
    float d = dir.mag();
    //d = constrain(d,5.0,25.0);
    dir.normalize();
    float force = (9.8 * radio * b.radio) / (d * d);
    dir.mult(force);
    return dir;
  }
  
  void collideEqualMass(Ball b) {
    float d = PVector.dist(loc,b.loc);
    float sumR = radio + b.radio;
    // Are they colliding?
    if (!colliding && d < sumR) {
      // Yes, make new velocities!
      colliding = true;
      // Direction of one object to another
      PVector n = PVector.sub(b.loc,loc);
      n.normalize();
      
      // Difference of velocities so that we think of one object as stationary
      PVector u = PVector.sub(vel,b.vel);
      
      // Separate out components -- one in direction of normal
      PVector un = componentVector(u,n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      vel = PVector.add(u,b.vel);
      b.vel = PVector.add(un,b.vel);
    } else if (d > sumR) {
      colliding = false;
    }
  }
 
  void render(){
    fill(c);
    noStroke();
    ellipse(loc.x,loc.y,radio*2,radio*2);
    
    if (showVectors) {
      drawVector(vel,loc,10);
      drawVector(G,loc,100);
    }
    
    if (showPosition) {
      textFont(f,8);
      fill(255,0,0,127);
      text("("+ int(loc.x) + "," + int(loc.y) + ")",loc.x + radio, loc.y + radio);
    }
  }
  
}



