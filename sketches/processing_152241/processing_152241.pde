
Mover[] movers =new Mover[10];
PVector gravity,wind,friction;
float c,m;
color col; 
void setup(){
  size(100,500);
  gravity=new PVector(0,0.1);
  friction=new PVector(0,0.01);
  for(int i=0; i<movers.length;i++){
    col=color(random(255),random(255),random(255));
    movers[i]=new Mover(width/2,0,random(1,3),col);
  }
}
void draw(){
  background(0);
  for(int i=0; i<movers.length;i++){
    
    c=0.2;
    friction=movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    movers[i].applyForce(friction);
    m=movers[i].mass;
    gravity =new PVector(0,0.5*m);
    if(mousePressed){
      wind=new PVector(0,-3);
    movers[i].applyForce(wind);
    }
    
    movers[i].applyForce(gravity);
    movers[i].run();
  }
}
class Mover{
  PVector location,velocity,acceleration,friction;
  float mass;
  float objSize;
  color c;
  Mover(float x,float y,float mass,color c){
    location=new PVector(x,y);
    velocity=new PVector(0,0);
    acceleration=new PVector(0,0);
    this.mass=mass;
    this.objSize=mass*10;
    this.c=c;
  }
  void applyForce(PVector force){
    PVector f=PVector.div(force,mass);
    acceleration.add(f);
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void display(){
    noStroke();
    fill(c);
    ellipse(location.x,location.y,objSize,objSize);
  }
  void checkEdges(){
    if(location.x>width-objSize/2){
      location.x=width-objSize/2;
      velocity.x*=-1;
    }else if(location.x<objSize/2){
      location.x=objSize/2;
      velocity.x*=-1;
    }
    if(location.y>height-objSize/2){
      location.y=height-objSize/2;
      velocity.y*=-1;
    }
  }
  void run(){
    this.checkEdges();
    this.update();
    this.display();
  }
}


