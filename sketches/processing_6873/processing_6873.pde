
class Camera
{
  PMatrix3D cam;

  public Camera()
  {
    cam = new PMatrix3D();
    cam.rotateY(HALF_PI);
  }

  public PVector facing(float a, float x, float y)
  {
    PMatrix3D face = cam.get();
    face.rotateZ(a);
    return face.mult(new PVector(x, y, 0), new PVector(0, 0, 0));
  }

  public void draw()
  {
    if(mouseY > 0) cam.rotateX(-(constrain(mouseY, 0, height) - height / 2.0) / height / 20);
    if(mouseX > 0) cam.rotateY(-(constrain(mouseX, 0, height) - width  / 2.0) / width  / 20);
    PVector x = cam.mult(new PVector(1, 0, 0), new PVector(0, 0, 0));
    PVector y = cam.mult(new PVector(0, 1, 0), new PVector(0, 0, 0));
    PVector d = x.cross(y); d.normalize(); d.mult(CAMERA_DISTANCE);
    camera(-d.x, -d.y, -d.z, d.x, d.y, d.z, y.x, y.y, y.z);
  }
}


