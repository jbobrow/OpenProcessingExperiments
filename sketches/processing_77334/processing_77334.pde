
/*
drag the control points in the bottom right square to change the revolve profile
'r' to randomize wave interference pattern
'n' to show/hide normals
'w' for wireframe
*/

//import processing.opengl.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import toxi.util.datatypes.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh.*;
import toxi.math.conversion.*;

PeasyCam cam;
PGraphics3D g3;
PMatrix3D currCameraMatrix;

Emitter e1, e2;
PVector pt1, pt2;
  
  
Vec3D mainbase, mainctpt1, mainctpt2, mainend;
Vec2D minibase, minictpt1, minictpt2, miniend;
Spline3D splmain = new Spline3D();
Spline2D splmini = new Spline2D();

Rect guirect;

boolean onbase, onctpt1, onctpt2, onend = false;
float scayl = 5;
int revolvenum = 64;
int splinechop = 21;
int splinenumy = splinechop*3 + 1;
float angstep = TWO_PI/revolvenum;

Vec3D [][] pts = new Vec3D[revolvenum][splinenumy];
Vec3D [][] disppts = new Vec3D[revolvenum][splinenumy];
Vec3D [][] vertnormals = new Vec3D[revolvenum][splinenumy];
float [][] displacement = new float[revolvenum][splinenumy];
int [][] cols = new int[revolvenum][splinenumy];
TriangleMesh mesh = new TriangleMesh();
boolean showNormals = false;
boolean showWire = false;
float maxDisplacement = 20;

void setup(){
  size(800, 800, P3D);
  smooth();
  rectMode(CENTER);
  cam = new PeasyCam(this, 0, 0, 200, 600);
  cam.rotateX(-PI/3);
  g3 = (PGraphics3D)g;
  guirect = new Rect(width-120, height-120, 110, 110);
  
  //int wavemax = 128;
  pt1 = new PVector(random(revolvenum), random(splinenumy));
  pt2 = new PVector(random(revolvenum), random(splinenumy));
  
  e1 = new Emitter(pt1, random(1, 5), random(1, 5));
  e2 = new Emitter(pt2, random(1, 5), random(1, 5));
  
  mainbase = new Vec3D(100, 0, 0);
  mainctpt1 = new Vec3D(mainbase.x+100, mainbase.y, 100);
  mainctpt2 = new Vec3D(mainbase.x-75, mainbase.y, 250);
  mainend = new Vec3D(mainbase.x, mainbase.y, 400);
  
  minibase = new Vec2D(mainbase.x, mainbase.z);
  minictpt1 = new Vec2D(mainbase.x+100, -100);
  minictpt2 = new Vec2D(mainbase.x-75, -250);
  miniend = new Vec2D(mainbase.x, -400);
  
  minibase.scaleSelf(1/scayl);
  minictpt1.scaleSelf(1/scayl);
  minictpt2.scaleSelf(1/scayl);
  miniend.scaleSelf(1/scayl);
  
  splmain.add(mainbase); splmain.add(mainctpt1); splmain.add(mainctpt2); splmain.add(mainend);
  splmini.add(minibase); splmini.add(minictpt1); splmini.add(minictpt2); splmini.add(miniend);

  for (int i=0; i<revolvenum; i++){
    for (int j=0; j<splinenumy; j++){
      pts[i][j] = new Vec3D();
      disppts[i][j] = new Vec3D();
      vertnormals[i][j] = new Vec3D();
      PVector pixpos = new PVector(i, j);
      float dist2emit1 = PVector.dist(pixpos, e1.pos);
      float dist2emit2 = PVector.dist(pixpos, e2.pos);
      float bright1 = e1.amp*sin(dist2emit1/e1.wavelen);
      float whichamp = max(e1.amp, e2.amp);
      int col1 = int(map(bright1, -whichamp, whichamp, 0, 255));
      float bright2 = e2.amp*sin(dist2emit2/e2.wavelen);
      int col2 = int(map(bright2, -whichamp, whichamp, 0, 255));
      int col = (col1+col2)/2;
      cols[i][j] = col;
      displacement[i][j] = map(col, 0, 255, 0, maxDisplacement);
      //println(displacement[i][j]);
    }
  }
}

