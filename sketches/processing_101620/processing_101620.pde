
// based on Chapter 1 of Shiffman's excellent "Nature of Code" 
// http://natureofcode.com/book/chapter-1-vectors/
// so, nothing really original here, but it's fun and wanted to play with it.

Mover[] movers = new Mover[20];

void setup(){
  size(800,600);
  background(255);
  for(int i = 0;i<movers.length;i++){
    movers[i] = new Mover();
  }
}

void draw(){
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  for(int i = 0;i<movers.length;i++){
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
  PVector mouse;
  PVector dir;
  float m;
  color c;
 
  Mover(){
    location = new PVector (random(width),random(height));
    velocity = new PVector (0,0);
    topspeed = 10;
    m = random(0.2,0.8);
    c = color(random(255),random(255),random(255));
  }
  
  void update(){
    mouse = new PVector(mouseX,mouseY);
    dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(m);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display(){
    fill(c);
    ellipse(location.x,location.y,16,16);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    } else if (location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    }else if (location.y < 0){
      location.y = height;
    }
  }
}
