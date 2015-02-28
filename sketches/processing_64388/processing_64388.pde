
class Particle {
  UVec3 pos,dir;
  UVertexList path;
  
  float speed,rad;
  float rotD;
  int level,col;
  int stateCnt,stateGoal;
  
  Particle(Particle parent) {
    float x,y,angle;

    if(parent==null) { // first level
      rad=10;
      x=width/2;
      y=height;
      level=0;
      speed=startSpeed;
      angle=-HALF_PI;
    }
    else { // inherit qualities from parent
      rad=parent.rad*0.8;
      x=parent.pos.x;
      y=parent.pos.y;
      level=parent.level+1;
      speed=parent.speed*speedMod;
      angle=parent.dir.angle2D();
      angle+=radians(
        random(-branchAngle,branchAngle));
    }
    
    pos=new UVec3(x,y);
    dir=new UVec3(speed,0,0).rotate(angle);
    path=new UVertexList();
    path.add(pos);
    
    stateGoal=(int)random(20,50);
    stateCnt=0;
    
    col=colors.getRandomColor();

    rotD=radians(random(0.2,0.5));
    // apply rotD modifier according to current level
    rotD*=map(level,0,maxLevel-1,0,rotMod);
    if(random(100)>50) rotD=-rotD;
  }
  
  void draw() {
    fill(col);
    
    // draw all stored points in path
    for(int i=0; i<path.n; i++) {
      if(i%3==0) {
        noStroke();
        fill(col);
        ellipse(path.v[i].x, path.v[i].y, rad, rad);
      }
      if(i>0) {
        strokeWeight(2);
        stroke(col);
        line(path.v[i].x, path.v[i].y,
          path.v[i-1].x, path.v[i-1].y);
      }
    }
    
    if(stateCnt>stateGoal) return;
    
    // update position and rotation
    pos.add(dir.rotate(rotD));
    
    // store position every other frame
    if(stateCnt%2==0) path.add(pos);
    
    // check state counter
    stateCnt++;
    if(stateCnt==stateGoal && level<maxLevel) {
      int n=(int)random(2,maxBranches+1);
      if(maxBranches==1) n=1;
      for(int i=0; i<n; i++) p.add(new Particle(this));
    }
  }
}


