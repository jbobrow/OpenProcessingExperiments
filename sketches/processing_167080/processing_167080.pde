
Spot[] spots;
int count;


void setup(){
  size(640,480);
  frameRate(30);
  smooth();
  count = 50;
  spots = new Spot[count];
  for (int j=0;j<count;j++){
    spots[j] = new Spot();
  }
}

void draw(){
  background(0);

  for (int k = 0; k<spots.length;k++){
    spots[k].update();
    spots[k].display();
  }
}


class Spot {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float osc = 1;
  float topspeed;
  float path = 35;
  
  Spot() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
    void update() {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector dir = PVector.sub(mouse,location);
      dir.normalize();
      dir.mult(0.25);
      acceleration = dir;
      
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
    }
      
    void display() {
      for (int i = 1; i<=path; i++) {
        noStroke();
        fill(255, 15);
        ellipse(location.x, location.y,10,10);
        location.x = location.x + osc*random(10);
        location.y = location.y + osc*random(5);
        osc = -osc;
        
      }
    }
  }


