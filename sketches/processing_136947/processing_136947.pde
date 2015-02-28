
particula tomas;

void setup(){
  size(300,300);
  PVector ini = new PVector(width/2,height/2);
  tomas = new particula(ini);
  
}

void draw(){
  tomas.display();
  tomas.update();
  
}

//objeto

class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;

  particula(PVector initial) {
    position = initial.get();
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.005);
  }
  
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
  }
  
  
  void display(){
    fill(0);
    ellipse(position.x, position.y,10,10);
  
  }
}

