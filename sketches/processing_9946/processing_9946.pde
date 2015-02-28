
class Agent{
  PVector pos, vel, followSum, escapeSum;
  color c;
  float mass;

  Agent(int _x, int _y){
    pos=new PVector(_x,_y);  
    vel=new PVector(random(-1,1),random(-1,1));
    followSum=new PVector(0,0);
    escapeSum=new PVector(0,0);    
    mass=random(1,10);
  }

  void move(){
    vel.add(follow());
    vel.add(escape());
    vel.mult(0.95);
    pos.add(vel);  
  }

  void display(){
    if(pos.x>0&&pos.x<width-1&&pos.y>0&&pos.y<height-1){
      ca.cell[round(pos.x)][round(pos.y)][1]=mass/10;
    }
  }

  PVector follow(){///////////attraction force
    followSum.mult(0);
    int count=0;
    for(int i=0; i<attrPoints.size();i++){
      PVector aPt=(PVector)attrPoints.get(i);
      float d=pos.dist(aPt);
      if (d<450){//attraction distance
        PVector dir = PVector.sub(aPt,pos);
        dir.normalize();
        dir.div(d);
        
        followSum.add(dir);
        count++;  
      }
    }  
    if (count > 0) {
      followSum.div(count);
      followSum.mult(mass);
    }
    return followSum;
  }

  PVector escape(){///////////repulsion force
    escapeSum.mult(0);
    int count=0;
    for(int i=0; i<repPoints.size();i++){
      PVector rPt=(PVector)repPoints.get(i);
      float d=pos.dist(rPt);
      if (d<450){//repulsion distance
        PVector dir = PVector.sub(rPt,pos);
        dir.normalize();
        dir.div(d);
        escapeSum.sub(dir);
        count++;  
      }
    }  
    if (count > 0) {
      escapeSum.div(count);
      escapeSum.mult(mass);
    }
    return escapeSum;
  }
}



