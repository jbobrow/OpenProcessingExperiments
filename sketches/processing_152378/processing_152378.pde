
color[] palette = {#0099CD, #0054CD, #2300CD, #8A00CD, #DA007E, #FF0100, #FF6600, #FF9900, #FFCC00, #FFFF00, #ACE600, #00CD01};

Mover[] movers = new Mover[20];
float change_angle = noise(-4,4);

void setup() {
  size(700,700);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);


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
  int c;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
    c = (int) random(palette.length);
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
    noStroke();
    fill(palette[c]);
    rotate(random(cos(change_angle)));
    triangle(location.x,location.y,location.x+22,location.y+45,location.x+45,location.y);
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


