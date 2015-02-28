
import toxi.geom.*;
// import library
import processing.video.*;


// global variable
//MovieMaker mm;


// f key to finish and save the movie
void keyPressed(){
  
 if(key=='f'){
//  mm.finish();
 } 
}





// random comment
ArrayList agentPop;
int maxKiller;
int popKiller;
int popTotal;
int timerLength;

void setup(){
  size(600,600);
  smooth();
  
  
// initialise in the setup function
//mm = new MovieMaker(this, width, height, "trTails.mov", 30, MovieMaker.MOTION_JPEG_B, MovieMaker.BEST);


 
 
  
popTotal = 300;
  agentPop = new ArrayList();
  maxKiller = popTotal;
  timerLength = 150;
  
  for(int i = 0; i < popTotal; i++){
    Vec3D p = new Vec3D(random(0,width),random(0,height),0);
    Vec3D v = new Vec3D(random(-1,1), random(-1,1),0);
    float r = 30;
    float mV = 3;
    float mF = 0.1;
    int st = 0;
    float a = random(0,1);
    float c = random(0,5);
    float s = random(0,8);
    float cR = .5;
    int kC = 0;
    int t = 0;
    agentPop.add( new agent(p, v, r, mV, mF, st, a, c, s, cR, kC, t) );
  }
  

  

}


void draw(){
 fill(180,20); 
 rect(0,0,height,width);

  for(int i = 0; i < agentPop.size(); i++){
    agent a = (agent) agentPop.get(i);   
    a.update();
    a.render();
    a.check();
  }
  
  // add frame in the draw function
//mm.addFrame();
 
}

class agent{

  // states
  Vec3D pos;
  Vec3D vel;
  float rangeOfVis;
  float maxVel;
  float maxForce;
  int state;
  float al;
  float co;
  float se;
  float collisionRange;
  int killCount;
  int timer;
  // constructor
  agent(Vec3D _pos, Vec3D _vel, float _rangeOfVis, float _maxVel, float _maxForce, int _state, float _al, float _co, float _se, float _collisionRange, int _killCount, int _timer){
    pos = _pos;
    vel = _vel;
    rangeOfVis = _rangeOfVis;
    maxVel = _maxVel;
    maxForce = _maxForce;
    state = _state;
    al = _al;
    co = _co;
    se = _se;
    collisionRange = _collisionRange;
    killCount = _killCount;
    timer = _timer;
  }


  // behaviors

  void update(){

    // set acc 0
    Vec3D acc = new Vec3D();

    // calls all vector functions based on population type 
    Vec3D ali;
    Vec3D coh;
    Vec3D sep;
    

//      Vec3D seek = steer( new Vec3D(mouseX, mouseY, 0) );
      ali = alignment(agentPop, rangeOfVis);
      coh = cohesion(agentPop, rangeOfVis);
      sep = separation(agentPop, rangeOfVis/3);

      // scale vectors
//      seek.scaleSelf(0);



      ali.scaleSelf(al);
      coh.scaleSelf(co);
      sep.scaleSelf(se);

      // add to acc
//      acc.addSelf(seek);
      acc.addSelf(ali);
      acc.addSelf(coh);
      acc.addSelf(sep);

    // add acc to vel: vel = vel + acc
    vel.addSelf(acc);
    // limit vel to maxVel
    vel.limit(maxVel);
       
    // if the agent is a corpse, all movement vectors should be nullified for a set period of time; the timer runs in the check() function
    if (state == 2){
      vel.subSelf(vel);}
   
    // add vel to pos
    pos.addSelf(vel); 
    
    borders();
  }


  Vec3D steer(Vec3D target){

    Vec3D st;
    // target is vector from pos to target
    target.subSelf(pos);
    // distance to the target from the pos
    float d = target.magnitude();
    if(d > 0){
      target.normalize();
      target.scaleSelf(maxVel);
      target.subSelf(vel);
      st = target.copy();
      st.limit(maxForce);
    }
    else{
      st = new Vec3D();
    }

    return st;

  }


  Vec3D alignment(ArrayList pop, float localRangeOfVis){

    // sum = (0,0,0)
    Vec3D sum = new Vec3D();
    int count = 0;
    
for(int i = 0; i < agentPop.size(); i++){
      agent a = (agent) agentPop.get(i);
     
      float d = pos.distanceTo(a.pos);
      
  if( (d < localRangeOfVis*2) && (d > 0)){  
  
        sum.addSelf(a.vel);
        count++;
      }
  
      if(count > 0){
      sum.scaleSelf(1/(float)count);
      sum.limit(maxForce);
    }
}
       
    // return sum
    return sum;
  }
  

  Vec3D cohesion(ArrayList pop, float localRangeOfVis){

    Vec3D sum = new Vec3D();
    int count = 0;

    // loop through the arraylist
    for(int i = 0; i < pop.size(); i++){
      agent a = (agent) pop.get(i);      
      // get distance to the agent
      float d = pos.distanceTo(a.pos);   
      // if the agent with the rangeOfVis
      if( (d < localRangeOfVis) && (d > 0) ){
      //   sum = sum + a.pos;
        sum.addSelf(a.pos);
        count++;
      }
    }

    if(count > 0){
      // sum / count
      sum.scaleSelf(1/(float)count);
      // steer toward the sum //target
      sum = steer(sum);
      sum.limit(maxForce);
    }

    // return sum
    return sum;
  }

