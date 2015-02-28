
class IVMCoordinate {
  int a, b, c, d;
  IVMCoordinate (int _a, int _b, int _c, int _d) {
    a = _a;
    b = _b;
    c = _c;
    d = _d;
  }
  void move (int _a, int _b, int _c, int _d) {
    int[] p = {a+_a,b+_b,c+_c,d+_d};
    int k = min(p);
    a += _a - k;
    b += _b - k;
    c += _c - k;
    d += _d - k;
  }
  void plus (IVMCoordinate bob) {
    int[] p = {a+bob.a,b+bob.b,c+bob.c,d+bob.d};
    int k = min(p);
    a += bob.a - k;
    b += bob.b - k;
    c += bob.c - k;
    d += bob.d - k;
  }
  void minus (IVMCoordinate bob) {
    int[] p = {a-bob.a,b-bob.b,c-bob.c,d-bob.d};
    int k = min(p);
    a -= bob.a - k;
    b -= bob.b - k;
    c -= bob.c - k;
    d -= bob.d - k;
  }
  IVMCoordinate diff (IVMCoordinate bob) {
    IVMCoordinate jim = new IVMCoordinate(0,0,0,0);
    jim.plus(bob);
    jim.minus(this);
    return jim;
  }
  void render () {
    float _x = rad*cartFactor * float( a + b - c - d );
    float _y = rad*cartFactor * float( a - b + c - d );
    float _z = rad*cartFactor * float( a - b - c + d );
    stroke(255,0,0);
    strokeWeight( 1 );
    pushMatrix();
    translate( x(), y(), z() );
    point(0,0);
    popMatrix();
  }
  void renderSphere () {
    float _x = rad*cartFactor * float( a + b - c - d );
    float _y = rad*cartFactor * float( a - b + c - d );
    float _z = rad*cartFactor * float( a - b - c + d );
    stroke(255);
    strokeWeight( 5 );
    pushMatrix();
    translate( x(), y(), z() );
    noStroke();
    sphere(5);
    popMatrix();
  }
  String report() {
    return "["+a+","+b+","+c+","+d+"]";
  }
  float x() {
    return (rad*cartFactor * float( a + b - c - d ));
  }
  float y() {
    return (rad*cartFactor * float( a - b + c - d ));
  }
  float z() {
    return (rad*cartFactor * float( a - b - c + d ));
  }
  int sum() {
    return a+b+c+d;
  }
  int mx() {
    int[] p = {a,b,c,d};
    return max(p);
  }
  int mn() {
    int[] p = {a,b,c,d};
    int _m = this.mx();
    for(int z=0;z<p.length;z++) {
      if(p[z]<_m && p[z]>0) { _m=p[z]; }
    }
    return _m;
  }
  boolean eq(IVMCoordinate bob) {
    if(bob.a==a && bob.b==b && bob.c==c && bob.d==d) {
      return true;
    }
    return false;
  }
  float len() {
    return sqrt(((a * a + b * b + c * c + d * d) / 2) - (this.sum() * this.sum() / 8)) * 2;
  }
}

class IVMSystem {
  IVMCoordinate origin = new IVMCoordinate(0,0,0,0);
  Hashtable pts = new Hashtable();
  int pop = 0;
  IVMSystem (int f) {
      IVMCoordinate bob = new IVMCoordinate(0,0,0,0);
      pts.put("[0,0,0,0]", bob);
      this.populate(new IVMCoordinate(0,0,0,0),f);
  }
  boolean search(String k) {
    if(pts.containsKey(k)) {
      return true;
    }
    return false;
  }
  void populate(IVMCoordinate bob,int v) {
    for(int l=0;l<12;l++){
      IVMCoordinate p = new IVMCoordinate(0,0,0,0);
      p.plus(bob);
      p.plus(IVMVectors[l]);
      pts.put(p.report(),p);
      if(v>1) {
        this.populate(p,v-1);
      }
    }
  }
}

int freq = 5;
float rad = 20;
float cartFactor = sqrt(1.0/8.0);
IVMCoordinate[] IVMVectors;
IVMCoordinate eyes = new IVMCoordinate(0,0,0,0);
int xRot,yRot,zRot;
int xRotS = 0;
int yRotS = 0;
int zRotS = 0;
IVMCoordinate[] Axis;
IVMSystem universe;

