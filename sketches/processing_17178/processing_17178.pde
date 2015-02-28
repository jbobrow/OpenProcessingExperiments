
class Bird {
//class Bird2  
  // Properties
  float offsetX, offsetY, offsetZ;
float w, h;
  int bodyFill;
  int wingFill;
  float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
  float radiusX = 120, radiusY = 200, radiusZ = 700;
  float rotX = 15, rotY = 10, rotZ = 5;
  float flapSpeed = 0.04;
  float rotSpeed = 0.01;

  // Constructors
  Bird(){
    this(0, 0, 0, 60, 80);
  }
//Bird(){
//  this(0,0,0,70,90);
//}
   

  Bird(float offsetX, float offsetY, float offsetZ, 
  float w, float h){
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.offsetZ = offsetZ;
    this.h = 2*h;
    this.w = 2*w;
     float r1= random(255);
    float g1= random(255);
    float b1= random(255);
    float a1= random(255);
     float r2= random(255);
    float g2= random(255);
    float b2= random(255);
    float a2= random(255);
    
    //bodyFill = color(r1,g1,b1,255);
    //wingFill = color(r2,g2,b2,255);
    bodyFill = color(a1,a2);
    wingFill = color(a1,a2);
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
    px = tan(radians(ang3)) * radiusX;
    py = tan(radians(ang3)) * radiusY;
    pz = cos(radians(ang4)) * radiusZ;
    
    translate(width/2 + offsetX + px, height/2 + offsetY+py, -700 + offsetZ+pz);

    rotateX(tan(radians(ang2)) * rotX);
    rotateY(sin(radians(ang2)) * rotY);
    rotateZ(cos(radians(ang2)) * rotZ);

    // Body
   noStroke();
   
    fill(bodyFill);
    box(w/5, h, w/5);
    
   float ra2= random(255);
    float ga2= random(255);
    float ba2= random(255);
    float aa2= random(255);
//sphere(w/5);


    fill(wingFill);
    pushMatrix();
    rotateY(sin(radians(ang)) * 20);
  ellipse(w-11, h/2-39, 2*w, h);
    popMatrix();

    // Right wing
    pushMatrix();
    rotateY(sin(radians(ang)) * -20);
    ellipse(-w+11, -h/2+11, 2*w, h);
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
    ang4 += 0.55;
    popMatrix();
    stroke(ra2,ga2,ba2,aa2);
    // Left wing
 point(width/2 + offsetX + px, height/2 + offsetY+py, -700 + offsetZ+pz); 
ellipse(width/3 + offsetX + px, height/3 + offsetY+py, 2,2);   
  }
}




