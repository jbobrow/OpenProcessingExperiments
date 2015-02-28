
class particle {
 PVector loc;
 PVector finalLoc;
 PVector velocity;
 PVector accel;
 color col;
 color finalCol;
 public particle(float xloc, float yloc, float xvec, float yvec, color c) {
   loc = new PVector(xloc, yloc);
   velocity = new PVector(xvec, yvec);
   accel = new PVector(0,0);
   this.col = c;
   this.finalCol = c;
 }
 
 void setVelocity(float xV, float yV){
   velocity = new PVector(xV,yV);
 }
 
 void setFinalCol(color c){
   finalCol = c;
 }
 
 void setFinalLoc(float xDest,float yDest){
   finalLoc = new PVector(xDest,yDest);
 }
 
 void setAccel(float xA,float yA){
   accel = new PVector(xA,yA);
 }
 
 void multVelocity(float scalar){
   velocity.mult(scalar);
 }

 void disperse() {
   set(int(loc.x),int(loc.y),col);
   loc.add(velocity);
 }
 
 void transform(){
   set(int(loc.x),int(loc.y),col);
   loc.add(velocity);
   velocity.add(accel);
   
   accel.set( finalLoc.x-loc.x,finalLoc.y-loc.y,finalLoc.z-loc.z);
   float distance = dist(loc.x,loc.y,finalLoc.x,finalLoc.y);
   accel.normalize();
   accel.mult(distance * .01);
   accel.sub(velocity.x*.1,velocity.y*.1,velocity.z*.1);
   col = lerpColor(col,finalCol,.000001);
   
 }
}

