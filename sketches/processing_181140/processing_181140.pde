
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/6753*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

import peasy.*;
import toxi.geom.*;
import java.util.*;

Vec3D globalOffset, avg, cameraCenter, camPosVec;
public Vec3D destiny;
public float neighborhood, destinationAttraction, viscosity, speed, turbulence, cameraRate, rebirthRadius, spread, independence, dofRatio;
public int n, rebirth;
public boolean averageRebirth, paused;

Vector particles;

Plane focalPlane;

float pointSize=2;
float strength=1.0;
float iscale = 1.0;
float pratio = 0.95;


boolean tosave = false;
int saveAfter = 200;    // starting frame
int saveUpTo = 4000;     // ending frame
String fn = "DNAseq1";  // folder name

import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

//WB_Render render;
HEC_Sphere crSphere=new HEC_Sphere();
HEC_Cylinder crCylinder=new HEC_Cylinder();
HE_Mesh tmesh = new HE_Mesh();

ArrayList<HE_Mesh> meshes;
ArrayList<Vec3D>  DNA;
ArrayList<Vec3D>  img;
IntList  col;

PGraphics pg;
PImage pic;    // for holding jpegs
String url = "/Users/Andrew/Documents/Processing/images/";

PeasyCam cam;

float distanceAvgToCamera;

float caa=0;
boolean form = false;

boolean lines = false;
boolean diff = false;
float transition=1;   // the proportion of the transforming force that is applied
int duration=2, frameStart=0, diffFrame=0, diffStep = 0;

color TEXT_COLOR = color(0);
int BACK_COLOR = #000000;
PFont ptext;

// DNA creation variables
int xx, yy, zz;
float astep=0.09;       // 0.07
int zstep=10;           // 10
float helixR = 110;     // 100
int helixL = 400;       // 400
float aa=0;
float xc, yc, zc;

boolean debug=true;
float debugv=0;



void setup() {
  size(1280, 768, P3D);
  colorMode(HSB, 255);
  cam = new PeasyCam(this, 400);
  cam.rotateY(PI/2);
  cam.lookAt(0, 0, 0);

  setParameters();

  ptext=createFont("ArialMT", 180);
  cameraCenter = new Vec3D();
  avg = new Vec3D();
  globalOffset = new Vec3D(0, 1. / 3, 2. / 3);

  // create virtual representation of DNA helix using HE_Mesh

  meshes = new ArrayList<HE_Mesh>();

  crSphere.setUFacets(12).setVFacets(12);
  crCylinder.setFacets(20).setSteps(60);

  println("creating helix meshes");
  int ll=0;
  int hue1=200, hue2=100;
  aa=0;
  for (zz = -helixL; zz < helixL; zz+=zstep) {
    crSphere.setRadius(20);
    crSphere.setCenter(-helixR*cos(aa), -helixR*sin(aa), zz);
    tmesh = new HE_Mesh(crSphere);
    meshes.add(tmesh);

    HE_Mesh mesh = meshes.get(meshes.size()-1);

    HE_VertexIterator vitr=new HE_VertexIterator(mesh);

    while (vitr.hasNext ()) {
      HE_Vertex vert = vitr.next().get();
      vert.setColor(color(hue1, 255, 255));
      // if (random(0, 10)<2) println(vert.getColor());
    }

    //    meshes.add(new HE_Mesh(crSphere));
    crSphere.setCenter(helixR*cos(aa), helixR*sin(aa), zz);
    tmesh = new HE_Mesh(crSphere); 
    meshes.add(tmesh);

    HE_Mesh mesh2 = meshes.get(meshes.size()-1);

    HE_VertexIterator vitr2=new HE_VertexIterator(mesh2);

    while (vitr2.hasNext ()) {
      HE_Vertex vert = vitr2.next().get();
      vert.setColor(color(hue2, 255, 255));
    }

    //    meshes.add(new HE_Mesh(crSphere));
    if (ll % 6 == 0) {
      crCylinder.setRadius(10, 10).setHeight(2*helixR-10).setCenter(0, 0, zz);
      crCylinder.setZAngle(aa).setZAxis(1, 0, 0);
      tmesh = new HE_Mesh(crCylinder);

      HE_VertexIterator vitr3=new HE_VertexIterator(tmesh);
      while (vitr3.hasNext ()) {
        HE_Vertex vert = vitr3.next().get();
        vert.setColor(color(hue2, 255, 255));
        // if (random(0, 10)<2) println(vert.getColor());
      }
      meshes.add(tmesh);
    }
    ll++;
    aa+=astep;
  }


  // transfer mesh coordinates to an array in creation order (approximately z order)

  particles = new Vector();
  DNA = new ArrayList<Vec3D>();
  img = new ArrayList<Vec3D>();
  col = new IntList();

  println(meshes.size());
  int vc=0, pc=0;

  for (int i=0; i<meshes.size (); i++)
  {
    HE_Mesh mesh = meshes.get(i);
    HE_VertexIterator vitr=new HE_VertexIterator(mesh);
    while (vitr.hasNext ()) {
      HE_Vertex vert = vitr.next().get();
      xc=vert.xf();
      yc=vert.yf();
      zc=vert.zf();
      color cc = vert.getColor();                                     //  DOES NOT WORK
      if (random(0, 1) < pratio)          //  random vertices
      {
        particles.add(new Particle());
        DNA.add(new Vec3D(xc, yc, zc));
        col.append(cc);
        //     if (random(0, 25)<2) println(vert.getColor());
        pc++;
      }
      vc++;
    }
  }
  n=pc;
  println("vertices: "+vc+"  particles: "+pc);
  frameRate(25);
  avg = new Vec3D();
}

