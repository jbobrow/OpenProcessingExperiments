
ArrayList<ParticleSystem> ps;
void setup(){
  size(640,360);
  ps =new ArrayList<ParticleSystem>();
}

void draw(){
  background(0);
  color c=color(random(255),random(255),random(255));
  float size=3;
  float length=20;
  if(mousePressed){
    ps.add(new ParticleSystem(new PVector(mouseX,mouseY),c,size));
  }
  for(int j=0; j<length; j++){
    for(int i=0; i<ps.size(); i++){
      ParticleSystem p=ps.get(i);
      p.run();
      if (p.isDead()){
        ps.remove(i);
      }  
    }  
  }
}

class ParticleSystem{
  PVector location;
  PVector velocity;
  float lifespan;
  color c;
  float size;
  ParticleSystem(PVector l,color c,float size){
    location =l.get();
    velocity=new PVector(random(-3,3),random(-3,3));
    lifespan=255;
    this.c=c;
    this.size=size;
  }
  void update(){
    location.add(velocity);
    PVector l=location.get();
    if(l.y<size/2 || l.y>height-size/2) {
      velocity.y=-velocity.y;
    }else if (l.x<size/2 || l.x>width-size/2 ){
      velocity.x=-velocity.x;
    }
    lifespan-=0.05;
  }
  void display(){
    noStroke();
    fill(c,lifespan);
    ellipse(location.x,location.y,size,size);
  }
  void run(){
    update();
    display();
  }
  boolean isDead(){
    if(lifespan<0){
      return true;
    }
  return false;
  }
}


