
/**
 * <p>This demo shows how to filter a mesh using VertexSelectors and
 * manipulate the resulting vertex selections using boolean set operations.
 * The selector implementation used is selecting vertices on a given side
 * of cut plane (here all vertices in front). The example is using two of
 * such selectors whose results are merged and the final selection removed
 * from the mesh. Both the resulting mesh and cut planes are visualized.</p>
 *
 * <p>Furthermore, the example mesh itself is generated using subdivision
 * modelling, starting from a simple cube.</p>
 *
 * <p>This demo makes use of upcoming features of the toxiclibs-0020 release</p>.
 *
 * @author toxi
 */
 
import toxi.processing.*;

import toxi.geom.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;

ToxiclibsSupport gfx;
WETriangleMesh mesh;

void setup() {
  size(680,382, P3D);
  gfx = new ToxiclibsSupport(this);
  mesh = (WETriangleMesh) new AABB(100).toMesh(new WETriangleMesh());
  MidpointSubdivision sd = new MidpointSubdivision();
  mesh.subdivide(sd, 0);
  mesh.subdivide(sd, 0);
  mesh.subdivide(sd, 0);
  MidpointDisplacementSubdivision sd2 = new MidpointDisplacementSubdivision(new Vec3D(),-0.5f);
  mesh.subdivide(sd2, 0);
}

public void draw() {
  background(0);
  lights();
  translate(width / 2, height / 2, 0);
  rotateX((height / 2 - mouseY) * 0.01f);
  rotateY((width / 2 - mouseX) * 0.01f);
  gfx.origin(300);
  noStroke();
  WETriangleMesh filteredMesh = new WETriangleMesh().addMesh(mesh);
  PlaneSelector sel = new PlaneSelector(filteredMesh, new Plane(new Vec3D(), new Vec3D(0, 1, 0).rotateX(frameCount * 0.02f)), 0, Plane.Classifier.PLANE_FRONT);
  PlaneSelector sel2 = new PlaneSelector(filteredMesh, new Plane(new Vec3D(), new Vec3D(1, 1, 0).rotateX(frameCount * 0.04f + HALF_PI)), 0, Plane.Classifier.PLANE_FRONT);
  sel.selectVertices();
  sel2.selectVertices();
  sel.addSelection(sel2.getSelection());
  filteredMesh.removeVertices(sel.getSelection());
  fill(0, 255, 255);
  gfx.mesh(filteredMesh, false);
  fill(255,0,255);
  gfx.plane(sel.plane,300);
  fill(255,255,0);
  gfx.plane(sel2.plane,300);
}


