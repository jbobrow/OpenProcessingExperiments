
my_mover Ball_a;
my_mover Ball_b;
my_mover Ball_c;
my_mover Ball_d;

void setup() {
  size(400,400);
  smooth();
  background(255);
  Ball_a = new my_mover(width / 3, height / 3, random(9,25), random(9,25));
  Ball_b = new my_mover(width * 2 / 3, height / 3, random(9,25), random(9,25));
  Ball_c = new my_mover(width / 3, height * 2 / 3, random(9,25), random(9,25));
  Ball_d = new my_mover(width * 2 / 3, height * 2 / 3, random(9,25), random(9,25));
  frameRate(30);
}

void draw() {
  noStroke();

  Ball_a.update();
  Ball_a.display();
  Ball_b.update();
  Ball_b.display();
  Ball_c.update();
  Ball_c.display();
  Ball_d.update();
  Ball_d.display();

}

class my_mover {
  PVector location;
  PVector velocity;
  // constructor
  my_mover(float x, float y, float xsp, float ysp) {
    location = new PVector(x, y);
    velocity = new PVector(xsp, ysp); 
  }
  
  float xlocation() {
    return location.x;
  }
  
  float ylocation() {
    return location.y; 
  }

  void update() {
    if(xlocation() < 8 || xlocation() > width - 8){
      changeSpeed(new PVector(-1, 1));   
    }
    if(ylocation() < 8 || ylocation() > height - 8){
      changeSpeed(new PVector(1, -1));   
    }
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(location.x,location.y, 16, 16);
    fill(255,10);
    rect(0,0,width,height); 
  }
  
  PVector changeSpeed(PVector a) {
    velocity.mult(a);
    return velocity; 
  }

}









