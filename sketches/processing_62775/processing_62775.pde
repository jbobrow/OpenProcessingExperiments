
import toxi.processing.*;
import toxi.geom.mesh.*;
import toxi.geom.*;
import toxi.volume.*;
import codeanticode.glgraphics.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import javax.media.opengl.*;

/////////////////////////////////////////

int num = 2000;
float RADIUS = 90;
float SCALE = 100.0f;
int GlobalTime;
float x, y, z, lx, ly, lz, xx, yy, zz;
int globKonexID = 0;
PeasyCam cam;
int DIM=50;//dimensions of the voxel space: 100x100x100 voxels
float ISO_THRESHOLD = 0.03;//higher values smoothen the result, lower uncover spherical characteristics of volumebrush
Vec3D scl=new Vec3D(1, 1, 1).scaleSelf(1);

VolumetricSpaceArray volume;
ArrayIsoSurface surface;
VolumetricBrush brush;
WETriangleMesh mesh;
ToxiclibsSupport gfx;

List <Neuron> n=new ArrayList<Neuron>();
List <Signal> sig=new ArrayList<Signal>();
List <Konexe> k=new ArrayList<Konexe>();
///////////////////////////////////////////
//////////////////////////////////////////
public void setup() {
  size(1280, 720, P3D);
  GlobalTime = 0;
  cam = new PeasyCam(this, -500, -700, 0, 520);
  cam.setLeftDragHandler(cam.getPanDragHandler());
  cam.setRightDragHandler(cam.getRotateDragHandler());
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(+140000);
  
  volume = new VolumetricSpaceArray(scl, DIM, DIM, DIM);
  gfx=new ToxiclibsSupport(this);
  surface = new ArrayIsoSurface( volume );
  brush=new RoundBrush(volume, 10);
  mesh = new WETriangleMesh();
  volume.closeSides();
  surface.computeSurfaceMesh(mesh, 0.1);
  
  initNeurons();
  
  noSmooth();
  stroke(0, 5);
  
  Neuron cn=(Neuron)n.get(0);
  for (int i = 0;i<cn.k.size();i++) {
    cn.makeSignal(i);
  }

  for (int i=0;i<sig.size();i++) {
    sig.get(i);
    if (sig.size() >10) {
      sig.remove(i);
    }
  }
}
///////////////////////////////////////////
//////////////////////////////////////////
public void draw() {
  background(0);
  GlobalTime++;
  for (Neuron cn:n) {
    cn.draw();
  }
}


///////////////////////////////////////////
///////////////////////////////////////////
void keyPressed() {
  if (keyCode == 's') {
    println("PRINTED");
    mesh.saveAsSTL(sketchPath("shape"+frameCount+".stl"));
  }
}