// ==================+++++++++++++++)))))))))))))#######################

void draw() {  
  float time = (float)int(frameCount/25/6)/10;
  // pointSize = 1+(int (frameCount/250) % 3);
  frame.setTitle("PointSize: "+pointSize+"  Time: "+time+"  Frame count: " + frameCount + "  Frame rate: " + int(frameRate)+"  debug: "+debugv);
  float scl = 0.6;

  if (frameCount<1000) scl = constrain(((float)frameCount - 300)/700 + 0.1, 0.1, 0.6);
  if (frameCount<200) scl = 0.1;
  if (frameCount>=3000) scl = map((((float)frameCount - 3000)/800), 0, 1, 0.6, 0.1);
  if (frameCount>3800) scl = 0.1;

  for (int i = 0; i < particles.size (); i++) {
    Particle cur = ((Particle) particles.get(i));
    avg.addSelf(cur.position);
  }
  avg.scaleSelf(1. / particles.size());

  //  if(random(0,3) <1) println(frameCount+"  "+form+"  "+ avg);

  cameraCenter.scaleSelf(1 - cameraRate);
  cameraCenter.addSelf(avg.scale(cameraRate));

  caa=0.002;
  cam.rotateZ(caa/0.3);
  cam.rotateX(caa);
  cam.rotateY(caa/0.6);
  scale(scl);
  translate(-cameraCenter.x, -cameraCenter.y, -cameraCenter.z); 

  float[] camPosition = cam.getPosition();
  camPosVec = new Vec3D(camPosition[0], camPosition[1], camPosition[2]);
  focalPlane = new Plane(avg, camPosVec);

  distanceAvgToCamera = avg.distanceTo(camPosVec);

  //background(BACK_COLOR);
  background(0);

  noFill();

  hint(DISABLE_DEPTH_TEST);

  for (int i = 0; i < particles.size (); i++) {
    Particle cur = ((Particle) particles.get(i));
    if (!paused) cur.update();
    cur.draw(i);
  }

  globalOffset.addSelf(
  turbulence / neighborhood, 
  turbulence / neighborhood, 
  turbulence / neighborhood);

  checkTime2();


  if (frameCount >= saveAfter && frameCount <= saveUpTo && tosave) saveFrame(url + fn + "/frame_####.png");
}

// end of draw ========================


