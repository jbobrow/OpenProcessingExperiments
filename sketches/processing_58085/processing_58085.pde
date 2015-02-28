
class Mover {
  PVector target;                                                        // target location
  PVector location;                                                      // mover location
  PVector velocity;                                                      // mover velocity
  PVector acceleration;                                                  // mover acceleration
  float topspeed;                                                        // mover topspeed
  float tolerance = 30;                                                  // tolerance ( >= 1  < 100 ) when target position is reached
  float rad = 20.0;                                                      // mover radius
  float direction = 0;                                                   // direction angle

  Mover() {
    location = new PVector(random(width), random(height));               // set random initial location
    velocity = new PVector(0, 0);                                        // velocity initially set to zero
    target = new PVector(width/2, height/2);                             // set target to centre of sketch
    topspeed = 3;                                                        // set top speed
  }

  void update() {
    // calculating acceleration and topspeed
    PVector dir = PVector.sub(target, location);                        // Find vector pointing towards target
    float distance = dist(location.x, location.y, target.x, target.y);  // find distance to target
    if(topspeed > tolerance){                                           // accelerate or decelerate
      topspeed *= 0.9;
    }else{
      topspeed = distance*0.05;
    }
    dir.normalize();                                                    // Normalize
    direction = dir.heading2D()+HALF_PI;                                // get heading angle (not documented in reference)
    dir.mult(0.5);                                                      // scale direction vector
    acceleration = dir;                                                 // set acceleration to direction vector
    velocity.add(acceleration);                                         // add acceleration to velocity
    velocity.limit(topspeed);                                           // limit velocity to topspeed
    if (distance<tolerance) {                                           // check distance to target
      target.x = random(width);
      target.y = random(height);                                        // set new target
    }
    else {
      location.add(velocity);                                           // move object
    }
  }

  void display() {
    noStroke();
    fill(51, 153, 255, 100);
    ellipse(location.x, location.y, 2*rad, 2*rad);                      // draw mover circle
    noFill();
    if (dist(target.x, target.y,location.x, location.y) > rad) {
      stroke(255, 200, 0, 255);
      strokeWeight(rad/4);
      strokeCap(ROUND);
      line(location.x, location.y, location.x + sin(direction)*rad, location.y - cos(direction) * rad); // draw direction
      stroke(255, 0, 0, 255);
      line(target.x-rad/2, target.y, target.x+rad/2, target.y);             // draw target cross
      line(target.x, target.y-rad/2, target.x, target.y+rad/2);
      strokeWeight(1);
      stroke(0, 255, 0, 100);
      ellipse(target.x,target.y,tolerance*2,tolerance*2);
    }
  }

  void checkEdges() {
    if (location.x > width) {                                           // check left and right borders
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }
                                                                        // check top and bottom borders
    if (location.y > height) {
      location.y = 0;
    }  
    else if (location.y < 0) {
      location.y = height;
    }
  }
}


