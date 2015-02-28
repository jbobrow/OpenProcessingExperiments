
class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover(){
    
    location=new PVector((width/2),random(height));
    velocity=new PVector(0,0);
    acceleration=new PVector(-0.001,0.01);
    topspeed=10;
    
  }
  void update(){
    PVector mouse=new PVector(mouseX,mouseY);
    PVector dir=PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(2);
    acceleration=dir;
    /*acceleration=new PVector(random(-1,1),random(-1,1));
    acceleration.normalize();
    acceleration.mult(random(3));*/
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void display(){
    stroke(0);
    fill(135);
    ellipse(location.x,location.y,9,9);
  }
  
  void checkEdges(){
    if (location.x>width){
      location.x=0;
    }else if(location.x<0){
      location.x=width;
    }
    
    if (location.y>height){
      location.y=0;
    }else if (location.y<0){
      location.y=height;
    }
    
}
}

