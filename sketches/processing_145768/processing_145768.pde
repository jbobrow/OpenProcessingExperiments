
class Shake{
  float speed;
  float radius;
  float posx;
  float posy;
  
  Shake(){
    
  posx = random(width);
  posy = random(height);
  radius = 75;
  speed = 5.5;
  }
  
  void update(){
    
  fill(72,9,142);
   
  posx += random(-speed,speed);
  posy += random(-speed,speed);
  
  }
  
  void display(){
    
  ellipse(posx,posy,radius,radius);
     
  } 
}

