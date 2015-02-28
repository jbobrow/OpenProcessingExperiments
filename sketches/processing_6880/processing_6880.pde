
class Camera{
  float x,y,z,tx,ty,tz,vx,vy,vz;
  float speed = .0002;
  float damping = .01;
  Camera(float $x,float $y,float $z){
    tx = x = $x; ty = y = $y; tz = z = $z;
    vx = vy = vz = 0;
  }
  void target(float $tx,float $ty,float $tz){
    tx = $tx; ty = $ty; tz = $tz;
  }
  void step(){
    vx += (tx-x)*speed;
    vy += (ty-y)*speed;
    vz += (tz-z)*speed;
    vx *= 1-damping;
    vy *= 1-damping;
    vz *= 1-damping;
    x += vx;
    y += vy;
    z += vz;
    pg.translate(x,y,z);
  }
}

