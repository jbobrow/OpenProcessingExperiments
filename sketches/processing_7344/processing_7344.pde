
class GenParticle extends Particle {
  float originX, originY, originZ;
  float friction = .99;

  GenParticle(int xIn, int yIn, int zIn, float vxIn, float vyIn, float vzIn, float r, float ox, float oy, float oz){
    super(xIn, yIn, zIn, vxIn, vyIn, vzIn, r);
    originX =ox;
    originY = oy;
    originZ = oz;
  }

  void regenerate(){
    if((x>width+radius) || (x<-radius) || (y>height+radius) || (y<-radius))
    {
      x=originX;
      y=originY;
      z=originZ;
      vx=random(-1.0,1.0);
      vy=random(-4.0,-2.0);
      vz=random(-4.0,4.0);
    }
  }
  void ground(){
  
    
    if(y>height-radius){
      vy=-vy;
      y=constrain(y, -height*height, height-radius);
    }
   if((x<radius)||(x>width-radius)){
     vx=-vx;
     x=constrain(x,radius,width-radius);
   }
  }
  void keyPressed(){
    float targetX=mouseX;
    float targetY=mouseY;
    float targetZ=mouseX;
    
   if(key=='h'){
   x=x+(targetX-x)*.5;
   y=y+(targetY-y)*.5;
   z=z+(targetZ-z)*.5;
   gravity=0.0;
   }
  
   if(key=='j'){
   gravity=.5;
   vy=vy+gravity;
   vy*=friction;
   y+=vy;
   x+=vx;
   z+=vz;
   }
  }
   
   
}






