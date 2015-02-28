
class Coisa{ // "Thing"
  PVector loc;
  PVector vel;
  PVector acc;
  PVector colors;
  float maxVel;
  Coisa(PVector loc_, PVector vel_, PVector acc_, PVector colors_){
    loc = loc_.get();
    vel = vel_.get();
    acc = acc_.get();
    colors = colors_.get();
    maxVel = 7;
  }
  
  void go(){
    move();
    render();
    border();
  }
  
  void move(){
    vel.add(acc);
    loc.add(vel);
    if(vel.mag() > maxVel){
      vel.normalize();
      vel.mult(maxVel);
    }
  }
  
  void border(){
    if((loc.y > height+100) || (loc.y < -100)){
      vel.y *= -0.5;
    }
    if((loc.x < -100) || (loc.x > width+100)){
      vel.x *= -0.5;
    }
  }
  
  void render(){
    color r =(int) colors.x;
    color g =(int) colors.y;
    color b =(int) colors.z;
    
    stroke(r,g,b,30);
    point(loc.x,loc.y);
  }
  
  //geters e seters
  PVector getVel(){
    return vel.get();
  }
  
  PVector getLoc(){
    return loc.get();
  }
  
  PVector getAcc(){
    return acc.get();
  }
  
  float getMaxVel(){
    return maxVel;
  }
  
  PVector getColor(){
    return colors.get();
  }
  
  void setVel(PVector v){
    vel = v.get();
  }
  
  void setLoc(PVector v){
    loc = v.get();
  }
  
  void setAcc(PVector v){
    acc = v.get();
  }
  
  void setMaxVel(float f){
    maxVel = f;
  }
  
  void setColor(PVector v){
    colors = v.get();
  }
  
  
}

