
class CustomVerletParticle extends VerletParticle{
  String particleType;
  CustomVerletParticle(float _x, float _y, float _z, String _particleType){
    super(_x, _y, _z);
    particleType = _particleType;
  }
  
  CustomVerletParticle(float _x, float _y, float _z, float _w, String _particleType){
    super(_x, _y, _z, _w);
    particleType = _particleType;
  }
  
  CustomVerletParticle(Vec3D _v, String _particleType){
    super(_v);
    particleType = _particleType;
  }
  
  CustomVerletParticle(Vec3D _v, float _w, String _particleType){
    super(_v,_w);
    particleType = _particleType;
  }
  
  CustomVerletParticle(VerletParticle _p, String _particleType){
    super(_p);
    particleType = _particleType;
  }
  
}

