
class Agent{
  float xPos; float yPos; // position
  float[] dPos = new float[2]; // move by {dX, dY}
  float radius; // radius of Agent body
  float bearing; // facing direction in rad, 0 == UP
  float speed; // default movement speed in direction of bearing
  float[][] radarPoly = new float[4][2]; // collide polygon for field of vision
  // parameters for radar polygon
  float radarDepth; // in pixels
  float radarSpread; // in radians
  float[][] radarShape = new float[3][2]; // prototype radar polygon
  // for point i:
  // radarShape[i][0]: component in the bearing direction
  // radarShape[i][1]: component perpendicular to the bearing direction
  
  Agent(float ix, float iy, float irad, float brng, float spd){
    xPos = ix; yPos = iy;
    radius = irad;
    bearing = brng;
    speed = spd;
    dPos[0] = 0;
    dPos[1] = -speed;
    set_radar_params(100,PI/5);
  }
  
  float[] components(float scalar, float theta){
    float[] comp = new float[2];
    comp[0] = scalar * sin(theta);
    comp[1] = scalar * cos(theta) * -1;
    return comp;
  }
  
  void set_radar_params(float depth, float spread){
    radarDepth = depth;
    radarSpread = spread;
    float[] temp = components(depth, spread/2);
    radarShape[1] = new float[] {radarDepth, 0};
    radarShape[0] = new float[] {-temp[1],  temp[0]};
    radarShape[2] = new float[] {-temp[1], -temp[0]};
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
  
  void gen_radarPoly(){
    // unit vector in direction of heading
    float[] unitBearing = components(1, bearing);
    // cross product of unit vector yields perpendicular
    float[] unitCross = {-unitBearing[1],unitBearing[0]};
    // If this gets any more complex strongly consider benefits of the PVector class
    radarPoly = new float[][]
                 {{xPos + radius * unitBearing[0], yPos + radius * unitBearing[1]},
                 {xPos + radarShape[0][0] * unitBearing[0] + radarShape[0][1] * unitCross[0], 
                       yPos + radarShape[0][0] * unitBearing[1] + radarShape[0][1] * unitCross[1]},
                 {xPos + radarShape[1][0] * unitBearing[0] + radarShape[1][1] * unitCross[0], 
                       yPos + radarShape[1][0] * unitBearing[1] + radarShape[1][1] * unitCross[1]},
                 {xPos + radarShape[2][0] * unitBearing[0] + radarShape[2][1] * unitCross[0], 
                       yPos + radarShape[2][0] * unitBearing[1] + radarShape[2][1] * unitCross[1]}};
  }
  
  void turn(int KC, float turnRate){
    if(KC == LEFT){change_bearing(-turnRate);}
    else if(KC == RIGHT){change_bearing(turnRate);}
    dPos = components(speed, bearing);
  }
  
  void move(){
    xPos += dPos[0];
    yPos += dPos[1];
  }
  
  float get_xPos(){return xPos;}
  float get_yPos(){return yPos;}
  
  void paint(){
    gen_radarPoly();
    stroke(255);
    fill(255);
    ellipse(xPos,yPos,radius,radius);
    line(xPos,yPos,xPos + 5*dPos[0], yPos + 5*dPos[1]);
    line(radarPoly[0][0],radarPoly[0][1],radarPoly[1][0],radarPoly[1][1]);
    line(radarPoly[1][0],radarPoly[1][1],radarPoly[2][0],radarPoly[2][1]);
    line(radarPoly[2][0],radarPoly[2][1],radarPoly[3][0],radarPoly[3][1]);
    line(radarPoly[3][0],radarPoly[3][1],radarPoly[0][0],radarPoly[0][1]);
  }
}