void setup()
{
  size( 450, 400, P3D );
  Axis = new IVMCoordinate[4];
  Axis[0] = new IVMCoordinate(freq*2,0,0,0);
  Axis[1] = new IVMCoordinate(0,freq*2,0,0);
  Axis[2] = new IVMCoordinate(0,0,freq*2,0);
  Axis[3] = new IVMCoordinate(0,0,0,freq*2);
  IVMVectors = new IVMCoordinate[13];
  IVMVectors[0] = new IVMCoordinate(2,0,1,1);
  IVMVectors[1] = new IVMCoordinate(2,1,0,1);
  IVMVectors[2] = new IVMCoordinate(2,1,1,0);
  IVMVectors[3] = new IVMCoordinate(0,2,1,1);
  IVMVectors[4] = new IVMCoordinate(1,2,0,1);
  IVMVectors[5] = new IVMCoordinate(1,2,1,0);
  IVMVectors[6] = new IVMCoordinate(0,1,2,1);
  IVMVectors[7] = new IVMCoordinate(1,0,2,1);
  IVMVectors[8] = new IVMCoordinate(1,1,2,0);
  IVMVectors[9] = new IVMCoordinate(0,1,1,2);
  IVMVectors[10] = new IVMCoordinate(1,0,1,2);
  IVMVectors[11] = new IVMCoordinate(1,1,0,2);
  IVMVectors[12] = new IVMCoordinate(0,0,0,0);
  universe = new IVMSystem(freq);
  eyes.move(freq*3,0,freq*4,0);
  camera(eyes.x(), eyes.y(), eyes.z(), 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  background( 0 );
  stroke(255);
}
void draw()
{
  background(0,128);
  lights();
  beginCamera();
  resetMatrix();
  camera(eyes.x(), eyes.y(), eyes.z(), 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  endCamera();
  rotateX(float(xRot)/40);
  rotateY(float(yRot)/40);
  rotateZ(float(zRot)/40);
  xRot += xRotS;
  yRot += yRotS;
  zRot += zRotS;
  stroke( 128, 128, 255, 128);
  strokeWeight( 1 );
  for(int _a=0;_a<Axis.length;_a++) {
    line( 0, 0, 0, Axis[_a].x(), Axis[_a].y(), Axis[_a].z() );
    for(int _b=0;_b<Axis.length;_b++) {
    }
  }     
  for (Enumeration u = universe.pts.elements() ; u.hasMoreElements() ;) {
  IVMCoordinate p1 = new IVMCoordinate(0,0,0,0);
  p1.plus((IVMCoordinate) u.nextElement());
    for(int i=0;i<12;i++) {
      IVMCoordinate p2 = new IVMCoordinate(0,0,0,0);
      p2.plus(p1);
      p2.plus(IVMVectors[i]);
      if(universe.search(p2.report())) {
        stroke( 255, 64 );
        strokeWeight( 1 );
        line(p1.x(),p1.y(),p1.z(),p2.x(),p2.y(),p2.z());
      }
    }
  }
  stroke(0,255,0);
  textMode(SCREEN);
  text("IVMSimulation v0.3",8,10);
  text(freq+"v Isotropic Vector Matrix",width-150,10);
  text(universe.pts.size()+" points",width-100,22);
  text("camera at "+eyes.report(),8,22);
  text("x rot speed (rad) = "+xRotS,8,34);
  text("y rot speed (rad) = "+yRotS,8,46);
  text("CONTROLS:",8,height-48);
  text("Move camera: a, b, c, d",8,height-30);
  text("Rotate X: up arrow, down arrow",8,height-18);
  text("Rotate Y: left arrow, right arrow",8,height-6);
  text(nf(frameRate,2,3)+"fps",width-100,height-6);
}

void keyPressed()
{
  if (key == 'a') {
    eyes.move(1,0,0,0);
  }
  if (key == 'b') {
    eyes.move(0,1,0,0);
  }
  if (key == 'c') {
    eyes.move(0,0,1,0);
  }
  if (key == 'd') {
    eyes.move(0,0,0,1);
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      yRotS -= 1;
      if(yRotS<-5) { yRotS = -5; }
    }
    if (keyCode == UP) {
      xRotS += 1;
      if(xRotS>5) { xRotS = 5; }
    }
    if (keyCode == RIGHT) {
      yRotS += 1;
      if(yRotS>5) { yRotS = 5; }
    }
    if (keyCode == DOWN) {
      xRotS -= 1;
      if(xRotS<-5) { xRotS = -5; }
    }
  }
}


