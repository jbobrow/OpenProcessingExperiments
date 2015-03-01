
ArrayList<ParticleSystem> ps;
void setup(){
  size(640,480);
  ps =new ArrayList<ParticleSystem>();
  background(0);
}

void draw(){
  //background(0); 
  color c=color(random(255),random(255),random(255));
  float size=random(10);
  if(mousePressed){
    PVector ran =new PVector(mouseX,mouseY);
    ps.add(new ParticleSystem(ran,c,size));
  }
  for(int i=0; i<ps.size(); i++){
    ParticleSystem p=ps.get(i);
    p.run();
    if (p.isDead()){
      ps.remove(i);
    }  
  }  
}


class ParticleSystem{
  PVector location;
  PVector velocity;
  PVector turn;
  float ran;
  float lifespan;
  color c;
  float size;
  ParticleSystem(PVector l,color c,float size){
    location =l.get();
    velocity=new PVector(random(-0.1,0.1),random(-0.1,0.1));
    lifespan=255;
    this.c=c;
    this.size=size;
  }
  
  void update(){
    ran=random(360);
    turn=new PVector(2*cos(radians(ran))/10,2*sin(radians(ran))/10);
    velocity.add(turn);
    location.add(velocity);
    PVector l=location.get();
    lifespan-=3;
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


