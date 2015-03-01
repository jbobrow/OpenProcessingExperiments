
Mover[] movers = new Mover[10];

void setup(){
  size(800, 600);
  background(255);
   stroke(0);
    fill(175);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);
  
  for(int i = 0;  i < movers.length; i++){
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 10;
  }
  
  void update(){
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display(){
    line(mouseX, mouseY, location.x, location.y);
    ellipse(location.x, location.y, acceleration.x*100, acceleration.x*100);
  }
 
 void checkEdges(){
  if(location.x > width){
   location.y = 0;
   fill(0, 255, 0);
  } else if(location.x < 0){
   location.x =width;
   fill(255, 0, 0);
  }
 
 if(location.y > height){
   location.y = 0;
   fill(255, 255, 0);
 }else if(location.y < 0){
   location.y = height;
   fill(0, 0, 255);
 }
 }
}

 void mousePressed(){
   setup();
 }


