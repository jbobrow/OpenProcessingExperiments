
class MeshParticle{
  int _x, _y, _s, _ox, _oy, _t, _op;
  boolean _m;
  color _c;
  int d;
  MeshParticle (int xp, int yp, int s, boolean m, int timeout){
    _x = xp; // starting point X
    _y = yp; // starting point Y
    _s = s;
    _m = m;
    _c = color(random(255));
    _ox = _x;
    _oy = _y;
    if (int(random(2)) == 0){
      d = _x * -1;
    }else d = _x;
    _t = timeout+1;
    _op = 150;
  }
  void setup(){
  }
  void draw(){
    pushMatrix();
    translate(_ox, _oy);
    
    shapeMode(CORNER);
    noStroke();
    fill(_c, _op);
    
    triangle(0, 0, _x-_x, _x, d, _x);
    popMatrix();
  }
  void update(){
 //  _x = int(sin(radians(frameCount))*_x);
  //  d = int(sin(radians(frameCount))*_x);
  _c--;
  }
}


