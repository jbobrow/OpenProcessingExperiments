
class Pendulum{

  float theta;
  PVector leng = new PVector(0,0);
  float g = 9.8;
  color c;
  
  Pendulum(float length_, color c_){
    leng.y = length_;
    c = c_;
  }
  
  void update(float time){
    theta = time*leng.mag();
  }
  
  void render(){
    pushMatrix();
    translate(width/2,height/2);
    rotate(theta);
    fill(c);
    noStroke();
    ellipse(leng.x,leng.y,8,8);
    popMatrix();
  }
}

