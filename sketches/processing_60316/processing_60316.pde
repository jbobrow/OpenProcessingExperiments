

class Ball{
  PVector pos;
  PVector vel;
  float rad;
    
  Ball(PVector tempPos, PVector tempVel, float tempRad){
    pos = tempPos.get();
    vel = tempVel.get();
    rad = tempRad;
  }
  
  void paint(color col){
    noStroke();
    fill(col);
    pushMatrix();
      translate(pos.x,pos.y,pos.z);
      sphere(rad);
    popMatrix();
  }

  void update(PVector g, float resistance){
    pos.add(vel);
    vel.mult(resistance);
    vel.add(g);
  }

  void contact(PVector[] map3D, boolean[] consImg, int xSize){
    float minDist = 10000;
    int minIndex = 0;
    
    for(int i = 0; i < consImg.length; i++){
      if(consImg[i]){
        PVector p = map3D[i];
        float distance = pos.dist(p) - rad;
        if((distance < minDist) && (distance > 0)){
          minDist = distance;
          minIndex = i;
        }
      }
    }
    if(minDist < 10){
      PVector closestPos = map3D[minIndex];
      PVector dir = PVector.sub(pos,closestPos);
      dir.normalize();
      dir.mult(25);
      vel.set(dir);
    }
  }
  
}


