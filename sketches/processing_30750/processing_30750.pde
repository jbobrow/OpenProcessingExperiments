
class CustomVerletParticle extends VerletParticle{
  String particleType;
  
  CustomVerletParticle(float _x, float _y, float _z,String _particleType){
    super(_x,_y,_z);
    particleType = _particleType;
  }
  
  CustomVerletParticle(float _x, float _y, float _z,float _w,String _particleType){
    super(_x,_y,_z,_w);
    particleType = _particleType;
  }
}