void draw(){
  background(255);
  noFill();
  //directionalLight(255, 255, 255, -1, 0, -1);
  ambientLight(102, 102, 102);
  pointLight(220, 220, 220, 550, 600, 560);
  pointLight(220, 180, 180, -450, 0, 100);
  pointLight(180, 180, 220, 450, 400, 700);
  calcNormals();
  
  java.util.List miniptlist = splmini.getPointList();
  //println(miniptlist);
  miniptlist.set(0, (Vec2D) minibase);
  miniptlist.set(1, (Vec2D) minictpt1);
  miniptlist.set(2, (Vec2D) minictpt2);
  miniptlist.set(3, (Vec2D) miniend);
  
  mainbase.set(minibase.x*scayl, 0, -minibase.y*scayl);
  mainctpt1.set(minictpt1.x*scayl, 0, -minictpt1.y*scayl);
  mainctpt2.set(minictpt2.x*scayl, 0, -minictpt2.y*scayl);
  mainend.set(miniend.x*scayl, 0, -miniend.y*scayl);
  
  java.util.List mainptlist = splmain.getPointList();
  mainptlist.set(0, (Vec3D) mainbase);
  mainptlist.set(1, (Vec3D) mainctpt1);
  mainptlist.set(2, (Vec3D) mainctpt2);
  mainptlist.set(3, (Vec3D) mainend);
  
  java.util.List vertices=splmain.computeVertices(splinechop);
  // draw the smoothened curve
  for (int r=0; r<revolvenum; r++){
    int i=r;
    int j=0;
    //beginShape();
      for(Iterator iter=vertices.iterator(); iter.hasNext(); ) {
        Vec3D v=(Vec3D)iter.next();
        pts[i][j].set(v.x*cos(r*angstep), v.x*sin(r*angstep), v.z);
        float vdisp = displacement[i][j];
        //println(vertnormals[i][j]);
        Vec3D vnorm = vertnormals[i][j];
        vnorm.scaleSelf(vdisp);
        Vec3D newpt = pts[i][j].add(vnorm);
        //Vec3D newpt = restpts[i][j];
        //println(vnorm);
        disppts[i][j].set(newpt);
        j++;
      }
    //endShape();
  }
  
  stroke(100);
  if (showWire) { noFill(); }
  else { fill(225); }
  
  int nexti;
  for (int j=0; j<splinenumy-1; j++){
    for (int i=0; i<revolvenum; i++){
      if (i == revolvenum-1){ nexti = 0; }
      else { nexti = i+1; }
      beginShape(TRIANGLES);
        vertex(disppts[i][j].x, disppts[i][j].y, disppts[i][j].z);
        vertex(disppts[i][j+1].x, disppts[i][j+1].y, disppts[i][j+1].z);
        vertex(disppts[nexti][j+1].x, disppts[nexti][j+1].y, disppts[nexti][j+1].z);
      endShape();
      beginShape(TRIANGLES);
        vertex(disppts[i][j].x, disppts[i][j].y, disppts[i][j].z);
        vertex(disppts[nexti][j].x, disppts[nexti][j].y, disppts[nexti][j].z);
        vertex(disppts[nexti][j+1].x, disppts[nexti][j+1].y, disppts[nexti][j+1].z);
      endShape();
    }
  }
  
  cam.beginHUD();
    gui();
  cam.endHUD();
}

