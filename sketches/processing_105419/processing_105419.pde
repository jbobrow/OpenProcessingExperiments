
Mover[] m = new Mover[3000];
void setup(){
  size(800,800,P2D);
  background(255);
  for(int i=0;i<m.length;i++){
    m[i] = new Mover();
  }  
}
void draw(){
  noStroke();fill(255,10); rect(0,0,width,height);
//  background(255);
  for(int i=0;i<m.length;i++){
    if(mousePressed){m[i].update();}
    m[i].checkEdges();
    m[i].display();
  }
}
class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  Mover(){
   location = new PVector(random(width),random(height));
   velocity = new PVector(0,0);
   topspeed = 10;
  }
  void update(){
    PVector mouse = new PVector(random(width/2-600,width/2+600),random(height/2-600,height/2+600));
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void checkEdges(){
    if(location.x>width){location.x=0;}else if(location.x<0){location.x=width;}
    if(location.y>height){location.y=0;}else if(location.y<0){location.y=height;}
  }
  void display(){
    strokeWeight(topspeed);stroke(10);
    point(location.x,location.y);
  }
}
void keyPressed(){
  saveFrame("1.png");
}


