
class Characters {
  
  float x,y,railz;
  float ang;
  float rad;
  float speed;
  char keynum;
  
  Characters(float _ang, float _rad, float _speed, char _keynum, float _railz) {
    ang=_ang;
    rad=_rad;
    speed=_speed;
    keynum=_keynum;
    x=0;y=0;railz=_railz;
  }
  
  void update() {
    x=sin(radians(ang))*rad;
    y=cos(radians(ang))*rad;
    ang+=speed;
  }
  
  void display() {
    fill(255,200);
    text(keynum , x,y,railz);
  }
}

