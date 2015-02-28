
class particle{
  PVector loc,vel,acc;
   
  particle(){
    loc = new PVector(random(0,width/4),random(height*3/4,height));
    vel = new PVector(random(0.8,0.9),random(1,1.1));
    acc = new PVector(0,0);
  }
   
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
   
  void applyforce(PVector f){
    acc.add(f);
  }
     
  void checkedges(){
    if(loc.x<0){
      loc.x = 0;
      vel.x*= -1;
    }
    else{
      if(loc.x>width){
        loc.x = width;
        vel.x*= -1;
      }
    }
     
    if(loc.y<0){
      loc.y = 0;
      vel.y*= -1;
    }
    else{
      if(loc.y>height){
        loc.y = height;
        vel.y*= -1;
      }
    }
  }
}
       
  
 
int n = 120;
particle[] mover = new particle[n];
 
void setup(){
  size(800,600);
  for(int i=0;i<n;i++){
    mover[i] = new particle();
  }
}
 
void draw(){
  background(0,255);
  smooth();
  fill(255);
  ellipse(width,height,2,2);
  float d;
  PVector dir;
  PVector sun = new PVector(width/2,height/2);
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      if(i!=j){
        d =  PVector.dist(mover[i].loc,sun);
        dir = PVector.sub(sun,mover[i].loc);
        dir.normalize();
        dir.mult(2/(d*d));
        mover[i].applyforce(dir);
        
        /*d = PVector.dist(mover[i].loc,mover[j].loc);
        dir = PVector.sub(mover[j].loc,mover[i].loc);
        dir.normalize();
        dir.mult(0.04/(d*d));
        mover[i].applyforce(dir);*/
      }
    }
    /*d =  PVector.dist(mover[i].loc,sun);
        dir = PVector.sub(sun,mover[i].loc);
        dir.normalize();
        dir.mult(20/(d*d));
        mover[i].applyforce(dir);*/
  }
       
  for(int i=0;i<n;i++){
     mover[i].checkedges();
     mover[i].update();
  }
   
   
  for(int i=0;i<n;i++){
    for(int j=i;j<n;j++){
      if(i!=j){
        d = PVector.dist(mover[i].loc,mover[j].loc);
        stroke(255-d,255-d,255-d,80-d);
        line(mover[i].loc.x,mover[i].loc.y,mover[j].loc.x,mover[j].loc.y);
      }
      
    }
  }
  for(int i=0;i<n;i++){
    d = PVector.dist(mover[i].loc,sun);
    stroke(255,275-d);
    line(sun.x,sun.y,mover[i].loc.x,mover[i].loc.y);
  }
}

