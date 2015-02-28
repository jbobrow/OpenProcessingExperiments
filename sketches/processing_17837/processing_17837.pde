
class Vec3D extends PVector { 

  public Vec3D() {
    super(0,0,0);  
  }

  public Vec3D(float x, float y, float z) {
    super(x,y,z);
  }

  public Vec3D(PVector old) {
    super(old.x, old.y, old.z);
  }

  public Vec3D cross(Vec3D p) {
    Vec3D r = new Vec3D(super.cross(p));
    return r;
  }


  public Vec3D normalized() {
    float mag = (float) Math.sqrt(x * x + y * y + z * z);
    if (mag > 0) {
      mag = 1f / mag;
      x *= mag;
      y *= mag;
      z *= mag;
    }
    return this;
  }
  
}







