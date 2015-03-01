
Mover[] mover = new Mover[10];
float topspeed = 9;
int atomSize = 60;

void setup() {
  size(640,360);
  for(int cnt; cnt < mover.length; cnt++){
      mover[cnt] = new Mover();
  }
  smooth();
}

void draw() {
  background(255);
  for(int cnt; cnt < mover.length; cnt++){
   mover[cnt].update();
   mover[cnt].checkEdges();
   mover[cnt].display();
  }
}

void mouseReleased(){
  for(int cnt; cnt < mover.length; cnt++){
      mover[cnt] = new Mover();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration= new PVector(0,0);
  }

   void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    // Step 1: Compute direction
    PVector dir = PVector.sub(mouse,location);

    // Step 2: Normalize
    dir.normalize();

    // Step 3: Scale
    dir.mult(0.5);

    // Step 4: Accelerate
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }

  void display() {
    stroke(0);
    fill(175,80);
    ellipse(location.x,location.y,atomSize ,atomSize );
  }
  
  void checkEdges() {
 
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }

}
