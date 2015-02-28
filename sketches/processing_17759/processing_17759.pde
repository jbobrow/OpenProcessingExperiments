

class Attract {
  Particle a;
  Magnet b;
  float length, speed;
  
  
  Attract(Particle a, Magnet b, float length, float speed) {
    this.a = a;
    this.b = b;
    this.length = length;
    this.speed = speed;
  }
  
  void update(){
    float dX = this.b.x - this.a.x;
    float dY = this.b.y - this.a.y;
    float distance = sqrt(dX*dX + dY*dY);
    
    if(distance > 0) {
      dX /= distance;
      dY /= distance;
    }
    
    float d = distance - this.length;
   
    a.velocityX += dX * d * this.speed; 
    a.velocityY += dY * d * this.speed;
    
    b.velocityX -= dX * d * this.speed; 
    b.velocityY -= dY * d * this.speed;
  }
  
  void draw(){
    noFill();
    stroke(255);
  }
  
  
}

