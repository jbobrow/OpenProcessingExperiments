
/**
  * Agent
  * Base class for actors in LittleBattle
  * SquareCrow, December 2010
  */
  

class Agent{
  // class variables
  float radius;
  float[] center = new float[2];
  float[] pastCenter = new float[2];
  float[] dPos = new float[2]; // move by {dX, dY}
  float speed; float maxSpeed;
  float bearing; // facing direction in rad, 0 == UP
  float turnRate; float maxTurnRate;
  
  //float[][] actions = new float[20][2];
  // actions are movements to be carried out by the Agent
  
  float[] command = new float[2]; // format: {pixels_to_travel, radians_to_turn}
  
  Agent(float[] inCoords){
    center = inCoords;
    radius = 4;
    speed = 4; maxSpeed = 6;
    turnRate = PI/45; maxTurnRate = PI/15;
    bearing = random(-PI,PI);
  }
  
  float[] components(float scalar, float theta){
    // direction in rad, 0 == UP
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
  
  void move(){
    center[0] += dPos[0];
    center[1] += dPos[1];
  }
  
  void auto_move(){
    float movit;
    if(command[0] > speed){movit = speed;}
    else{movit = command[0];}
    float[] temp = components(movit,bearing);
    dPos[0] = temp[0];
    dPos[1] = temp[1];
    move();
    command[0] -= movit;
  }
  
  void auto_turn(){
    float turnit;
    if(abs(command[1]) > turnRate){turnit = turnRate;}
    else{turnit = abs(command[1]);}
    if(command[1] < 0){change_bearing(-turnit);}
    else{change_bearing(turnit);}
    command[1] -= turnit;
  }
  
  float[] get_pastCenter(){return pastCenter;}
  float[] get_center(){return center;}
  
  void update(){
    //print("I updated");
    //dPos = new float[] {random(-4,4),random(-4,4)};
    //move();
    pastCenter = new float[] {center[0], center[1]};
    if(command[0] < speed && command[1] < abs(turnRate)){
      command[0] = random(20);
      command[1] = random(-PI,PI);
    }
    auto_move();
    auto_turn();
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(center[0],center[1],radius,radius);
  }
}

