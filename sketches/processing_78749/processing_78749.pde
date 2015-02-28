
/***************************************
 DO NOT MODIFY FROM HERE ...
****************************************/
 
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
    objs[i] = new lCiprianoObj(random(30,50));   // the one change you'll need to make is changing this line to call your constructor
  }
}


/** The main draw loop */
void draw() {
  
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


/**************************************
 ... TO HERE
***************************************/

/********************************************************************
 * Assignment 05
 * Name:         Louis Cipriano
 * E-mail:       lciprian@haverford.edu
 * Course:       CS 110 - Section 01
 * Submitted:    November 12, 2012
 * 
 * My sketch is a depiction of goofy fish that swim across a fishtank
 **********************************************************************/

class lCiprianoObj extends AnimatedObject { // keep this line as is, except for renaming the class
  int x;
  int y;
  float lCiprianoObjHeight;
  float lCiprianoObjWidth;
  int xspeed;
  int TailAngle;
  int angleChange;
  int ANGLE_LIMIT;


  lCiprianoObj(float size) { //constructor for lCiprianoObj (fish)
    x = int (random (0, 800));
    y = int (random (0, 600));
    lCiprianoObjWidth = 100;
    lCiprianoObjHeight =100;
    TailAngle = 0; 
    angleChange = 4; 
    ANGLE_LIMIT = 5; //
    xspeed = 2;
  }


  void display () { //display fish
    
    //BODY
    pushMatrix ();
    frameRate(10); //slow default rate to make fins and tail rotate slower
    smooth();
    strokeWeight(1);
    stroke(255, 165, 0);
    fill(255, 255, 0);
    ellipseMode(CENTER); //Bulletproofing
    ellipse(x, y, lCiprianoObjWidth, lCiprianoObjHeight);

    //EYES
    fill(255);
    stroke(0);
    ellipse(x+50, y, lCiprianoObjWidth/5, lCiprianoObjHeight/5);
    ellipse(x+20, y, lCiprianoObjWidth/5, lCiprianoObjHeight/5);

    //Eyeballs
    fill(0);
    //big eye
    ellipse(x+20, y, lCiprianoObjWidth/10, lCiprianoObjHeight/10);
    //tiny eye
    ellipse(x+50, y, lCiprianoObjWidth/20, lCiprianoObjHeight/20);

    //MOUTH
    fill(255);
    ellipse (x+30, y+30, lCiprianoObjWidth/4, lCiprianoObjHeight/4);
    //TONGUE
    strokeCap(ROUND);
    strokeWeight(5);
    stroke(255, 182, 193);
    line(x+30, y+30, x+50, y+30); 

    //fins
    pushMatrix();
    translate(x-25, y); //translate so that fins are always in the same spot relative to the center of a fish's body
    noFill();
    stroke(255, 165, 0);
    strokeWeight(2);
    beginShape();
    for (int i = 10; i<height-560; i+=5) {
      rotate(radians(-TailAngle)); //allows fins to rotate and appear as if propel fish to swim
      vertex(0, i); 
      vertex (20, i);
    }
    endShape();
    popMatrix();

    //Tail
    pushMatrix();
    translate(x-110, y-10);//translate so that tail is always in the same spot relative to the center of a fish's body
    noFill();
    stroke(255, 165, 0);
    strokeWeight(2);
    beginShape();
    for (int i = 10; i<height-520; i+=8) {
      rotate(radians(-TailAngle)); //allows tail to rotate and appear as if propel fish to swim
      curveVertex(i, 0);
      curveVertex (i, 40);
    }
    endShape();
    popMatrix();

  // if the tail or fin has moved past its limit, reverse direction and set within limits
    TailAngle += angleChange;
    if (TailAngle > ANGLE_LIMIT || TailAngle < 0)
    {
      angleChange = -angleChange;
      TailAngle += angleChange;
    }

    popMatrix();
  }

  void move() {  //allows fish to move (swim)
    //speed fish moves
    x = x+xspeed;  
    //fish come in at left of screen, once fish swim off screen
    y = (y-1) + (int (2* sin (.3*x))); //sin function so fish do not move in a straight line
    if (x > width || y < 0) {
      x= 0;
      y = int (random (0, height));
    }
  }
  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }
}

/** If you want to enhance the tank background
 * to showcase your own project, you can put
 * drawing code in this function, which is called
 * near the start of the draw() function below.
 */
void drawTankBackground() {
}
