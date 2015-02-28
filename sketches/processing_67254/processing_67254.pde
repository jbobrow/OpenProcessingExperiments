

import toxi.geom.*;

// describe a circular area with an array of vectors

ArrayList spotcollection;

int collectionsize = 100;
float deathrad = 50;
float liferad = 50;
float distbetween = 100;



void setup() {
  
  size(800, 200);
  background(0);
  stroke(255, 0, 0);
  spotcollection = new ArrayList(); // create empty array list
  //INITIALIZE
  for (int i = 0; i < collectionsize; i ++) {
    Vec3D origen = new Vec3D(random(width/2), random(height/2), 0);
    Spot mySpot = new Spot(origen);
    spotcollection.add(mySpot);
  }
}





void draw () {
  background(0);
  //call functionality
  for (int i = 0; i < spotcollection.size(); i ++) {
    Spot ms = (Spot) spotcollection.get(i); // call a collection of spots from the whole array.
    // run grouped functions from the Spot class
    ms.run();
    ms.deathzone();
  }
}


