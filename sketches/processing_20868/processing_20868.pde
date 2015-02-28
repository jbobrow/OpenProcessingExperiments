
//RAY TRIANGLE INTERSECTION 
// BY JOSE SANCHEZ
// REF: http://www.cs.princeton.edu/courses/archive/fall00/cs426/lectures/raycast/sld018.htm
// http://paulbourke.net/geometry/planeline/


import toxi.geom.*;
import toxi.geom.mesh.*;
import peasy.*;
import toxi.processing.*;

PeasyCam cam;

Ray jRay;

//Vec3D a = new Vec3D (0,0,-100);
//Vec3D b = new Vec3D (0,100,80);
//Vec3D c = new Vec3D (0,-100,40);

Vec3D base = new Vec3D(300,0,50);
Vec3D rayDir = new Vec3D(-1,0,-0.1);
float rayLength = 2000;


TriangleMesh mesh;
ToxiclibsSupport gfx;


void setup() {
  size(800,600,P3D);
  cam = new PeasyCam(this, 100);

  gfx = new ToxiclibsSupport(this);

  //CALL INTERSECTION CLASS
  jRay = new Ray(base, rayDir, rayLength);

  mesh = new TriangleMesh();


  //BUILD A CILINDER:
  buildMesh( 30, 10, 40, 400);
}


void draw() {
  background(0);

  noFill();
  stroke(255);
  strokeWeight(1);
  //box(300);

  fill(100,50);
  //rect(-150,-150,300,300);

  gfx.mesh(mesh,false);


  jRay.run();  
  
  jRay.intersectMesh(mesh);
  //jRay.intersectFace(a,b,c);



  if(keyPressed) {
    saveFrame("im-####.png");
  }
}

void buildMesh(int cols, int rows, float zScale, float rad) {

  for(int i = 0; i < cols; i ++) {
    for(int j = 0; j < rows; j++) {

      float angle1 = radians(360/(float(cols)) * i);
      float angle2 = radians(360/(float(cols)) * (i+1));


      Vec3D a = new Vec3D(cos(angle1) * rad, sin(angle1)* rad, j*zScale);
      Vec3D b = new Vec3D(cos(angle2) * rad, sin(angle2)* rad, j*zScale);
      Vec3D c = new Vec3D(cos(angle2) * rad, sin(angle2)* rad, (j+1)*zScale);
      Vec3D d = new Vec3D(cos(angle1) * rad, sin(angle1)* rad, (j+1)*zScale);

      mesh.addFace(a,b,c);
      mesh.addFace(c,d,a);
    }
  }
}




