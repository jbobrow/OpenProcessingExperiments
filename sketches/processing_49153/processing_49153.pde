
/** The array of objects */
AnimatedObject[] objs = new AnimatedObject[5];

/** Constant for the sandHeight */
int SAND_HEIGHT = 40;


/** Setup the sketch */
void setup() {
  size(800,600);
  smooth();
  // initialize all the objects
  for (int i=0; i < objs.length; i++) {
    objs[i] = new EFawcettObj(random(30,50));   // the one change you'll need to make is changing this line to call your constructor
  }
}


/** The main draw loop */

void draw() {
  rectMode(CORNER);
  
  // draw the tank background
  background(50,50,255);
  
  // draw the sandy bottom of the tank
  fill(168,168,50);
  rect(0,height-SAND_HEIGHT, width, SAND_HEIGHT);
  
  // draw the enhanced tank background, if necessary
  drawTankBackground();
  
  // create the vector of all object's locations
  PVector[] allObjectsLocations = new PVector[objs.length];
  for (int i=0; i<objs.length; i++) {
    allObjectsLocations[i] = new PVector(objs[i].getX(), objs[i].getY());
  }
  
  // draw and animate each of the objects
  for (int i=0; i<objs.length; i++) {
    objs[i].display();
    objs[i].move(allObjectsLocations);
  }
}



/** An abstract class for animated objects */
abstract class AnimatedObject {
  
  /** Constructor
   *  Note that your constructor should accept a single float specifying the size
   */
  
  /** Displays the object */
  abstract void display();
  
  /** Advances the object's animation by one frame 
   *  Note: Implement only one of the move() functions, but NOT both.
   */
  void move() { }
  
  /** Advances the object's animation by one frame.
   *  Note: Implement only one of the move() functions, but NOT both.
   *  @param allObjectsLocations an array of the locations of ALL objects in the environment
   */
  void move(PVector[] allObjectsLocations) { move(); }
  
  /** Getter for the object's x position 
   *  @return the object's x position (as measured from the center of the object)
   */
  abstract int getX();
  
  /** Getter for the object's y position 
   *  @return the object's y position (as measured from the center of the object)
   */
  abstract int getY();
}


