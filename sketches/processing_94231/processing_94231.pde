
// source of code:
// http://www.creativecoding.org/example/processing:objektorientiertes-animieren-03-wandern-farbig
// modified by tfguy44 and oatcracker:
// https://forum.processing.org/topic/how-to-use-alpha-to-animate-moving-points-with-fading-tails-in-3d-space#25080000002020325
// ---------------------------------------------

import processing.opengl.*; // openGL library

//import peasy.*; // camera library
//PeasyCam cam;

int numPt = 200; // number of tadpole
int tailLength = 30; // tail length of tadpole
Gizmo giz[] = new Gizmo[numPt];

boolean animateToggle = true;

//__________________________________________________________________________________
void setup () {
  size (500,500,OPENGL);
  //frame.setResizable(true);
  smooth(8);
  colorMode (HSB, 255); //note: HSB color mode doesn't work with gicentre library

  // setup view
  // setup perspective parm  
  float fov = PI/3.0;  // field of view
  float nearClip = 1;
  float farClip = 100000;
  float aspect = float(width)/float(height);
  perspective(fov, aspect, nearClip, farClip);

  //cam = new PeasyCam(this, 300); // the smaller the var, the close the distance to the object
     
  // initiate pts
  for (int i=0; i < giz.length; i++) {
    giz[i] = new Gizmo (random(-100,100),random(-100,100),random(-100,100),tailLength);
  }
  
}

//__________________________________________________________________________________
void draw () {
  background(150);
 
  translate(250,250);
  
  if (animateToggle == true) { 
    noFill();
    strokeWeight(2);
    stroke(100,100,100); // White in HSB
    box(200);
    
    noStroke ();    
    for (int i=0; i < giz.length; i++) {
      giz[i].move();
      giz[i].render();
    }
  } else { // if animatin toggle is false, just render the pts and their tails so far
    noFill();
    strokeWeight(2);
    stroke(100,100,100); // White in HSB
    box(200);
    
    noStroke ();    
    for (int i=0; i < giz.length; i++) {
      giz[i].render(); 
    }   
  }

}



class Gizmo {
  
  // position PVector array "position" to store all the positions of a pt as it moves with a tail
  // the length of the PVector array is the length of the tail, or total num of points forming the tail
  PVector[] positions; 
  
  int[] hues;
  PVector direction;
  int total;
  float spin = 0.2; // degree of direction changing
  
  int tailLength;

  //__________________________________________________________________
  Gizmo (float theX, float theY, float theZ, int tailLength_) {
    positions = new PVector[tailLength_]; // tail length of 100
    hues = new int[tailLength_];
    
    for(int i=0;i<positions.length;i++){
      positions[i] = new PVector (theX, theY, theZ);
    }
    
    //hues[0] = 0;
    hues[0] = (int)random(255);
    
    total=1; // initial length of tail 
    
    direction   = new PVector ();
    direction.x = random (-1, 1);
    direction.y = random (-1, 1);
    direction.z = random (-1, 1);
    
    tailLength = tailLength_;
  }
  
  //__________________________________________________________________
  void move () {
    direction.x += random(-spin, spin);
    direction.y += random(-spin, spin);
    direction.z += random(-spin, spin);
    direction.normalize();

    // "total" is the length of tail
    // or total # of pts to draw along the tail for the current iteration
    // for each "draw" iteration, the # of pts to draw on the curernt frame will increase
    // if "(tailLength-1)" is used, the pt at the end of the tail will not be transparent ... 
    if(total<(tailLength-2)){total++;} 
    
    for( int i=total; i>=1; i-- ){
      positions[i].x = positions[i-1].x;
      positions[i].y = positions[i-1].y;
      positions[i].z = positions[i-1].z;
      hues[i] = hues[i-1];
    }
    
    positions[0].add (direction);
    //hues[0] = getHue();

    if (positions[0].x < -100 || positions[0].x > 100) {
      direction.x *= -1;
    }
    if (positions[0].y < -100 || positions[0].y > 100) {
      direction.y *= -1;
    }
    if (positions[0].z < -100 || positions[0].z > 100) {
      direction.z *= -1;
    }
    
  }
  
  //__________________________________________________________________
  void render () {

//    // tail point is on top
//    for( int i = total-1; i >= 0; i-- ){
//      stroke( hues[i], 255, 255, map(i, 0,total, 255,0) );
//      //println( total + " " + i );
//      //strokeWeight(map(i,0,100,5,1)); // to make shrinking tail effect
//      strokeWeight(map(i,0,100,1,6)); // to make shrinking head effect
//      point (positions[i].x, positions[i].y, positions[i].z);
//    }
    
    // header point is on top
    for( int i = 0; i < total-1; i++ ){
      stroke( hues[i], 255, 255, map(i, 0,total, 255,0) );
      //println( total + " " + i );
      //strokeWeight(map(i,0,100,5,1)); // to make shrinking tail effect
      strokeWeight(map(i, 0,100, 0.5,20)); // to make shrinking head effect(i.e head pt size 0, tail pt size 6)
      point (positions[i].x, positions[i].y, positions[i].z);
    }

  } 
  
  //__________________________________________________________________
  int getHue () {
    PVector v = new PVector (0, 1);
    float a = PVector.angleBetween (v, direction);
    a /=  TWO_PI;
    return int (255 * a);
  }
}
// press space bar and pick a file 
void keyPressed() {

  if ( key == 'a' ) { // boolean value switcher
    animateToggle = (animateToggle == true) ? (false):(true); 
  }

}


