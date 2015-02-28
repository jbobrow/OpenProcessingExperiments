
/*
MATH CREDIT: Starkes on openprocessing.org
http://www.openprocessing.org/portal/?userID=701
http://www.openprocessing.org/visuals/?visualID=861
*/

class Particle {
  float theta, u;
  float aTheta, aU = 0;
  float vTheta, vU;
  float x, y, z;
  float windSeeda, windSeedb;
  int id;
  
  Particle(float Theta, float U,int ID) {
    id=ID;
    theta=Theta;
    u=U;
    vTheta=0;
    vU=0;
    windSeeda=random(id);
    windSeeda=random(id);
  }  
  
  void wind(float Speed) {
    float speed=Speed;
    aTheta=noise(int(windSeeda)+frameCount*0.001)*2-1*speed;
    aU=noise(int(windSeedb)+frameCount*0.001)*2-1*speed;
  }
  
  void update() {
    vTheta+=aTheta*0.001;
    theta+=vTheta;
    if(theta<0) {
      theta=TWO_PI;
    }
    if(theta>TWO_PI) {
      theta=0;
    }
    
    vU+=aU*0.00005;
    u+=vU;
    if(u<-1||u>1) {
      u=-u;
    }
    aU*=0.99;
    aTheta*=0.99;
    vU*=0.95;
    vTheta*=0.95;
    x = radius*cos(theta)*sqrt(1-(u*u));
    y = radius*sin(theta)*sqrt(1-(u*u));
    z = u*radius;
  }
  
  void display() {
    stroke(255);
    strokeWeight(1);
    point(x,y,z);
  }
}

