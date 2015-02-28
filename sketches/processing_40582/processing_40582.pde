
class particle{

 Vec3D loc = new Vec3D (0,0,0);
 Vec3D speed = new Vec3D (0,0,0);
 int r = 5;
 
  particle (Vec3D _loc){
     
    loc = _loc ;
  }
  
  void run(){
    display();
    relocate();
    move();
    //connect();
    grow();
    
  }
  
  
  void grow(){
    
    int count = 1;
    
    for (int i=0 ; i<ParticleCollection.size(); i++){
        particle other = (particle) ParticleCollection.get(i);
        
        float distance = loc.distanceTo(other.loc);
        
          if (distance > 0 && distance < 50){
            count++;
            r = count;
      
        }
      }  
  }
  
  
  
  void connect(){
    
     for (int i=0 ; i<ParticleCollection.size(); i++){
        particle other = (particle) ParticleCollection.get(i);
        
        float distance = loc.distanceTo(other.loc);
        
        if (distance > 0 && distance < 100){
          
          stroke(255-distance*2,distance,distance*3,100);
          strokeWeight(0.5);
          line (loc.x,loc.y,other.loc.x,other.loc.y);
          
          } 
      }
  }
  
  
  
  void move(){
    
    float angle = noise(loc.x*0.005,loc.y*0.005,frameCount*0.005)*PI*2;
    
    speed.x = cos(angle);
    speed.y = -sin(angle);
    
    loc.addSelf(speed);
    }
    
  void relocate(){
      if ( loc.x<0 || loc.x>width || loc.y<0 ||loc.y>height) {
        loc.x = random (width);
        loc.y = random (height);
        r=5;
        }
    }
    
  void display(){
    
     
     //fill(255-r*5,220,r*10,150);
     fill(0,250,220);
     ellipse(loc.x,loc.y,r,r);
 
     
  }
    
    
}

