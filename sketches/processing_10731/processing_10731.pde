
  class Ball {
  PVector pos, dir;
  float r;
  boolean isColliding;
  public Ball (float x, float y, float r){
    pos=new PVector(x,y);
    dir=new PVector(random(-2,2),random(-2,2));
    //dir=new PVector(2,2);
    this.r=r;
    isColliding=false;
  }
   
  void zeichne(){
    pos.add(dir);
    isColliding = collision();
    if (isColliding) {
      fill(255,0,0);
    } else {
      fill(255);
    }
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  
  boolean collision(){
    //Hintergrund-Kollision
    if (pos.x<r || pos.x>width-r)  {
      dir.x=-dir.x;
      return true;
    }
    if (pos.y<r || pos.y>height-r) {
      dir.y=-dir.y;
      return true;
    }
    for (int i=0;i<ANZ;i++){
      Ball b=(Ball)balls.get(i);
      if (b!=this) {//Andere
        if (pos.dist(b.pos)<=r+b.r) {//Kollision
          if (isColliding) return true;
          sc.playNote(70+r, 100, 0.3);
          PVector besch = PVector.sub(pos, b.pos);
          besch.normalize();
          float gesch = besch.dot(dir);
          besch.mult(-2.0f*gesch);
          dir.add(besch);
          return true;
        }
      }
    }
    return false;
  }
}

