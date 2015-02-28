
class PVector2 extends PVector
{
  PVector2() { 
    super();
  }
  PVector2(float a, float b, float c)
  { 
    super(a, b, c); 
  };

  void apply(PMatrix3D mat) {
    PVector2 cp = new PVector2(this.x, this.y, this.z);
    this.x = mat.m00 * cp.x + mat.m01 * cp.y + mat.m02 * cp.z + mat.m03;
    this.y = mat.m10 * cp.x + mat.m11 * cp.y + mat.m12 * cp.z + mat.m13;
    this.z = mat.m20 * cp.x + mat.m21 * cp.y + mat.m22 * cp.z + mat.m23 ; //? 
    float t = mat.m30 * cp.x + mat.m31 * cp.y + mat.m32 * cp.z + mat.m33;
      //println(this.x + " " + this.y);
    this.x /= t;
    this.y /= t;
    this.z /= t;
    // mat.print();
  }
}

