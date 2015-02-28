



Mover[] movers = new Mover[20];

void setup() {
  size(600,600);

  smooth();


  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {

  noStroke();
  fill(255,10);  


  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {


    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();     
    dir.mult(0.5);      
    acceleration = dir;  

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(91,5,98);
    ellipse(location.x,location.y,10,10);
    if (mousePressed) {
      ellipse(location.x,location.y,36,36);

      if (keyPressed) {
        fill(8,0);
        rect(location.x,location.y,36,36);
      }
    }
  }

  void mousePressed() {
    saveFrame();
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


