
class Bird {
  
  PVector location;
  PVector velocity;
  PVector dir=new PVector(0,0);
  PVector acceleration=new PVector(0,0);
  int siz;
  ArrayList others;
  int id;
  float noiseseed;
  PVector locdif;
  float fc;

  
  Bird(float startx,float starty, float startxvel,float startyvel,int siz_,ArrayList others_,int id_) {
    location = new PVector(startx,starty);
    velocity = new PVector(startxvel,startyvel);
    siz=siz_;
    others = others_;
    id=id_;
    noiseseed=random(10000);
  }
  void flock() {
    for(int i=0;i<others.size();i++) {
      if(i!=id){
        Bird other = (Bird) others.get(i);
        locdif = PVector.sub(other.location,location);
        dir.add(locdif);
        dir.normalize();
        dir.mult(flockStrength);
        acceleration=dir;
      }
      
      
    }
  }
  void move() {
    strokeWeight(noise(fc*0.01)*noiseScale);
    stroke(255,100);
    //point(location.x,location.y);
    velocity.add(acceleration);
    velocity.limit(maxvel);
    if(location.x>width&&velocity.x>0||location.x<0&&velocity.x<0) {
      if(abs(velocity.mag())<0){velocity.x=0;velocity.y=0;}
      velocity.x = -velocity.x;
    }
    if(location.y>height&&velocity.y>0||location.y<0&&velocity.y<0) {
      if(abs(velocity.mag())<0){velocity.x=0;velocity.y=0;}
      velocity.y = -velocity.y;
    }
    if(abs(velocity.mag())<0){velocity.x=0;velocity.y=0;}
    
    location.add(velocity);
    

  }
  
  void display() {
    Bird buddy = (Bird) others.get(max(0,id-1));
    stroke(0,100);
    fc=frameCount+noiseseed;
    strokeWeight(noise(fc*0.01)*noiseScale);
    //fill(128,0,255);
    point(location.x,location.y);
    if(otherlines) {     
      strokeWeight(0.5);
      stroke(255,0,0,100);
      line(location.x,location.y,buddy.location.x,buddy.location.y);
    }
    if(vellines) {
      strokeWeight(1);
      stroke(0,100);
      line(location.x,location.y,location.x+velocity.x*5,location.y+velocity.y*5);   
      strokeWeight(1);
      stroke(0,0,255,100);
      line(location.x,location.y,location.x+acceleration.x*50,location.y+acceleration.y*50);
    }
  }
  

}

