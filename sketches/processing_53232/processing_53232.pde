
/* This is a template for bus-tops contest on OpenProcessing.org.
*  Bus-Tops (http://bus-tops.com) is a public art project
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/


//Lyndon Manuel
//2012
//Inspired by the flocking and crowding studies of Daniel Shiffman and Jose Sanchez


import toxi.geom.*;

ArrayList PkgCollection;
 
void setup() {
  size(512, 160);
  frameRate(8);
 
  PkgCollection = new ArrayList();
 
  for(int i = 0; i < 400; i++) {
   Vec3D origin = new Vec3D(random(width),random(200),0);
   Pkg myPkg = new Pkg(origin);
   PkgCollection.add(myPkg);
  }
}
 
void draw() {
  
  background(0);

  for(int i = 0; i < PkgCollection.size(); i++) {
    Pkg mp = (Pkg) PkgCollection.get(i);
    mp.run();
  }
}


