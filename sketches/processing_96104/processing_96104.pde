
PlayerShip p1;
Attractor a;

float G = 9.0;  //univeral gravitational constant

int[][] starArray;
float starDensity;
int numberOfStars;

void setup() {
  size(900,600);
  p1 = new PlayerShip(width/8,height/6,0);
  a = new Attractor(width/2,height/2);
  
  starDensity = .00005  ;
  numberOfStars = int(starDensity * width * height);
  starArray = new int[numberOfStars][2];
  for( int i = 0; i < numberOfStars; i++ ){
    starArray[i][0] = int(random(width));
    starArray[i][1] = int(random(height));
  }
}


void draw() {
  background(45);
  background(30);
  PVector attract = a.attract(p1);
  p1.applyForce(attract);
  p1.update();
  
  stars();
  a.display();
  p1.display();
}


void keyPressed()
{
  switch(key)
  {
    case 'z':
    case 'Z':
    case ' ': 
      p1.pressingThrust = true; 
      break;
  }
  switch(keyCode)
  {
    case LEFT: 
      p1.pressingLeft = true;
      break;
    case RIGHT: 
      p1.pressingRight = true;
      break;
    case ENTER:
    case RETURN:
      p1.reset();
      break;
  }
}


void keyReleased()
{
  switch(key)
  {
    case 'z':
    case 'Z':
    case ' ': 
      p1.pressingThrust = false; 
      break;
  }
  switch(keyCode)
  {
    case LEFT: 
      p1.pressingLeft = false;
      break;
    case RIGHT: 
      p1.pressingRight = false;
      break;
  }
}
class Attractor {
  
  PVector loc;
  float mass;
  float diameter, radius;
  
  Attractor(float startingX, float startingY) {
    loc = new PVector(startingX,startingY);
    mass = 40;
    diameter = 60;
    radius = diameter/2;
  }


  PVector attract(PlayerShip target) {  //this function returns a PVector after feeding it a Mover object
    PVector force = PVector.sub(loc,target.loc);  //subtract loc from m.loc to determine direction;
    float distance = force.mag();  //save this value as the distance before normalizing
    if(distance < radius){ distance = radius; }
    
    force.normalize();  //normalize to get the unit vector
    float strength = (G*mass*target.mass) / (distance*distance);
    force.mult(strength);  //scale the unit vector in accordance with computed gravitational magnitude
    return force;
  }

  
  void display() {
    noStroke();
    fill(80,100);
    fill(60);
    ellipse(loc.x,loc.y,diameter,diameter);
  }

}

class PlayerShip {
  float startingX,startingY;
  PVector loc, vel, accel;
  float thrustPotential;
  float angle, rotateAmount;
  float r; //ship's "radius"
  float mass; //feeds into applyForce equation
  float thrustAlpha;
  
  boolean pressingLeft, pressingRight, pressingThrust;
  
  
  PlayerShip(float startingX_, float startingY_, float startingAngle) {
    startingX = startingX_;
    startingY = startingY_;
    loc = new PVector(startingX,startingY);
    vel = new PVector(0,0);
    accel = new PVector(0,0);
    thrustPotential = 0.1;
    
    angle = radians(startingAngle);
    rotateAmount = 0.1;
    r = 14;
    mass = 1;
    thrustAlpha = 0;
  }
  
  
  void update() {
    rotateControl();
    
    applyForce( thrustForce() );
    
    vel.add(accel);
    loc.add(vel);
    accel.mult(0);  //reset accel to prepare for next frame
    
    checkEdges();
  }
  
  
  PVector thrustForce() {
    float usableThrust;
    if(pressingThrust){
      usableThrust = thrustPotential;
    } else {
      usableThrust = 0;
    }
    float x = usableThrust * cos(angle);
    float y = usableThrust * sin(angle);
    return new PVector(x,y);
  }
  
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    accel.add(f);
  }
  
  
  void rotateControl() {
    if(pressingLeft) {
      angle -= rotateAmount;
    } else if(pressingRight) {
      angle += rotateAmount;
    }
  }
  
  
  void reset() {
    loc.x = startingX;
    loc.y = startingY;
    vel.x = 0;
    vel.y = 0;
  }
  
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    
    if(pressingThrust){
      thrustAlpha += 2;
      if(thrustAlpha > 30){ thrustAlpha = 30; }
      noStroke();
      fill(100,100,255,thrustAlpha);
      triangle(0,-r, 0,r, -r*4,0);
      fill(100,100,255,100);
      triangle(0,-r, 0,r, -r*2,0);
    }
    if(thrustAlpha > 0){ thrustAlpha -= 1.5; }
    fill(240);
    noStroke();
    arc(0,0, r*2, r*2, -PI/2, PI/2, OPEN);
    fill(40,40,180);
    arc(r/3,0, r/1.5, r/1.5, -PI/2, PI/2, OPEN);
    stroke(100);
    line(0,-r, 0,r);
    
    stroke(0,0,255);
    strokeWeight(2);
      
    popMatrix();
  }
  
  
  void checkEdges() {
    // check X
    if( loc.x < 0 - r - 1 ) {
      loc.x = width - r;
    } else if ( loc.x > width + r + 1 ){
      loc.x = 0 - r;
    }
    
    //check Y
    if( loc.y < 0 - r - 1 ) {
      loc.y = height + r;
    } else if( loc.y > height + r + 1 ){
      loc.y = 0 - r;
    }
  }
}


void stars() {
  for( int i = 0; i < numberOfStars; i++){
    int x_ = starArray[i][0];
    int y_ = starArray[i][1];
    stroke(100);
    point(x_,y_);
    /*stroke(255,100);
    point(x_-1,y_);
    point(x_,y_-1);
    point(x_+1,y_);
    point(x_,y_+1);*/
  }
}


