
class Bird {
  
  // Properties
  float offsetX, offsetY, offsetZ, timeOffset;
  float w, h;
  int bodyFill;
  int wingFill;
  float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
  float radiusX = 800, radiusY = 600, radiusZ = 100;
  float rotX = 15, rotY = 10, rotZ = 5;
  float flapSpeed = 100;
  float rotSpeed = 0.1;

  // Constructors
  Bird(){
    this(0, 0, 0, 60, 80, 0);
  }

  Bird(float offsetX, float offsetY, float offsetZ, 
  float w, float h, float timeOffset){
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.offsetZ = offsetZ;
    this.timeOffset = timeOffset;
    this.h = h;
    this.w = w;
    bodyFill = color(#004411);
    wingFill = color(#002206);
  }

  void setFlight(float radiusX, float radiusY, float radiusZ, 
    float rotX, float rotY, float rotZ){
    this.radiusX = radiusX;
    this.radiusY = radiusY;
    this.radiusZ = radiusZ;

    this.rotX = rotX;
    this.rotY = rotY;
    this.rotZ = rotZ;
  }

  void setWingSpeed(float flapSpeed){
    this.flapSpeed = flapSpeed;
  }

  void setRotSpeed(float rotSpeed){
    this.rotSpeed = rotSpeed;
  }

  void fly() {
    pushMatrix();
    float px, py, pz;
    
    // Flight
    px = sin(radians(ang3)) * radiusX;
    py = cos(radians(ang3)) * radiusY;
    pz = 800 + tan(radians(ang4+timeOffset)) * radiusZ / 4;
    
    translate(width/2 + offsetX + px, height/2 + offsetY+py, -700 + offsetZ+pz);

    rotateX(sin(radians(ang2)) * rotX);
    rotateY(sin(radians(ang2)) * rotY);
    rotateZ(sin(radians(ang2)) * rotZ);

    // Body
    fill(bodyFill);
    //rect(0, w/5, h, w/5);
    box(w/5, h, w/5);

   // Left wing
    fill(wingFill);
   /* pushMatrix();
    rotateY(sin(radians(ang)) * 20);
    //rect(0, -h/2, w, h);
    //ellipse(0, -h/2, w, h);
    
    popMatrix();*/

    // Right wing
    pushMatrix();
    rotateY(sin(radians(ang)) * -20);
    ellipse(-w, (30-h)/2, w, h);
    //rect(-w, -h/2, w, h);
    popMatrix();

    // Wing flap
    ang += flapSpeed;
    if (ang > 3) {
      flapSpeed*=-1;
    } 
    if (ang < -3) {
      flapSpeed*=-1;
    }

    // Ang's run trig functions
    ang2 += rotSpeed;
    ang3 += 1.25;
    ang4 += 1;
    popMatrix();
  }
}




