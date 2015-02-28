
class Part 
{
  PVector l; 
  PVector v; 
  PVector a; 
  float m; 
  float RMIN;
  float RMAX;
  int cl = 0;
  
  Part(PVector l,PVector v,PVector a, float m)
  {
    this.l = l;
    this.v = v;
    this.a = a;
    this.m = m;
  }
  
  void live()
  {
    update();
  }
  
  void update()
  {
  v.add(a);
  l.add(v);
  a.x = 0.0f; 
  a.y = 0.0f; 
  
  // disegna
  float col = map(m, 1, 10, 1, 360);
  stroke(col, 100, 100, 10);
  //print(col+" ");
  point(l.x, l.y);  
  }
  
  boolean pop() { 
    if (((l.x > width-0) || (l.x < 0)) || ((l.y > height-0) || (l.y < 0))){ 
      return true;
    }
    else return false;   
  }  
  
  void setLoc(PVector v) {
    l = v;
  }

  void setVel(PVector v) {
    v = v;
  }

  void setAcc(PVector v) {
    a = v;
  }
  
  void add_force(PVector force) {
    force.div(m);  
    a.add(force); 
  } 
  
  PVector getVel() { 
    return v; 
  } 
 
  PVector getAcc() { 
    return a; 
  } 
 
  PVector getLoc() { 
    return l; 
  } 
}  