Particle randomParticle() {
  return ((Particle) particles.get((int) random(particles.size())));
}



void keyPressed() {
  if (key == 'p')
    paused = !paused;
}



void formDNA(int duration_, boolean lines_, float strength_)
{
  form = true; 
  duration=duration_; 
  frameStart=frameCount; 
  lines=lines_;
  strength = strength_;
  for (int i = 0; i < particles.size (); i++) {
    Particle cur = ((Particle) particles.get(i));
    cur.defineDestination(DNA.get(i), col.get(i));
  }
}

void diffuseDNA(int duration_, boolean lines_, float strength_)
{
  form = true; 
  diff = true;
  duration=duration_; 
  diffFrame = frameCount; 
  diffStep = int(particles.size() / duration)+1;
  lines=lines_;
  strength = strength_;
}



void formChaos(int duration_, boolean lines_)
{
  form=false; 
  duration=duration_; 
  lines=lines_;
  frameStart=frameCount;
}



void checkTime2()
{
  switch(frameCount) {

  case 10:
    formDNA(10, false, 2); 
    break;

  case 40: 
    formChaos(20, false); 
    break;

  case 400:
    formDNA(300, false, 0.6);
    break; 

  case 700: 
    formChaos(20, false); 
    break;

  case 1000:
    formDNA(300, false, 0.5);
    break; 

  case 1300: 
    formChaos(100, false); 
    break;

  case 1500:
    formDNA(500, false, 2.5);
    break; 

  case 2000: 
    formChaos(200, false); 
    break;

  case 2200:
    formDNA(300, false, 0.6);
    break; 

  case 2500: 
    formChaos(20, false); 
    break;

  }

  float since = frameCount - frameStart;

  if (form) 
  {
    //   transition = atan(15*(constrain(since/duration, 0, 1)-0.7))/PI+0.5-0.0318;
    transition = constrain(since/duration, 0.05, 1);
    if (diff) {
      int diffMax = diffFrame + diffStep;
      if (diffMax>=particles.size()) {
        diffMax = particles.size();
        diff = false;
        println(diffMax);
      }
      for (int i = diffFrame; i < diffMax; i++) {
        Particle cur = ((Particle) particles.get(i));
        cur.defineDestination(DNA.get(i), col.get(i));
      }
      diffFrame = diffMax;
    }
  } else
  {
    transition = atan(10*(constrain(1 - since / duration, 0, 1)-0.7))/PI+0.5-0.0423+0.05;
  }
  // if (frameCount % 10 == 0) println(form+" frame: "+frameCount+"  transition: "+transition+"  duration: "+duration+"  "+distanceAvgToCamera);
}



void setParameters() {
  //  n = 15000;
  dofRatio = 30;            // 20
  neighborhood = 200;       // from 50 to 400
  speed = 7;               // 10
  viscosity = 0.6;          // 0.4
  spread = 90;              // 80
  independence = 0.1;       // 0.25
  rebirth = 0;
  rebirthRadius = 250;
  turbulence = 2.2;         // 2.2
  cameraRate = 0.9;
  averageRebirth = false;
  destinationAttraction = 0.003;     // around 0.006
}
Vec3D centeringForce = new Vec3D();
Vec3D destinationForce = new Vec3D();
Vec3D lastPoint = new Vec3D();


class Particle {
  Vec3D position, velocity, force, destination, destination2;
  Vec3D localOffset;
  int sequence;
  color colhue;
  boolean colset;
  float bias;      // 0 to 1 bias from destination to destination2

  // constructor

  Particle() {
    //    position = new Vec3D(xc, yc, zc);
    resetPosition();
    colhue = color(0, 0, 255);
    velocity = new Vec3D();
    force = new Vec3D();
    destination = Vec3D.randomVector();
    localOffset = Vec3D.randomVector();
    sequence=0;
    colset = false;
  }

  float getCol() {
    return hue(colhue);
  }

  void resetPosition() {
    position = Vec3D.randomVector();
    position.scaleSelf(random(rebirthRadius));
    if (particles.size() == 0)
      position.addSelf(avg);
    else
      position.addSelf(randomParticle().position);
  }

