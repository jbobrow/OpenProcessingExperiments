
//testing ToxiclibsSupport(:))
//echoechonoisenoise 2010

import toxi.processing.*;
import toxi.geom.mesh.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import toxi.geom.*;
import toxi.volume.*;

int DIM=100;//dimensions of the voxel space: 100x100x100 voxels
float ISO_THRESHOLD = 3;//higher values smoothen the result, lower uncover spherical characteristics of volumebrush
Vec3D SCALE=new Vec3D(1,1,1).scaleSelf(1000);//proportions and scale of voxel space

VolumetricSpace volume;
IsoSurface surface;
VolumetricBrush brush;
TriangleMesh mesh;
ToxiclibsSupport gfx;

PeasyCam cam;

ArrayList ptc;//particles list

float i=random(100);//position in noise space, randomized, so each time different form comes out
float sc=0.007;//step size while moving thru noise space
float brushDensity=1;
PVector l[];
float str;
int fCount=0;
int pAmount=500;

void setup() {
  size(700,700,P3D);
  cam = new PeasyCam(this,1300);
  gfx=new ToxiclibsSupport(this);
  volume=new VolumetricSpace(SCALE,DIM,DIM,DIM);
  surface=new IsoSurface(volume);
  brush=new RoundBrush(volume,10);
  initLight();

  ptc=new ArrayList();
  for(int i=0;i<pAmount;i++) {
    ptc.add(new Particle());
  }
  noStroke();
  fill(200,50,100);
}

void draw() {
  fCount++;
  background(35);
  for(int i=0; i<l.length; i++) {
    directionalLight(str,str,str, l[i].x,l[i].y,l[i].z);//all the lights
  }
  if(fCount<50) {//record 50 steps as a shape, each time updating the isosurface
    mesh=new TriangleMesh();
    volume.closeSides();  
    surface.reset();
    surface.computeSurfaceMesh(mesh,ISO_THRESHOLD);

    for(int i=0;i<ptc.size();i++) {
      Particle c=(Particle)ptc.get(i);
      c.behave();
      c.display();
    }
  }
  gfx.mesh(mesh,true);//draw nice, shaded mesh
}

void keyPressed() {//reset all the stuff, and create a new shape
  fCount=0;
  i=random(10);
  volume=new VolumetricSpace(SCALE,DIM,DIM,DIM);  
  surface=new IsoSurface(volume); 
  brush=new RoundBrush(volume,10);

  ptc=new ArrayList();
  for(int i=0;i<pAmount;i++) {
    ptc.add(new Particle());
  }
}

void initLight() {//by Marius Watz
  randomSeed(11);
  l=new PVector[7];
  for(int i=0; i<l.length; i++) {
    str=random(TWO_PI);
    l[i]=new PVector(cos(str)*10,0.3,sin(str)*10);
  }
  str=random(120,180);
}





