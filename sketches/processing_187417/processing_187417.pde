
Mover[] movers = new Mover[10];

void setup() {
  size(550, 550);
  randomSeed(10);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }

}

void draw() {
  background(255);

    PVector elastic = new PVector(0, 0);
    PVector elastic2 = new PVector(0, 0);

    for (int i = 0; i < movers.length; i++) {

      


    // When mouse is on the right side of the object, force object to the right direction.
    if (mouseX > movers[i].location.x){ 
    elastic = new PVector(0.2, 0); 
    
    // When mouse is on the left side of the object, force object to the left direction.
    }else if(mouseX < movers[i].location.x){
    elastic = new PVector(-0.2, 0);
    }
    
    // When mouse is under the object, force object to the downward direction.
    if (mouseY > movers[i].location.y){ 
    elastic2 = new PVector(0, 0.2); 
    
    // When mouse is above the object, force object to the upward direction.
    }else if(mouseY < movers[i].location.y){
    elastic2 = new PVector(0, -0.2);
    }
    
    
   
    PVector gravity = new PVector(0, 0.1*movers[i].mass);

    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    movers[i].applyForce(elastic);
    movers[i].applyForce(elastic2);

    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
    
 

  }

  
}







class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  Mover(float m, float x , float y ) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {

    noStroke();
    fill(255,0,0,127);
    
    ellipse(location.x,location.y,mass*16,mass*16);
    
    strokeWeight(1);
    stroke(255,0,0,40);
    
    // Draw line from mouse's position to ellipse's position
    line(location.x,location.y,mouseX,mouseY);  

    stroke(100,100,100,20);
    
    // Draw line from the corners to ellipse's position    
    line(location.x,location.y,0,0);
    line(location.x,location.y,width,0);
    line(location.x,location.y,width,height);
    line(location.x,location.y,0,height);

  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
        if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }


  }

}





