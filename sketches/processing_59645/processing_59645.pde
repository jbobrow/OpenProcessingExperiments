
class ellipses{
  PVector pos; //position
  PVector vel; //velocity,how the position change all the time 
  color c; //colour
  float s; //size
  int id;
  
  ellipses (PVector _pos, color _c,float _s, int _id ){ //constructor--makes a new object
    pos = _pos; //take the incoming info and store it
    c = _c;
    s = _s;
    id = _id;
    vel = new PVector(random(-1,1),random(-1,1));
  }
  
  void move() {
    pos.x = pos.x + vel.x;
    pos.y = pos.y + vel.y;
    if (pos.x+s/2>width || pos.x-s/2 < 0) {
      vel.x = -vel.x;
    }
    if (pos.y+s/2>height-100 || pos.y-s/2 < 0) {
      vel.y = -vel.y;
    }
  }
 
 
 

}

