
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
    objs[i] = new JColesObj(random(50,80));   // the one change you'll need to make is changing this line to call your constructor
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
/*****************************************
 * Assignment 05
 * Name:         Janna Coles
 * E-mail:       jcoles01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    11/12/12
 * 
 * Avatar Aang floats along through the aquarium in his iceberg bubble.
***********************************************/

class JColesObj extends AnimatedObject { // keep this line as is, except for renaming the class

  //Fields
  int x; // x position
  int y; // y position
  float d; // diameter of the iceberg
  float vx; // x velocity
  float vy; // y velocity
  float angle; // angle of rotation
  float turn; // rotation velocity
  color c;

  /** Constructor */
  JColesObj(float size) {
    x = (int) random(d/2, width-d/2);
    y = (int) random(height/5, 4 * height/5);
    vx = 2;
    vy= 2;
    angle = (random(0, 2 * PI));
    turn = (random(-.01, .01));
    c = color (92, 235, 248);
    d = size;
  }

  void display() {
    pushMatrix();
    fill(c);
    stroke(0);
    strokeWeight(1);
    ellipseMode(CENTER);
    rectMode(CENTER);

    //transformations
    translate(x, y);
    rotate(angle);

    //Aang
    
    //Body
    fill(248, 222, 46);
    ellipse(0, d/3 + 5 * sin(x/10), d/2.9, d/9);
    ellipse(0, d/7 + 5 * sin(x/10), d/3, d/2.7);
     //Belt
     fill(227, 82, 43);
     rect(0, d/3.45 + 5 * sin(x/10), d/4, d/15);
    
    //Ears
    fill(251, 213, 179);
    ellipse(d/7,- d/7 + 5 * sin(x/10), d/9, d/9);
    ellipse(-d/7,- d/7 + 5 * sin(x/10), d/9, d/9);
    
    //Cloak
     fill(227, 82, 43);
     ellipse(-d/10, d/12 + 5 * sin(x/10), d/4.9, d/4.9);
     ellipse(d/10, d/12 + 5 * sin(x/10), d/4.9, d/4.9);
    
    //Head
    fill(251, 213, 179);
    ellipse(0,- d/6 + 5 * sin(x/10), d/3, d/3);
    
    //Face, eyes then mouth
    strokeWeight(3);
    line(d/23, -d/7.3 + 5 * sin(x/10), d/10, -d/6.5 + 5 * sin(x/10));
    line(-d/23, -d/7.3 + 5 * sin(x/10), -d/10, -d/6.5 + 5 * sin(x/10));
    strokeWeight(2);
    line(-d/22, -d/15 + 5 * sin(x/10), d/22, -d/15 + 5 * sin(x/10));
    strokeWeight(1);
    
    //Arrow
    fill(55, 155, 239);
    beginShape();
    vertex(d/10, -d/4 + 5 * sin(x/10));
    vertex(d/22, -d/4 + 5 * sin(x/10));
    vertex(d/22, -d/3 + 5 * sin(x/10));
    vertex(-d/22, -d/3 + 5 * sin(x/10));
    vertex(-d/22, -d/4 + 5 * sin(x/10));
    vertex(-d/10, -d/4 + 5 * sin(x/10));
    vertex(0, - d/7 + 5 * sin(x/10));
    endShape(CLOSE);
    
    //Hands
     fill(251, 213, 179);
     ellipse(d/30, d/6.9 + 5 * sin(x/10), d/15, d/15);
     ellipse(-d/30, d/6.9 + 5 * sin(x/10), d/15, d/15);
     //Lines
      fill(55, 155, 239);
      ellipse(d/28, d/6.9 + 5 * sin(x/10), d/20, d/40);
      ellipse(-d/28, d/6.9 + 5 * sin(x/10), d/20, d/40);
    
    //Arms
    fill(248, 222, 46);
    ellipse(d/7.3, d/6.9 + 5 * sin(x/10), d/5.9, d/12);
    ellipse(-d/7.3, d/6.9 + 5 * sin(x/10), d/5.9, d/12);
    
    //Left Leg
    fill(217, 72, 33);
    ellipse(d/14, d/3 + 5 * sin(x/10), d/9, d/15);
    fill(248, 222, 46);
    ellipse(-d/10, d/2.7 + 5 * sin(x/10), d/3, d/10);
    fill(227, 82, 43);
    arc(-d/10, d/2.7 + 5 * sin(x/10), d/3, d/10, 4.7, 7.85);
    
    //Right Leg
    fill(217, 72, 33);
    ellipse(-d/14, d/3 + 5 * sin(x/10), d/9, d/15);
    fill(248, 222, 46);
    ellipse(d/10, d/2.7 + 5 * sin(x/10), d/3, d/10);
    fill(227, 82, 43);
    arc(d/10, d/2.7 + 5 * sin(x/10), d/3, d/10, 1.56, 4.69);
   
    //Iceberg
    fill(c, 170);
    ellipse(0, 5 * sin(x/10), d, d);

    //Undo transformations
    popMatrix();
    rectMode(CORNER);
  }

  void move() {
    x += vx;
    angle += turn;

    if ((x <= d/2.0 && vx<0) || (x >= (width-d/2.0) && vx>0)) {
      vx = -vx;
    }
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}




void drawTankBackground() {
}