void gui(){
  lights();
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  g3.camera = currCameraMatrix;
  
  stroke(0);
  
  rectMode(CORNER);
  rect(width-120, height-120, 100, 100);
  rectMode(CENTER);
  Vec2D mouse = new Vec2D(mouseX, mouseY);
  
  if (mouse.isInRectangle(guirect)){ cam.setMouseControlled(false);
  } else {
    cam.setMouseControlled(true);
  }
  
  java.util.List miniverts=splmini.computeVertices(splinechop);
  // draw the smoothened curve
  pushMatrix();
    translate(width-120, height-20);
    beginShape();
      //stroke(0);
      for(Iterator i=miniverts.iterator(); i.hasNext(); ) {
        Vec2D v=(Vec2D)i.next();
        vertex(v.x,v.y);
        //ellipse(v.x, v.y, 3, 3);
      }
    endShape();
    
    fill(200);
    Rect minibaserect = new Rect(minibase.x-4 + width-120, minibase.y-4 + height-20, 4, 4);
    Rect minictpt1rect = new Rect(minictpt1.x-2 + width-120, minictpt1.y-2 + height-20, 4, 4);
    Rect minictpt2rect = new Rect(minictpt2.x-2 + width-120, minictpt2.y-2 + height-20, 4, 4);
    Rect miniendrect = new Rect(miniend.x-2 + width-120, miniend.y-2 + height-20, 4, 4);
    if (mouse.isInRectangle(minibaserect)){ onbase = true; fill(200, 0, 0); rect(minibase.x-2, minibase.y-2, 6, 6); } 
      else { onbase = false; fill(200); rect(minibase.x-2, minibase.y-2, 4, 4); }
    if (mouse.isInRectangle(minictpt1rect)){ onctpt1 = true; fill(200, 0, 0); rect(minictpt1.x-2, minictpt1.y-2, 6, 6); } 
      else { onctpt1 = false; fill(200); rect(minictpt1.x-2, minictpt1.y-2, 4, 4); }
    if (mouse.isInRectangle(minictpt2rect)){ onctpt2 = true; fill(200, 0, 0); rect(minictpt2.x-2, minictpt2.y-2, 6, 6); } 
      else { onctpt2 = false; fill(200); rect(minictpt2.x-2, minictpt2.y-2, 4, 4); }
    if (mouse.isInRectangle(miniendrect)){ onend = true; fill(200, 0, 0); rect(miniend.x-2, miniend.y-2, 6, 6); } 
      else { onend = false; fill(200); rect(miniend.x-2, miniend.y-2, 4, 4); }

  popMatrix();
  
  pushMatrix();
    rectMode(CORNER);
    //noStroke();
    translate(20, height-20-splinenumy);
    rect(0, 0, revolvenum, splinenumy);
    //loadPixels();
    for (int i=0; i<revolvenum; i++){
      for (int j=0; j<splinenumy; j++){
        stroke(cols[i][j]);
        //println(cols[i][j]);
        //ellipse(i, j, 1, 1);
        point(i, j);
        //pixels[i+j*revolvenum] = cols[i][j]<<16|cols[i][j]<<8|cols[i][j]|0xff000000;
      }
    }
    noFill();
    rectMode(CENTER);
    //updatePixels();
  popMatrix();
}

void mouseDragged(){
  Vec2D mousetrans = new Vec2D(mouseX-guirect.x, mouseY-guirect.y-100);
  if (onbase == true) { minibase.set(mousetrans.x, mousetrans.y); }
  if (onctpt1 == true) { minictpt1.set(mousetrans.x, mousetrans.y); }
  if (onctpt2 == true) { minictpt2.set(mousetrans.x, mousetrans.y); }
  if (onend == true) { miniend.set(mousetrans.x, mousetrans.y); }
  //println("DRAGGED: base: " + onbase + ", ctpt1: " + onctpt1 + ", ctpt2: " + onctpt2 + ", end: " + onend);
}

void mouseReleased(){
  onbase = false;
  onctpt1 = false;
  onctpt2 = false;
  onend = false;
  //println("RELEASED: base: " + onbasev + ", ctpt1: " + onctpt1 + ", ctpt2: " + onctpt2 + ", end: " + onend);
}

