
class Tortoise{
  float radius;
  float x; float y;
  float scalar;
  float theta;
  float cenX; float cenY;
  PVector v;
  
  Tortoise(float irad, float ix, float iy){
    radius = irad; x = ix; y = iy;
    scalar = 100;
    theta = 0.0;
    cenX = 200; cenY = 200;
    v = new PVector(x,y);
  }
  
  float[] components(float scalar, float bearing){
    // Note this vector scheme is MUCH simpler than Turtle
    float[] comp = new float[2];
    comp[0] = scalar * sin(bearing);
    comp[1] = scalar * cos(bearing) * -1;
    return comp;
  }
  
  void change_bearing(float dTheta){
    float raw = theta + dTheta;
    theta = raw;
  }
  
  void turn(int KC, float turnRate){
    float[] nCoords = new float[2];
    if(KC == LEFT){change_bearing(-turnRate);}
    else if(KC == RIGHT){change_bearing(turnRate);}
    nCoords = components(scalar,theta);
    x = cenX + nCoords[0];
    y = cenY + nCoords[1];
    v.set(new float[] {x,y});
  }
  
  float getX(){return x;}
  float getY(){return y;}
  float get_pvector_theta(){return v.heading2D();}
  
  void paint(){
    stroke(255,0,0);
    ellipse(x,y,radius,radius);
  }
}

