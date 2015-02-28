
mover Ball_a;
mover Ball_b;
mover Ball_c;
mover Ball_d;

void setup() {
  size(400,400);
  smooth();
  background(0);
  Ball_a = new mover(width/3,height/3);
  Ball_b = new mover(width*2/3,height/3);
  Ball_c = new mover(width/3,height*2/3);
  Ball_d = new mover(width*2/3,height*2/3);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  Ball_a.update();
  Ball_a.display();
  Ball_b.update();
  Ball_b.display();
  Ball_c.update();
  Ball_c.display();
  Ball_d.update();
  Ball_d.display();
}
class mover {
  PVector location;
  PVector velocity;
  // constructor
  mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2)); 
  }
  // constructor
  mover(float x,float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(-2,2),random(-2,2)); 
  }

  void update() {
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255,0,0);
    ellipse(location.x,location.y,16,16); 
  }

}









