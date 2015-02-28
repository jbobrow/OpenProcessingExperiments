
class Connector {

  Thing[] tGroup;
  ArrayList tGroupRef;
  ArrayList tGroupRandom;  
  int numT;

  float mass;
  float G;
  PVector loc;
  boolean dragging=false;
  boolean rollover=false;
  PVector drag;

  Connector(PVector _l,float _m,float _g,int n) {
    loc=_l;
    mass=_m;
    G=_g;
    drag=new PVector(0.0,0.0);

    numT=n;
    tGroup=new Thing[MAX];
    initParticles();
    randomConnect();
  }

  void initParticles() {
    tGroupRef=new ArrayList();
    for (int i=0;i<tGroup.length;i++) {
      PVector ac=new PVector(0,0,0);
      PVector ve=new PVector(0,0,0);
      PVector lo=new PVector(random(width),random(height),random(-200,200));
      tGroup[i]=new Thing(ac,ve,lo,20);
      tGroupRef.add(tGroup[i]);
    }
  }

  void go() {
    render();
    loc=new PVector(mouseX,mouseY,0);
    for (int i=0;i<tGroup.length;i++) {
      PVector f=calGravForce(tGroup[i]);
      tGroup[i].applyForce(f);
      tGroup[i].go();
    }
  }

  PVector calGravForce(Thing t) {
    PVector dir=PVector.sub(loc,t.getLoc());
    float d=dir.mag();
    d=constrain(d,4.0,15.0);
    dir.normalize();
    float force=(G*mass*t.getMass())/(d*d);
    dir.mult(force);
    return dir;
  }

  void render() {
    for(int i=0;i<tGroupRandom.size();i+=3) {

      Thing p1=(Thing)tGroupRandom.get(i);
      Thing p2=(Thing)tGroupRandom.get(i+1);
      Thing p3=(Thing)tGroupRandom.get(i+2);
      noStroke();
      
      float d1=PVector.dist(p1.loc,p2.loc);
      float d2=PVector.dist(p2.loc,p3.loc);
      float d3=PVector.dist(p3.loc,p1.loc);
      
      /*
      if(d1<200) {
        beginShape(LINES);
        vertex(p1.loc.x,p1.loc.y,p1.loc.z);
        vertex(p2.loc.x,p2.loc.y,p2.loc.z);
        endShape();
      }

      if(d2<200) {
        beginShape(LINES);
        vertex(p2.loc.x,p2.loc.y,p2.loc.z);
        vertex(p3.loc.x,p3.loc.y,p3.loc.z);
        endShape();
      }

      if(d3<200) {
        beginShape(LINES);
        vertex(p1.loc.x,p1.loc.y,p1.loc.z);
        vertex(p3.loc.x,p3.loc.y,p3.loc.z);
        endShape();
      }
      */
      
      beginShape(TRIANGLES);
      fill(p1.c);     
       vertex(p1.loc.x,p1.loc.y,p1.loc.z);
        fill(p2.c);     
       vertex(p2.loc.x,p2.loc.y,p2.loc.z);
       fill(p3.c);     
       vertex(p3.loc.x,p3.loc.y,p3.loc.z);
       endShape();
       
    }
  }

  void randomConnect() {    
    tGroupRandom=new ArrayList();
    while(tGroupRef.size()>0) {
      int randPick=(int)random(tGroupRef.size());
      tGroupRandom.add(tGroupRef.get(randPick));
      tGroupRef.remove(randPick);
    }
    for(int i=0;i<tGroup.length;i++) {   
      tGroupRef.add(tGroup[i]);
    }
  }

  void clicked(int mx,int my) {
    float d=dist(mx,my,loc.x,loc.y);
    if(d<mass) {
      dragging=true;
      drag.x=loc.x-mx;
      drag.y=loc.y-my;
    }
  }

  void rollover(int mx,int my) {
    float d=dist(mx,my,loc.x,loc.y);
    if(d<mass) {
      rollover=true;
    }
    else {
      rollover=false;
    }
  }

  void stopDragging() {
    dragging=false;
  }

  void drag() {
    if(dragging) {
      loc.x=mouseX+drag.x;
      loc.y=mouseY+drag.y;
    }
  }
}


