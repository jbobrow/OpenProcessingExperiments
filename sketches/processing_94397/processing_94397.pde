
class Agent {  

  //GLOBAL VARIABLES
  Vec3D pos= new Vec3D(0, 0, 0);
  Vec3D speed= new Vec3D(random(-1, 1), random(-2, 2), random(-1,1));
  Vec3D gravity= new Vec3D(0, random (-0.5, 0.5), 0);
  Vec3D acceleration= new Vec3D();
  

  //CONSTRUCTOR
  Agent(Vec3D _pos) {
    pos= _pos;
  }

  //FUNCTIONS
  void run() {
    show();
    animate();
    //bounce();
    //gravity();
    //links();
    swarm();
    borders(envSize);
    buildMesh();
  }
void buildMesh(){
 for(int i=0; i<agents.size(); i++){
  Agent otherAgent=(Agent) agents.get(i);  
  float distance = pos.distanceTo(otherAgent.pos);
    if(distance>0 && distance<40){
    Vec3D a= new Vec3D(pos.x,pos.y,pos.z);
    Vec3D b= new Vec3D(otherAgent.pos.x, otherAgent.pos.y, otherAgent.pos.z);
    Vec3D temp1=pos.copy();
    Vec3D temp2= otherAgent.speed.copy();
    Vec3D c= temp1.addSelf(temp2);
    
    mesh.addFace(a,b,c);
  
  
 } 
}
}
void borders(float envSize){
  if (pos.x>envSize) pos.x=-envSize;
  if (pos.x<-envSize) pos.x=envSize;
  if (pos.y>envSize) pos.y=-envSize;
  if (pos.y<-envSize) pos.y=envSize;
  if (pos.z>envSize) pos.z=-envSize;
  if (pos.z<-envSize) pos.z=envSize;
  
  
}

  void swarm() {
    separation(8.0);
    cohesion(0.0035);
    alignment(0.15);
  } 

  void alignment(float magnitude) {
    Vec3D steer= new Vec3D();
    int count=0;
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);
      float distance= pos.distanceTo(otherAgent.pos);
      if (distance>0 && distance<80) {
        steer.addSelf(otherAgent.speed);
        count++;
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acceleration.addSelf(steer);
  }

  void cohesion(float magnitude) {
    Vec3D sum= new Vec3D();
    int count=0;
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);
      float distance= pos.distanceTo(otherAgent.pos);
      if (distance>0 && distance<60) {
        sum.addSelf(otherAgent.pos);
        count++;
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer= sum.sub(pos);
    steer.scaleSelf(magnitude);
    acceleration.addSelf(steer);
  }

  void separation(float magnitude) {
    Vec3D steer= new Vec3D();
    int count=0;
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);
      float distance= pos.distanceTo(otherAgent.pos);
      if (distance>0 && distance<40) {
        Vec3D diff= pos.sub(otherAgent.pos);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acceleration.addSelf(steer);
  }

  void links() {
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);
      float distance= pos.distanceTo(otherAgent.pos);
      if (distance>0 && distance<25) {
        stroke(255,0,
        255);
        strokeWeight(1);
        line(pos.x, pos.y, pos.z, otherAgent.pos.x, otherAgent.pos.y, otherAgent.pos.z);
      }
    }
  }
 
  void gravity() {
    speed.addSelf(gravity);
  }  
 
  /*void bounce() {
    if (pos.x > width) {
      speed.x = speed.x*-1;
    }
    if (pos.x < 0) {
      speed.x = speed.x*-1;
    }
    if (pos.y > height) {
      speed.y = speed.y*-1;
    }
    if (pos.y < 0) {
      speed.y = speed.y*-1;
    }
  }    
  */
  void animate() {
    speed.addSelf(acceleration);
    speed.limit(3);
    pos.addSelf(speed);
    acceleration.clear();
  }
 
  void show() {
    strokeWeight(5);
    stroke(0,200, pos.z);
    point(pos.x, pos.y, pos.z);
  }
}



