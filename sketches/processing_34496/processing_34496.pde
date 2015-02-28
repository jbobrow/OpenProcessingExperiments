
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// INSTALLATION DESIGN: PROJECT PROPOSAL     ////////////////////////////
/////////////////// NAME: MUHAMAD FIRADAUS KHAZIS ISMAIL      ////////////////////////////
/////////////////// STUDENT ID: 275827                        ////////////////////////////
/////////////////// PERFORMATIVE ARCHITECTURE STUDIO          ////////////////////////////
/////////////////// UNIVERSITY OF MELBOURNE                   ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/* This sketch is a test on mouse as an attractor point
Original code was from Mani.
*/
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// INSTALLATION DESIGN: PROJECT PROPOSAL     ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

ArrayList objectAPop = new ArrayList ();
float numObjectA = 100;
float minRepelDistance = 50;
float nincAmount = 0.01;
float ninc, nx, ny;
PVector arbitraryFollow = new PVector(0,0,0);
final int CALC_FREQ = 1;

float align =20;
float avoidance = 4;

float sensitivity;
float attraction;


float pastDis = width + height; //reset memory

// ----- SETUP

void setup () {
  
  size (900, 900, P3D);
  background (0);

float s = 2;
  int cA = 255;


  for (int k = 0; k <numObjectA; k++) {
    PVector locA = new PVector(random(0,width), random(0,height), 0);
    PVector velA = new PVector(noise(random(-1, 1)), random(-1, 1), 0);
    // create a new instance of objectA class
 attraction = random(0,1);  // how well they respend to you when moving closer
    sensitivity = random(0,1);  // how badly they respend to you when moved away
    objectA newobjectA = new objectA(locA, velA, s, cA, attraction, 0);
    objectAPop.add(newobjectA);
  }

 
}

void draw () {
  fill( 0, 2);
  rect (0, 0, width, height);
  // looping through the population of objectA and 
  // running the run () from class objectA
  for (int i= 0 ; i < objectAPop.size (); i++) {
    objectA a = (objectA) objectAPop.get(i);
    // assigning the location onto individual a location
    PVector objectALocation = a.objectALocation;
   PVector objectAVelocity = a.objectAVelocity;
    a.run();

    //update the number of objectA
    if (objectAPop.size()<numObjectA) {
      objectAPop.add(new objectA(new PVector(random(width), random(height), 0),new PVector(random(width), random(height), 0), 1, 1, attraction, 0));
    }

  }
}


