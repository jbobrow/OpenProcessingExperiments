
//aLittleBitMore
//echoechonoisenoise 2010
//echo.link: this-yourWork-this

import toxi.processing.*;
import toxi.geom.mesh.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import processing.dxf.*;

boolean record = false;
boolean animate=true;
WETriangleMesh mesh;
int DIM=45;//dimensions of the voxel space: 45x45x45 voxels
float ISO_THRESHOLD = 3;//higher values smoothen the result, lower uncover spherical characteristics of volumebrush
Vec3D SCALE=new Vec3D(1,1,1).scaleSelf(1000);//proportions and scale of voxel space
VolumetricSpace volume=new VolumetricSpaceArray(SCALE,DIM,DIM,DIM);
;
IsoSurface surface;
VolumetricBrush brush;
float brushDensity=10;

ArrayList ptc;//particles list
int pAmount=300;
ArrayList panels;//panels list
float i=random(100);//position in noise space, randomized, so each time different form comes out
float sc=0.008;

PVector l[];//lights stored as vectors
float str;
int fcount=0;
float atick=0;


PeasyCam cam;

void setup() {
  size(700,700,P3D);    
  stroke(0);
  strokeWeight(2.5);
  cam = new PeasyCam(this,450);
  cam.rotateX(PI*0.3);
  cam.rotateZ(PI*0.3);
  initLight();


  surface=new HashIsoSurface(volume);
  brush=new RoundBrush(volume,10);
  ptc=new ArrayList();
  for(int i=0;i<pAmount;i++) {
    ptc.add(new Particle());
  }
  panels=new ArrayList();
}

void draw() {
  background(35);
  for(int i=0; i<l.length; i++) {
    directionalLight(str,str,str, l[i].x,l[i].y,l[i].z);//all the lights
  }
  if (record == true) {
    beginRaw(DXF, "shapes/shape-####.dxf");
  }
  if(fcount<=30) {//record 30 steps as a shape, each time updating the isosurface
    volume.closeSides();  
    surface.reset();
    mesh = new WETriangleMesh();
    surface.computeSurfaceMesh(mesh,ISO_THRESHOLD);
    new LaplacianSmooth().filter(mesh, 1);
    for(int i=0;i<ptc.size();i++) {
      Particle c=(Particle)ptc.get(i);
      c.behave();//move particle around
      c.display();//draw it's trace using volumetric brush
    }
    panels.clear();
    int num=mesh.getNumFaces(); 
    Vec3D[] verts=null;
    for(int i=0; i<num; i++) {
      Face f=mesh.faces.get(i);
      PVector a=new PVector(f.a.x,f.a.y,f.a.z);
      PVector b=new PVector(f.b.x,f.b.y,f.b.z);
      PVector c=new PVector(f.c.x,f.c.y,f.c.z);
      panels.add(new TriangularPanel(a,b,c));
    }
  }
  for(int i=0;i<panels.size();i++) {
    TriangularPanel p=(TriangularPanel) panels.get(i);
    if(animate)p.construct();
    p.display();
  }
  if (record == true) {
    endRaw();
    record = false; // Stop recording to the file
  }
  fcount++;
  if(animate)atick+=0.01;
}

void keyPressed() {
  if(key=='a') {//move panels, change colors
    animate=!animate;
  }
  if(key==' ') {//reset all the stuff, and create a new shape
    fcount=0;
    atick=0;
    i=random(100);
    volume=new VolumetricSpaceArray(SCALE,DIM,DIM,DIM);  
    surface=new HashIsoSurface(volume); 
    brush=new RoundBrush(volume,10);
    ptc=new ArrayList();
    for(int i=0;i<pAmount;i++) {
      ptc.add(new Particle());
    }
  }
  if(key=='l') {//save to dxf
    new LaplacianSmooth().filter(mesh, 1);
    panels.clear();
    int num=mesh.getNumFaces(); 
    Vec3D[] verts=null;
    for(int i=0; i<num; i++) {
      Face f=mesh.faces.get(i);
      PVector a=new PVector(f.a.x,f.a.y,f.a.z);
      PVector b=new PVector(f.b.x,f.b.y,f.b.z);
      PVector c=new PVector(f.c.x,f.c.y,f.c.z);
      panels.add(new TriangularPanel(a,b,c));
    }
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



