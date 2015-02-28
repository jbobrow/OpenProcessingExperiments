
class Particle {
  float mass;
  float x,y,z,xv,yv,zv;
  float xf,yf,zf,xa,ya,za=0;
  float[] tx=new float[trails];
  float[] ty=new float[trails];
  float[] tz=new float[trails];
  Particle(float m, float inx, float iny, float inz, float inxv, float inyv, float inzv) {
    mass = m;
    x=inx; y=iny; z=inz;
    xv=inxv; yv=inyv; zv=inzv;
  }
}


