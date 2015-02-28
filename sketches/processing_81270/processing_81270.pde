
/**
 *  Blob.pde
 *  Created by the Wizened Wizard
 *  October 17th 2012
 *  nofixedaddress
 *  Draws an ellipse filled with n ellipses around the centre point.
 *  extends Item, inherits xpos, ypo, diam
 */

class Blob extends Item {

  ArrayList items ; // the arraylist to store inside items
  float nItems ; // number of ellipses on the inside
  float itemSize  ; // relative size of the elippses
  float itemFromCentre  ; // relative distance from the centre
  float xspeed, yspeed;



  // constructor
  Blob(float _x, float _y, float _d) {

    super(_x, _y, _d) ;
    xspeed = 1.9;
    yspeed = 1.9;
    items = new ArrayList() ; // an array list for the inside items
    nItems = 10 ; // number of items on the inside
    itemSize = diam * 0.125 ; // relative size of the elipses
    itemFromCentre = diam * 0.75 ; // relative distance from the centre

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
fill(255);

    ellipse(xpos, ypos, diam, diam) ; // the containing ellipse

    pushMatrix(); // push onto the matrix stack
    translate(xpos, ypos) ; // displace the matrix
    // iterate through our array list 
    for (int i=0; i< items.size(); i++) {
      Item item = (Item) items.get(i) ; // get the current object in the araylist (is from the abstract class Item)
      item.render() ; // draw the item
    }
    popMatrix() ; // pop off the matrix stack
  } // end render

  // moves all of the circles in the same pattern back and forth accross the screen
  void update() {
    xpos += xspeed;
    ypos += yspeed;

    if (xpos > width || xpos < 0) {
      xspeed *= -1;
    }
    if (ypos> height || ypos<0) {
      yspeed *= -1;
    }
  }
} // end class


