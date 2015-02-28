
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 6;
  }

  void update() {

    PVector mouse = new PVector(random (500), random (500));
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(6);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
       if(mousePressed){
    PVector mous = new PVector(mouseX,mouseY);
    PVector diri = PVector.sub(mous,location);
    diri.normalize();
    diri.mult(6);
    acceleration = diri;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
   }
  }

  void display() {
    noStroke();
    fill(random(10),random(10),random(10));
    ellipse(location.x,location.y,40,40);
    
   if(mousePressed){
    fill(random(255),random(255),random(255));
    ellipse(location.x,location.y,40,40);
   }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }

  }

}




