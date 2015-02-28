
class Particle {
   PVector pos, dir;
   public Particle(float x, float y){
    pos=new PVector(x,y);
    dir=new PVector(0,0);
 
  }
  void zeichne(){
    point(pos.x,pos.y);
    dir.mult(0.95);
   // if (dir.x>0.001 || dir.y>0.001)
      pos.add(dir);
    //Outside?
    if (pos.x>=width) randpos();
    if (pos.y>height) randpos();
    if (pos.x<0) randpos();
    if (pos.y<0) randpos();
  }
  void randpos(){
    pos.x=random(width);
    pos.y=random(height);
    dir.x=0;
    dir.y=0;
  }
  void wind(PVector d, float strength){
    //d.mult(strength);
    PVector force=new PVector(pos.x,pos.y);
    force.sub(d);
    force.normalize();
    float st=d.dist(pos);
    force.mult(1/(st*st)*strength);
    dir.add(force);
  }
}

