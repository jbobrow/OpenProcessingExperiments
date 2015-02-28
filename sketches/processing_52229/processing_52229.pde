
class Branch2 {  
  PVector loc;
  PVector vel;
  float timerStart;
  float timer;
  float iniWidth;
  float iterateRate;
  float velRandomRange; 
  float degenRate;
  float h;
  float b;
  
  Branch2(PVector l,PVector v,float t) {  
    loc=l.get();
    vel=v.get();    
    timerStart=t;
    timer=timerStart;
    iniWidth=(timerStart/MAX_WIDTH)*treeWidth;
    iterateRate=0.8f;
    velRandomRange=100.0;
    b=map(MAX_WIDTH-timerStart,0,MAX_WIDTH,0.4,1);
    degenRate=1;
    h=random(45,75);
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(new PVector(((random(velRandomRange)-random(velRandomRange))*0.0005),((random(velRandomRange)-random(velRandomRange))*0.0005)));    
    if(vel.y>0)vel.y*=-1;
    loc.add(vel);
  }

  void render() {    
    float newWidth=iniWidth*(iterateRate+(1-iterateRate)*(timer/timerStart));
    float a=newWidth/treeWidth;
    noStroke();
    b=b+random(-0.05,0.05);
    fill(h,1,b,a);    
    
    ellipseMode(CENTER);
    ellipse(loc.x,loc.y,newWidth,newWidth);
    /*
    //painting with stroke only
     noFill();
     strokeWeight(newWidth);
     stroke(v,branchAlpha);
     point(loc.x,loc.y);
     */
  }

  boolean timeToBranch() {
    timer-=degenRate;
    if(timer<0) {
      return true;
    }
    else {
      return false;
    }
  }

  Branch2 branch(float angle) {
    float theta=vel.heading2D();
    float mag=vel.mag();
    theta+=radians(angle);
    PVector newVel=new PVector(mag*cos(theta),mag*sin(theta));
    return new Branch2(loc,newVel,timerStart*iterateRate);
  }
}


