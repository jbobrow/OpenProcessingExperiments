

//Created by Irine Prastio
//Email:  ipa5@sfu.ca
//November 11, 2012
//IAT 800 - Assignment 3



Blob blob ;
Blob2 blob2;


void setup() {
  size(640, 480) ;
  blob = new Blob(width/2, height/2, 75) ;
  blob2 = new Blob2 (width/2, height/2, 50);
 
  smooth();
  fill (255,160,0,50);
  stroke (0);
  strokeWeight(0);
  frameRate(20);
}

void draw() {
  background (255);
  blob.render() ;
  blob.update();
  blob2.render();
  blob2.update();
  blob2.ease();

  }


/**
 *  Blob.pde
 *  Created by the Wizened Wizard, appropriated by Irine Prastio (ipa5@sfu.ca)
 *  October 17th 2012
 *  nofixedaddress
 *  Draws an ellipse filled with n ellipses around the centre point.
 *  extends Item, inherits xpos, ypo, diam
 */

class Blob extends Item {

  ArrayList items ; // the arraylist to store inside itmes
  float nItems ; // number of ellipses on the inside
  float itemSize  ; // relative size of the elippses
  float itemFromCentre  ; // relative distance from the centre
  float a = 0.0;
  float s = 0.0;
  float r;
  float g;
  float b;

  // constructor
  Blob(float _x, float _y, float _d) {

    super(_x, _y, _d) ;

    items = new ArrayList() ; // an array list for the inside items
    nItems = 20 ; // number of items on the inside
    itemSize = diam * 0.125 ; // relative size of the elippses
    itemFromCentre = diam * 0.25; // relative distance from the centre

    // generate the items inside around the edges of a circle
    // adding them to the array list
    for (float theta=0.0; theta < TWO_PI; theta += TWO_PI/nItems) {
      float x = sin(theta) * itemFromCentre ;
      float y = cos(theta) * itemFromCentre ;
      items.add(new CircularItem(x, y, itemSize)) ; // add it to the aray list
    }
  } // end constructor

  // the render method defined in the abstract class Item
  void render() {
    //a = a + 0.04;
    //s = cos(a)*2;
    ellipse(xpos, ypos, diam*s, diam*s) ; // the containing ellipse
    pushMatrix(); // push onto the matrix stack
    translate(xpos, ypos) ; // displace the matrix
    scale(s); 
    // iterate through our array list 
    for (int i=0; i< items.size(); i++) {
      Item item = (Item) items.get(i) ; // get the current object in the araylist (is from the abstract class Item)
      item.render() ; // draw the item
    }
    popMatrix() ; // pop off the matrix stack
  } // end render

  void update() { // to animate the object
    a = a + 0.04;
    s = cos(a)*2;
  }
} // end class

//*  Blob2.pde
 //*  Created by the Wizened Wizard, appropriated by Irine Prastio (ipa5@sfu.ca)
 //*  October 17th 2012
 //*  nofixedaddress
 //*  Draws an ellipse filled with n ellipses around the centre point.
 //*  extends Item, inherits xpos, ypo, diam


class Blob2 extends Blob {

  ArrayList items ; // the arraylist to store inside itmes
  float nItems ; // number of ellipses on the inside
  float itemSize  ; // relative size of the elippses
  float itemFromCentre  ; // relative distance from the centre
  float r;
  float g;
  float b;
  float opacity;
  float a = 0.0;
  float s = 0.0;
  float targetX, targetY;
  float easing = 0.08;



  Blob2 (float _x, float _y, float _d) {

    super(_x, _y, _d) ;

    items = new ArrayList() ; // an array list for the inside items
    nItems = 20 ; // number of items on the inside
    itemSize = diam * 0.5; // relative size of the elippses
    itemFromCentre = diam * 2; // relative distance from the centre

    // generate the items inside around the edges of a circle
    // adding them to the array list
    for (float theta=0.0; theta < TWO_PI; theta += TWO_PI/nItems) {
      float x = sin(theta) * itemFromCentre ;
      float y = cos(theta) * itemFromCentre ;
      items.add(new RectangularItem(x, y, itemSize)) ; // add it to the aray list
    }
  } // end constructor

  // the render method defined in the abstract class Item
  void render() {
    fill (r, g, b, a);
    pushMatrix(); // push onto the matrix stack
    translate(xpos, ypos) ; // displace the matrix
    scale(s); 
    // iterate through our array list 
    for (int i=0; i< items.size(); i++) {
      Item item = (Item) items.get(i) ; // get the current object in the araylist (is from the abstract class Item)
      item.render() ; // draw the item
    }
    popMatrix() ; // pop off the matrix stack
  } // end render

  // to animate the object
  void update() {
    a = a + 0.07;
    s = sin(a)*3;
    r = 100;
    g = 200*sin(s);
    b = 255*sin(s);
    opacity = 50;
    diam = diam+0.50;
  }

  void ease() {
    targetX = mouseX;
    targetY = mouseY;
    float dx = targetX - xpos;
    float dy = targetY - ypos;
    if (abs(dx) > 1)
    {
      xpos += dx * easing;
    }
    if (abs(dy) > 1)
    {
      ypos += dy * easing;
    }
  }
} // end class

/*
*   CircularItem.pde
 *  Created by the Wizened Wizard
 *  October 17th 2012
 *  nofixedaddress
 *  Draws an ellipse at coords with diameter.
 *  extends Item, inherits xpos, ypo, diam
 */



public class CircularItem extends Item {

  // simple constructor used to init variables
  CircularItem(float _x, float _y, float _d) {
    super(_x, _y, _d) ;
  }

  // the render method defined in the abstract class Item
  // draws an ellipse
  void render() {
    ellipse(xpos, ypos, diam, diam) ;
  }
  
} // end class

/**
 *  Item.pde
 *  Created by the Wizened Wizard
 *  October 17th 2012
 *  nofixedaddress
 *  Abstract class defines attributes for xpos, ypo, diam.
 *  defines render method
 */

abstract class Item {

  float xpos, ypos ; // used for coords
  float diam ;      // used for size

  // The construcot
  Item(float _x, float _y, float _d) {
    xpos = _x ;
    ypos = _y ;
    diam = _d ;
  }

  // used for drawing code
  abstract void render() ;
}

 //*  Created by the Wizened Wizard, appropriated by Irine Prastio (ipa5@sfu.ca)
 //*  October 17th 2012
 //*  nofixedaddress
 //*  Draws an ellipse filled with n ellipses around the centre point.
 //*  extends Item, inherits xpos, ypo, diam



public class RectangularItem extends Item {

  // simple constructor used to init variables
  RectangularItem (float _x, float _y, float _d) {
    super(_x, _y, _d) ;
  }

  // the render method defined in the abstract class Item
  // draws an ellipse
  void render() {
    rect (xpos, ypos, diam, diam) ;
  }
  
} // end class