void keyPressed(){
  if (key == 'n'){
    showNormals = !showNormals;
  }
  if (key == 'w'){
    showWire = !showWire;
  }
  if (key == 's'){
    String Date = year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".tiff";
    save(Date);
  }
  if (key == 'r'){
    resetEmitters();
  }
}

void calcNormals(){
  stroke(255,0,0);
  Vec3D top, bottom, left, right;
  for (int j=0; j<splinenumy; j++){
    for (int i=0; i<revolvenum; i++){
      if (j==0) { top = new Vec3D(0,0,0); } else { top = pts[i][j].sub(pts[i][j-1]); }
      if (j==splinenumy-1) { bottom = new Vec3D(0,0,0); } else { bottom = pts[i][j].sub(pts[i][j+1]); }
      if (i==0) { right = pts[i][j].sub(pts[revolvenum-1][j]); } else { right = pts[i][j].sub(pts[i-1][j]); }
      if (i==revolvenum-1) { left = pts[i][j].sub(pts[0][j]); } else { left = pts[i][j].sub(pts[i+1][j]); }
      //println(top);
      Vec3D tlnorm = top.cross(left);
      Vec3D trnorm = right.cross(top);
      Vec3D brnorm = bottom.cross(right);
      Vec3D blnorm = left.cross(bottom);
      float nx = (tlnorm.x+trnorm.x+brnorm.x+blnorm.x)/4;
      float ny = (tlnorm.y+trnorm.y+brnorm.y+blnorm.y)/4;
      float nz = (tlnorm.z+trnorm.z+brnorm.z+blnorm.z)/4;
      vertnormals[i][j].set(nx, ny, nz);
      vertnormals[i][j] = vertnormals[i][j].normalize();
      //vertnormals[i][j] = vertnormals[i][j].scale(20);
      Vec3D vnormscaled = vertnormals[i][j].scale(20);
      if (showNormals){
        line(pts[i][j].x, pts[i][j].y, pts[i][j].z, pts[i][j].x + vnormscaled.x, pts[i][j].y + vnormscaled.y, pts[i][j].z + vnormscaled.z);
      }
    }
  }
  stroke(0);
}

void resetEmitters(){
  pt1 = new PVector(random(revolvenum), random(splinenumy));
  pt2 = new PVector(random(revolvenum), random(splinenumy));
  
  e1 = new Emitter(pt1, random(1, 5), random(1, 5));
  e2 = new Emitter(pt2, random(1, 5), random(1, 5));
  
  e1.pos = pt1; e1.wavelen = random(1, 5); e1.amp = random(1, 5);
  e2.pos = pt2; e2.wavelen = random(1, 5); e2.amp = random(1, 5);
  
  for (int i=0; i<revolvenum; i++){
    for (int j=0; j<splinenumy; j++){
      PVector pixpos = new PVector(i, j);
      float dist2emit1 = PVector.dist(pixpos, e1.pos);
      float dist2emit2 = PVector.dist(pixpos, e2.pos);
      float bright1 = e1.amp*sin(dist2emit1/e1.wavelen);
      float whichamp = max(e1.amp, e2.amp);
      int col1 = int(map(bright1, -whichamp, whichamp, 0, 255));
      float bright2 = e2.amp*sin(dist2emit2/e2.wavelen);
      int col2 = int(map(bright2, -whichamp, whichamp, 0, 255));
      int col = (col1+col2)/2;
      cols[i][j] = col;
      displacement[i][j] = map(col, 0, 255, 0, 20);
      //println(displacement[i][j]);
    }
  }
}

class Emitter{
  float wavelen;
  float amp;
  PVector pos;
  
  Emitter(PVector ipos, float iwl, float iamp){
    pos = ipos;
    wavelen = iwl;
    amp = iamp;
  }
}