  void defineDestination(Vec3D d_, color c_) {
    Vec3D dest = d_;
    destination.set(dest).jitter(1);
    if (!colset) {
      float x1 = destination.x;
      float y1 = destination.y;
      float a1 = cos(1*(destination.z+helixL+17)*(astep/zstep));
      float zs = abs(a1)/a1;
      float r1 = abs(x1)/x1 * zs * sqrt(x1 * x1 + y1 * y1);  // 
      colhue=color((map(r1, -helixR-10, helixR+10, 0, 75 )+0) % 255, random(220, 255), random(190, 255)); 
      colset=true;
    }
    destination.subSelf(avg);
  }

  void defineDestination2(Vec3D d_, color c_) {
    Vec3D dest = d_;
    destination2.set(dest).jitter(2);
    destination2.subSelf(avg);
  }

  void draw(int ii) {
    float distanceToFocalPlane = focalPlane.getDistanceToPoint(position);
    float distanceToCamera = camPosVec.distanceTo(position);

    //   if (ii % 1000 == 0) println("avg to camera"+distanceAvgToCamera + "   point to camer "+distanceToCamera);

    float distRatio = constrain(distanceToCamera / distanceAvgToCamera, 0, 3);
    float pbr=0;
    if (distRatio<2) pbr = map( distRatio, 0, 2, 255, 230);
    if (distRatio>=2) pbr = map( distRatio, 2, 3, 230, 100);

    distanceToFocalPlane *= 1 / dofRatio;
    distanceToFocalPlane = constrain(distanceToFocalPlane, 1, 6);
    strokeWeight(pointSize * distanceToFocalPlane);
    //  strokeWeight(pointSize);
    stroke(hue(colhue), saturation(colhue), pbr, constrain(255 / (1.0 * distanceToFocalPlane * distanceToFocalPlane), 5, 255));
    //    stroke(255, constrain(255 / (1.0 * distanceToFocalPlane * distanceToFocalPlane), 10, 255));
    point(position.x, position.y, position.z);
    if (lines) {
      strokeWeight(0.25);
      stroke(200, 50*transition);
      line(position.x, position.y, position.z, lastPoint.x, lastPoint.y, lastPoint.z);
      lastPoint.x=position.x;
      lastPoint.y=position.y;
      lastPoint.z=position.z;
    }
  }

  void applyFlockingForce() {
    force.addSelf(
    noise(
    position.x / neighborhood + globalOffset.x + localOffset.x * independence, 
    position.y / neighborhood, 
    position.z / neighborhood)
      - .5, 
    noise(
    position.x / neighborhood, 
    position.y / neighborhood + globalOffset.y  + localOffset.y * independence, 
    position.z / neighborhood)
      - .5, 
    noise(
    position.x / neighborhood, 
    position.y / neighborhood, 
    position.z / neighborhood + globalOffset.z + localOffset.z * independence)
      - .5);
  }

  void applyViscosityForce() {
    force.addSelf(velocity.scale(-viscosity));
  }

  void applyCenteringForce() {
    centeringForce.set(position);
    centeringForce.subSelf(avg);
    //  centeringForce.subSelf(new Vec3D(0,0,0));
    float distanceToCenter = centeringForce.magnitude();
    centeringForce.normalize();
    centeringForce.scaleSelf(-distanceToCenter / (spread * spread));
    force.addSelf(centeringForce);
  }

  void applyDestinationForce() {
    float distanceToDestination = position.distanceTo(destination);
    destinationForce.set(position);
    destinationForce.subSelf(destination);
    destinationForce.normalize();
    destinationForce.scaleSelf( - destinationAttraction * strength * distanceToDestination * transition);
    force.addSelf(destinationForce);
  }

  void update() {
    force.clear();
    applyFlockingForce();
    applyViscosityForce();
    applyCenteringForce();
    applyDestinationForce();
    velocity.addSelf(force); // mass = 1
    position.addSelf(velocity.scale(speed));
  }
}


