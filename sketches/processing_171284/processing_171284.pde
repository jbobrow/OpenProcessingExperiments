
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
 
ToxiclibsSupport gfx;
float socketLength = 30;
float socketRadius = 6;
float rodRadius = 5;
float pointRadius = 10.0;
int resolution = 10;
 
WETriangleMesh[] meshes;
 
void setup() {
  size(512, 512, P3D);
  gfx = new ToxiclibsSupport(this);
 
  Sphere s = new Sphere(new Vec3D(0.0, 0.0, 0.0), 200);
  WETriangleMesh sphereMesh = new WETriangleMesh();
  s.toMesh(sphereMesh, resolution);
 
  meshes = convertMeshToRodSockets(sphereMesh);
}
 
 
WETriangleMesh[] convertMeshToRodSockets(WETriangleMesh inMesh) {
  WETriangleMesh[] meshes = new WETriangleMesh[3];
 
  meshes[0] = new WETriangleMesh();
  meshes[1] = new WETriangleMesh();
  meshes[2] = new WETriangleMesh();
  
  for(Vertex vert: inMesh.getVertices()){
    //Sphere points
    Sphere sphere = new Sphere(vert, pointRadius);
    WETriangleMesh sphereMesh = new WETriangleMesh();
    sphere.toMesh(sphereMesh, resolution);
    meshes[2].addMesh((WETriangleMesh)sphereMesh);
  }
 
  for (WingedEdge edge : inMesh.edges.values ()) {
    Vec3D pointA = edge.a;
    Vec3D pointB = edge.b;
 
    //Meshes to store socket shapes
    ZAxisCylinder socket;
    ZAxisCylinder rod;
    WETriangleMesh socketAMesh = new WETriangleMesh();
    WETriangleMesh socketBMesh = new WETriangleMesh();
    WETriangleMesh rodMesh = new WETriangleMesh();
 
    float distanceBetweenPoints = pointA.distanceTo(pointB);
 
    //Create sockets and point towards target
    socket = new ZAxisCylinder(new Vec3D(0.0, 0.0, 0.0), socketRadius, socketLength);
    socket.toMesh(socketAMesh, resolution, 0.0);
    socketAMesh.pointTowards(pointB.sub(pointA));
 
    //Translate socket to start from the center of the point
    socketAMesh.translate( offsetTranslation(pointA, pointB, socketLength ));
 
    //Create second socket and look in the opposite direction to face the start point
    socket.toMesh(socketBMesh, resolution, 0.0);
    socketBMesh.pointTowards(pointA.sub(pointB));
    socketBMesh.translate( offsetTranslation(pointB, pointA, socketLength ));
 
    //Create rod with a length matching the distance between the two points
    rod = new ZAxisCylinder(new Vec3D(0.0, 0.0, 0.0), rodRadius, distanceBetweenPoints);
    rod.toMesh(rodMesh, resolution, 0.0);
    rodMesh.pointTowards(pointB.sub(pointA));
 
    //Translate the rod to the midpoint of both points
    rodMesh.translate(pointA.add(pointB).scale(0.5));
 
    //Combine meshes together
    meshes[0].addMesh((WETriangleMesh)rodMesh);
    meshes[1].addMesh((WETriangleMesh)socketAMesh);
    meshes[1].addMesh((WETriangleMesh)socketBMesh);
  }
 
  return meshes;
}
 
 
//Function to return a vector that is slightly offset by a length.
Vec3D offsetTranslation(Vec3D a, Vec3D b, float l) {
  return a.interpolateTo(b, (l*0.5 / a.distanceTo(b)) );
}
 
void draw() {
  background(50);
  translate(width/2, height/2, 0);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.01);
 
  if (meshes != null) {
    noStroke();
    stroke(color(20));
    fill(127, 127, 127);
    gfx.mesh(meshes[0]);
 
    fill(127, 255, 255);
    gfx.mesh(meshes[1]);
 
    fill(255, 200, 127);
    gfx.mesh(meshes[2]);
  }
}

