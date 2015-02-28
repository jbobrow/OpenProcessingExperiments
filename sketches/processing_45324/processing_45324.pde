
class GenParticle extends Particle{
  float originX,originY;
  GenParticle(int xIn, int yIn, float vxIn, float vyIn,
  float r, float ox, float oy){
    super(xIn, yIn, vxIn, vyIn, r);
    originX=ox;
    originY=oy;
  }
  void regenerate(){
    if(( x> width+radius)||(x< -radius)||
    (y> height+radius)||(y< -radius)){
      x= originX;
      y= originY;
      vx=random(-2.0,2.0);
      vy= random(random(-10,-1),-20.0);
    }
  }
}
  

