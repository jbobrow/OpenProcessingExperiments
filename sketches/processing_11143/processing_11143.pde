
class Agent{
  float xPos; float yPos; // position
  float[] dPos = new float[2]; // move by {dX, dY}
  float bearing; // facing direction in rad, 0 == UP
  float speed; // default movement speed in direction of bearing
  
  Agent(float ix, float iy, float brng, float spd){
    xPos = ix; yPos = iy;
    bearing = brng;
    speed = spd;
    dPos[0] = 0;
    dPos[1] = -speed;
  }
  
  float[] components(float scalar, float theta){
    float[] comp = new float[2];
    comp[0] = scalar * sin(theta);
    comp[1] = scalar * cos(theta) * -1;
    return comp;
  }
  
  void change_bearing(float dTheta){
    // Normalize bearing to range 0 - 2*PI
    float raw = bearing + dTheta;
    if(raw < 0){
      bearing = 2*PI + raw;
    }else if(raw > 2*PI){
      bearing = raw - 2*PI;
    }else{bearing = raw;}
  }
    
  void turn(float turnRate){
    change_bearing(turnRate);
    dPos = components(speed, bearing);
  }
  
  void place(float iX, float iY){
    xPos = iX; yPos = iY;
  }
  
  void move(){
    xPos += dPos[0];
    yPos += dPos[1];
  }
  
  float get_xPos(){return xPos;}
  float get_yPos(){return yPos;}
  float get_bearing(){return bearing;}
  
  float get_dPos_x(){return dPos[0];}
  float get_dPos_y(){return dPos[1];}
  
  void update(){
    // write an update() method for child classes
  }
  
  void paint(){
    // write a paint() method for child classes
  }
  
}

