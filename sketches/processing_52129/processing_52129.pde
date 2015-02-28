


class Ball {
  
  int speed = 3;
  
  // ball with random location x, y, z
  Ball(float x, float y, float z) {  
    
    v = new PVector(x, y, z);
    vel = new PVector(speed, speed, speed);
  }
    
  // box size = widht/2, height/2, depth/2
  void update(boolean pause) {
   if(!pause){
     if(v.x  >= width/2 || v.x  <= -width/2 ){
        vel.x *= -1; 
      }
      if(v.y  >= height/2 || v.y  <= -height/2 ){
        vel.y *= -1; 
      }
      if(v.z  >= depth/2 || v.z  <= -depth/2 ){
        vel.z *= -1; 
      }
      v.add(vel);
     
   }
  
  
  }

  void display() {
    
    pushMatrix();
    translate(v.x, v.y, v.z);
    
    strokeWeight(1);
    stroke(0);
    noFill();
    sphere(8);
    popMatrix();
  
  }  

  
}
  
  
  
  
  
  
  
  
  

