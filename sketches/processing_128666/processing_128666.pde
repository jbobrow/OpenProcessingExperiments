
class enemy
{
  int num;
  PVector pos, vel;
  color theC;
  int pointX = 500;
  int pointY = 500;
  boolean centered = true;
  int targetNum = 0;
  boolean fightOnce = true;
  int fightingTargetNum = 0;
  
  enemy(int theNum){
    pos = new PVector(0,0);
    vel = new PVector(0,0);
    num = theNum;
    // light blue #50B4E8
    // dark blue #33476C
    theC = color(#50B4E8);
  }
  
  void drawit(){
    fill(#477EE3);
    stroke(#342932, 120);
    strokeWeight(2);
    ellipse(pos.x, pos.y, r, r);
  }
  
  void moveSoldier(){
    PVector temp = new PVector(vel.x, vel.y);
    pos.add(temp);
    vel.x = 0;
    vel.y = 0;
    
    if(pos.x < 0) pos.x = 0;
    if(pos.x > 1000) pos.x = 1000;
    if(pos.y < 0) pos.y = 0;
    if(pos.y > 1000) pos.y = 1000;
  }
  
  void checkCollisionsE(){
    for(int i = 0; i < e1.size(); i++){
      
      if(e1.get(i).num == num){}
      else{
        PVector d = new PVector(e1.get(i).pos.x, e1.get(i).pos.y);
        d.sub(pos);
        if(d.mag() <= r){
          float magnitude = r - d.mag();
          float angle = atan2(e1.get(i).pos.y - pos.y, e1.get(i).pos.x - pos.x);
          vel.x -= cos(angle) * 1 * magnitude;
          vel.y -= sin(angle) * 1 * magnitude; 
        }
      }
    }
  }
  
  void checkCollisionsP(){
    for(int i = 0; i < p1.size(); i++){
      
      // if you're fighting, only fight the group you are fighting
      if(enemyTarget.get(targetNum).fighting){
        if(fightingTargetNum != p1.get(i).targetNum){}
        else{
        
          PVector d = new PVector(p1.get(i).pos.x, p1.get(i).pos.y);
          d.sub(pos);
          if(d.mag() <= r){
            float magnitude = r - d.mag();
            float angle = atan2(p1.get(i).pos.y - pos.y, p1.get(i).pos.x - pos.x);
            vel.x -= cos(angle) * 1 * magnitude;
            vel.y -= sin(angle) * 1 * magnitude;
          }
        }  
      }  
      // if you aren't fighting, and particles are, don't join the fight
      // if you aren't fighting, and particles are aimed towards the center, don't fight them
      else if(target.get(p1.get(i).targetNum).fighting 
           || target.get(p1.get(i).targetNum).aimedAtCenter){
         
          PVector d = new PVector(p1.get(i).pos.x, p1.get(i).pos.y);
          d.sub(pos);
          if(d.mag() <= r){
            float magnitude = r - d.mag();
            float angle = atan2(p1.get(i).pos.y - pos.y, p1.get(i).pos.x - pos.x);
            vel.x -= cos(angle) * 1 * magnitude;
            vel.y -= sin(angle) * 1 * magnitude;
          }
  
      }
      // if you aren't fighting, and particles aren't busy, initiate a fight with them
      else{        
        PVector d = new PVector(p1.get(i).pos.x, p1.get(i).pos.y);
          d.sub(pos);
          if(d.mag() <= r){
            if(fightOnce){
              fightOnce = false;
              
              int tempTargetNum = p1.get(i).targetNum;
              
              if(tempTargetNum == 0){
              //  aplayer3.rewind();
               // aplayer3.play();
                p1.remove(i);
                for(int what = i; what < p1.size(); what++){
                  p1.get(what).num--;
                }
                e1.remove(this);
                break;
              }
              else{
              //  aplayer4.rewind();
               // aplayer4.play();
                makeFight(tempTargetNum, targetNum);
              }
            }
            
            float magnitude = r - d.mag();
            float angle = atan2(p1.get(i).pos.y - pos.y, p1.get(i).pos.x - pos.x);
            vel.x -= cos(angle) * 1 * magnitude;
            vel.y -= sin(angle) * 1 * magnitude; 
        }
      }
    }
  }
  
  void attractPoint(){
    float angle;
    if(targetNum == 0){
      angle = atan2(pointY - pos.y, pointX - pos.x);
      fightOnce = true;
    }
    else{
      fill(150);
      ellipse(enemyTarget.get(targetNum).pos.x, enemyTarget.get(targetNum).pos.y, 5, 5);
      angle = atan2(enemyTarget.get(targetNum).pos.y - pos.y, enemyTarget.get(targetNum).pos.x - pos.x);
    }
    vel.x += 3*cos(angle);
    vel.y += 3*sin(angle);
  }
}

