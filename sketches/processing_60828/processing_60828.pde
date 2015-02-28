
Ball b[];
final float LOSS = 0.75;

//================================================================

void setup() {
  size(600,400);
  smooth();
  reset();
}

//================================================================

void draw() {
  background(100);
  
  for (int i=0; i < b.length; i++)
    b[i].show(i);
}

//================================================================

void mousePressed() {
  reset();
}

//================================================================

void reset() {
  b = new Ball[15];
  
  for (int i=0; i<b.length; i++) {
    b[i] = new Ball(random(width), random(height), random(-2, 2), random(-2, 2), random(20)+5);
  }
}

//================================================================

class Ball {
  PVector pos, spd;
  float rad, mass;
  //-----------------------------
  Ball(float posX, float posY, float spdX, float spdY, float r) {
    pos = new PVector(posX, posY);
    spd = new PVector(spdX, spdY);
    rad = r;
    mass = r*.01;
  }
  //------------------------------
  void gravitate() {
    
    //get the distance to the floor
    PVector floor = new PVector(pos.x, height - rad);
    
    //get a vector for gravity
    PVector gravity = PVector.sub(floor, pos);
    if (gravity.mag() > 1) 
      gravity.normalize();
    
    gravity.mult(mass); //the mass is based on the ball's radius
    spd.add(gravity); //apply to speed
    
  }
  //-----------------------------  
  void collide(int idx) {
    for (int i = 0; i < idx; i++) { //only compare against balls with a lower array index (we don't need to check 'em twice)

      //get a vector between the two balls' relative positions
      PVector relPos = PVector.sub(pos, b[i].pos);
      if(relPos.mag() < rad + b[i].rad) { //check to see if they're close enough for contact
        
        //start building the impulses (just use #1 for now)
        PVector impulse_1 = new PVector(relPos.x, relPos.y); //we'll use the relPos vector since the impulse falls on that line
        impulse_1.normalize(); //don't care about the current length, just the direction
        
        //get the impact speed
        PVector impact = PVector.sub(spd, b[i].spd); //the impact is the difference between the balls' speeds
        float impactSpd = abs(impact.dot(impulse_1)); //use the magical dot product to get us the impact speed
        
        //adjust the impulse by the impact speed and the balls' masses
        float coefficient = sqrt(impactSpd * mass * b[i].mass); //get the balls' masses in the equations
        impulse_1.mult(coefficient); //multiply for the base impulse
        impulse_1.mult(LOSS); //loose some steam from the bump
        
        //split the impulse between the two balls - weighted by mass (hey - was that a pun)
        PVector impulse_2 = new PVector(impulse_1.x, impulse_1.y); //get a copy of the impulse base
        impulse_1.div(mass); //get the impulse for this ball
        impulse_2.div(b[i].mass); //get the impulse for the other ball
        
        //set the new speeds
        spd.add(impulse_1);
        b[i].spd.sub(impulse_2);
      }
    }
  }
  //-----------------------------
  void boundryCheck() {
        
    if (pos.x < rad) { 
      pos.x = rad + 1;
      spd.x *= -LOSS;
    }
    if (pos.y < rad) { 
      pos.y = rad + 1;
      spd.y *= -LOSS;
    }
    if (pos.x + rad >= width) { 
      pos.x = width - rad - 1;
      spd.x *= -LOSS;
    }
    if (int(pos.y + rad) >= height) { //note that int() when checking the bottom boundry
      pos.y -= pos.y - height + rad;
      spd.y *= -LOSS;
    }
  }
  //-----------------------------
  void checkSpeed() {
    
    //slow 'em down just a wee bit - call it friction if you like
    spd.mult(.998); 
    
    //extra slowing if "rolling on floor"
    if(int(spd.y) == 0 && int(pos.y) == int(height - rad)) {
      spd.mult(.97);
    }
    
    pos.add(spd);
  }
  //-----------------------------
  void show(int idx) {
    gravitate();
    collide(idx);
    boundryCheck();
    checkSpeed();
    
    fill(255);
    ellipse(pos.x, pos.y, rad*2, rad*2);
  }
}

