
// author: konrad jünger/ konradjuenger.de (unfished :)
// contact: info@konradjuenger.de

// Digital Analog Surfaces, 2012 - 2013
// Steffi Husslein, Robert Laux, Michael Bertuleit 
// http://interaction-design-group.de/toolbox/



PImage bild;

void setup() {
  size(800, 800);
  noLoop();
  background(0);
  stroke(255);
  noFill();
  strokeWeight(0.5);
  bild=loadImage("test.png");// a .png named "test.png"(size: 800x800px) has to be in the sketch folder
}

void draw() {
  pinWheel( new PVector(0, 400), new PVector(800, 400), new PVector(0, 0),  0);
  pinWheel( new PVector(800, 0), new PVector(0, 0), new PVector(800, 400),  0);
  pinWheel( new PVector(0, 800), new PVector(800, 800), new PVector(0, 400),  0);
  pinWheel( new PVector(800, 400), new PVector(0, 400), new PVector(800, 800),  0);
}

void pinWheel( PVector p1, PVector p2, PVector p3,  int istLevel) {

  // get directional vectors
  PVector pVec1 = new PVector (p2.x-p1.x, p2.y-p1.y);
  PVector pVec2 = new PVector (p3.x-p2.x, p3.y-p2.y);
  PVector pVec3 = new PVector (p1.x-p3.x, p1.y-p3.y);

  // normalized direction 
  PVector nVec1 = new PVector (p2.x-p1.x, p2.y-p1.y);
  PVector nVec2 = new PVector (p3.x-p2.x, p3.y-p2.y);
  PVector nVec3 = new PVector (p1.x-p3.x, p1.y-p3.y);
  nVec1.normalize();
  nVec2.normalize();
  nVec3.normalize();


  // pinwheel tiling segmentation
  PVector z1 = new PVector(p1.x + nVec1.x*0.5*pVec1.mag(), p1.y + nVec1.y*0.5*pVec1.mag())  ;
  PVector z2 = new PVector(p2.x + nVec2.x * pVec1.mag()*0.5 /sqrt(5)*2, p2.y + nVec2.y * pVec1.mag()*0.5/sqrt(5)*2);
  PVector z3 = new PVector(p2.x + nVec2.x * pVec1.mag() /sqrt(5)*2, p2.y + nVec2.y * pVec1.mag() /sqrt(5)*2);
  PVector z4 = new PVector(p1.x+(z3.x-p1.x)*0.5, p1.y+(z3.y-p1.y)*0.5);


  //ist level +1
  istLevel++;
  
  //recursion
  subTriCheck(z2, p2, z1, istLevel);
  subTriCheck(z4, z1, p1, istLevel); 
  subTriCheck(z2, z3, z1, istLevel);
  subTriCheck(z4, z1, z3, istLevel);
  subTriCheck(z3, p1, p3, istLevel);

}

void subTriCheck(PVector vec1, PVector vec2, PVector vec3, int istLevel) {
  if (refineFunc(vec1, vec2, vec3, istLevel-1)) {
    //fuelleDreieck(vec1,vec2,vec3); // activate this line to fill the triangle acording bitmap
    triangle(vec1.x, vec1.y, vec2.x, vec2.y, vec3.x, vec3.y);
  }
  if (refineFunc(vec1, vec2, vec3, istLevel)) {
    pinWheel(vec1, vec2, vec3,  istLevel);
  }
}
// fill acording to bitmap import
void fuelleDreieck(PVector v1, PVector v2, PVector v3) {
  int swPtX = int((v1.x+v2.x+v3.x)/3);
  int swPtY = int((v1.y+v2.y+v3.y)/3);


  int location= int(swPtX) + int(swPtY)* bild.width;
  //gets red/green/blue values for location
  int r =int (red(bild.pixels[location]));
  int g =int (green(bild.pixels[location]));
  int b =int (blue(bild.pixels[location]));
  fill(r, g, b);
} 

boolean refineFunc (PVector reVec1, PVector reVec2, PVector reVec3, int istLevel  ) {

  int location = int(punktschwerpunkt(reVec1, reVec2, reVec3).x) + int(punktschwerpunkt(reVec1, reVec2, reVec3).y)* bild.width;
  float helligkeit = (brightness(bild.pixels[location]));
  helligkeit = map(helligkeit, 0, 255, 2, 6);
  boolean refineLoc;
  if (istLevel< helligkeit) {
    refineLoc= true;
  }
  else {
    refineLoc = false;
  }
  return refineLoc;
}
//get center of mass:
PVector punktschwerpunkt (PVector v1, PVector v2, PVector v3) {
  int swPtX = int((v1.x+v2.x+v3.x)/3);
  int swPtY = int((v1.y+v2.y+v3.y)/3);
  PVector vTemp = new PVector(swPtX, swPtY);
  return vTemp;
}





