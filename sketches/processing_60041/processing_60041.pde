
class Camera {
  PVector eye, lookAt, up;
  private float fov = PI/3;
  float cameraZ;
  float near = 1000;
  float far = 1000;

  Camera(PVector eye, PVector lookAt, float fov) {
    this.eye = eye;
    this.lookAt = lookAt;
    setFov(fov);
  }
  
  Camera(){
    this(new PVector(0, 0, 0), new PVector(0, 0, -1), PI/3);
  }
  
  void print(){
    println("-- CAMERA ---------------");
    println("eye: ");
    println("x = " + eye.x);
    println("y = " + eye.y);
    println("z = " + eye.z);    
    println("");
    println("lookAt: ");
    println("x = " + lookAt.x);
    println("y = " + lookAt.y);
    println("z = " + lookAt.z);    
  }

  void setFov(float fov) {
    this.fov = fov;
    cameraZ = (height/2.0) / tan(fov/2.0);
  }
  
  void setPos(float x, float y, float z){
    setPos(new PVector(x,y,z));
  }
  
  void setPos(PVector p){
    PVector d = PVector.sub(lookAt, eye);
    eye = p.get();
    lookAt = p.get();
    lookAt.add(d);
  }
  
  void translate(PVector t) {
    eye.add(t);
    lookAt.add(t);
  }

  void translate(float x, float y, float z) {
    translate(new PVector(x, y, z));
  }

  void apply() {
    perspective(fov, float(width)/float(height), cameraZ/near, cameraZ*far);
    camera(eye.x, eye.y, eye.z, lookAt.x, lookAt.y, lookAt.z, 0, 1, 0);
  }

  void affiche() {
    sphereDetail(10);

    //eye
    g.pushMatrix();
    g.translate(eye.x, eye.y, eye.z);
    noStroke();
    fill(0);
    sphere(10);
    g.popMatrix();

    //lookAt
    g.pushMatrix();
    g.translate(lookAt.x, lookAt.y, lookAt.z);
    noStroke();
    fill(0);
    sphere(5);
    g.popMatrix();
    
    stroke(0);
    line(eye.x, eye.y, eye.z, lookAt.x, lookAt.y, lookAt.z);
  }
}

