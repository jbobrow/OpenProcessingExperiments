
class Point3D {

  float x;
  float y;
  float z;
  boolean active = true;
  
  public Point3D(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public Point3D(Point3D other) {
    copy(other);
  }
  
  public void move(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void copy(Point3D other) {
    x = other.x;
    y = other.y;
    z = other.z;
    active = other.active;
  }
  
  public void minus(Point3D other) {
    x -= other.x;
    y -= other.y;
    z -= other.z;
  }
  
  public float length() {
    return dist(0,0,0,x,y,z);
  }
  
  public void normalise() {
    float d = 1 / length();
    x *= d;
    y *= d;
    z *= d;
  }

}