  Vec3D separation(ArrayList pop, float localRangeOfVis){

    Vec3D sum = new Vec3D();
    int count = 0;

    for(int i = 0; i < pop.size(); i++){
      agent a = (agent) pop.get(i);
      float d = pos.distanceTo(a.pos);
      if( (d < localRangeOfVis) && (d > 0) ){
        // vec = pos - a.pos
        Vec3D vec = pos.sub(a.pos);
        // scale inverse to distance
        vec.scaleSelf(1/d);
        // add to sum
        sum.addSelf(vec);
        count++;
      }

    }

    if(count > 0){
      sum.scaleSelf(1/(float)count);  
      sum.limit(maxForce);      
    }  
    return sum;
  }

void check(){

  //------CIV------
    if (state == 0){
      
    for(int i = 0; i < agentPop.size(); i++){
      agent a = (agent) agentPop.get(i);
     
      float d = pos.distanceTo(a.pos);
       
      // CIV meets CIV
      if( (d < rangeOfVis) && (d > 0) && (a.state == 0)){  
        
        al = 1;
        se = 3;
        co = 2;
    
      }
      
      // CIV meets KILLER
      if( (d < rangeOfVis) && (d > 0) && (a.state == 1)){  
        al = -3;
        se = 3;
        co = 0;
       
      }
      
      // CIV meets CORPSE
      if( (d < rangeOfVis) && (d > 0) && (a.state == 2)){  
        al = 0;
        se = 3;
        co = 1;
        if (d < 20){
          strokeWeight(1);
        stroke(255,0,0,100);
        line(pos.x, pos.y, a.pos.x, a.pos.y); 
      }
       
      }
     
    }
    }
    



//------KILLER------

    if (state == 1){
      
    for(int i = 0; i < agentPop.size(); i++){
      agent a = (agent) agentPop.get(i);
     
      float d = pos.distanceTo(a.pos);
       
      // KILLER meets CIV
      if( (d < rangeOfVis) && (d > 0) && (a.state == 0)){  
        
        al = 1;
        se = 0;
        co = 3;
        if (d < 10){
          strokeWeight(1.5);
        stroke(0,255,0);
        line(pos.x, pos.y, a.pos.x, a.pos.y); 
      }
       
      }
      
       // KILLER meets KILLER
      if( (d < rangeOfVis) && (d > 0) && (a.state == 1)){  
        
        al = 0;
        se = 3;
        co = 1;
       
      }
      
       // KILLER meets CORPSE
      if( (d < rangeOfVis*2) && (d > 0) && (a.state == 2)){  
        
        al = -1; //move in opposite direction
        se = 4;//move away
        co = 0; //do not try to get close
 
      }
    }
    }
  
  
  
 // as the killcount increases, the behavior changes.
if ((state == 1) && (killCount < 4)){
maxForce = maxForce + killCount/10;
maxVel = maxVel + killCount/10;
}

  // if the killcount reaches a certain level - do this
if ((state == 1) && (killCount == 10)){
  
  state = 2;
  timer = timerLength;
  killCount = 0;
  maxForce = .1;
  maxVel = 3;
  vel.subSelf(vel);
 
}




// keeping track of how long a corpse has been a corpse

if ((state == 2) && (timer > 0))
{ timer = timer - 1;}

if ((state == 2) && (timer == 0))
{ state = 0; timer = 0;}

 
 
// ckecking to see how many killers are in the system
popKiller = 0;
for(int i = 0; i < agentPop.size(); i++){
agent a = (agent) agentPop.get(i);
if (a.state == 1){
  popKiller = popKiller + 1;}
}
 
 
 //check for collisions, and if there are any, change the state of the agents.
for(int i = 0; i < agentPop.size(); i++){
agent a = (agent) agentPop.get(i);

float d = pos.distanceTo(a.pos);
 
 
 // if two civs collide and there are less than the max of killers.
if ((d < collisionRange) && (d >0) && (state == 0) && (a.state == 0) && (popKiller < maxKiller)){
  state = 1;
  maxVel = 5;
  rangeOfVis = 75;
  
  break;
}

 // if two civs collide and there are enough killers in the system.
if ((d < collisionRange) && (d >0) && (state == 0) && (a.state == 0) && (popKiller >= maxKiller)){
  state = 0;
  break;
}

 // if  a  killer collides with a civ.
if ((state == 1) && (a.state == 0) && (d < collisionRange) && (d >0)){
  
  strokeWeight(4);
  stroke(255,0,0,100);
  line(pos.x,pos.y,a.pos.x,a.pos.y);
  a.state = 2;
  a.timer = timerLength;
  killCount = killCount + 1;
  break;
}
  
}  
  

}




  void borders(){
    if(pos.x < 0) pos.x = width;
    if(pos.y < 0) pos.y = height;
    if(pos.x > width) pos.x = 0;
    if(pos.y > height) pos.y = 0;   
  }


  void render(){
    
//    String s = new String(new Integer(this.state).toString());
//     text(s, pos.x, pos.y, 50, 50);
      
      if (state == 0){
        fill(255);}
      
      if (state == 1){
        fill(0,(255-(killCount*50)),0);}
        
      if (state == 2){
        fill(100);}
        
        strokeWeight(0);
        stroke(0);
    
    ellipse(pos.x, pos.y, 5, 5);  
  }

}

