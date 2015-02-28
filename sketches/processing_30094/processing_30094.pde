
class Pendulum{

  float theta_0;
  float theta;
  PVector leng = new PVector(0,0);
  float g = 9.8;
  int conv = 4000000; //conversion factor from physics units to pixels
  color c;
  
  Pendulum(float length_, float theta_0_, color c_){
    theta_0 = theta_0_;
    leng.y = length_;
    c = c_;
  }
  
  void update(float time){
    theta = theta_0*cos(sqrt(g/leng.mag())*time);
  }
  
  void render(){
    pushMatrix();
    translate(width/2,50-height);
    rotate(theta);
    line(0,0,conv*leng.x,conv*leng.y);
    fill(c);
    noStroke();
    ellipse(conv*leng.x,conv*leng.y,8,8);
    popMatrix();
  }
}

