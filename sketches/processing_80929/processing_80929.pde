
/**
 *  Blob.pde
 *  Created by the Wizened Wizard
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
  float itemOffsetAngle;
  float centreScale;
  float pulseFrequency;
  float rotateRate;
  int   updateCount;

    // constructor
  Blob(float _x, float _y, float _d, float _rotateRate, int depth) {
    super(_x, _y, _d) ;

    items = new ArrayList() ; // an array list for the inside items
    nItems = 8 ; // number of items on the inside
    itemSize = diam * 0.5; // relative size of the objects
    itemFromCentre = diam * 0.75 ; // relative distance from the centre
    itemOffsetAngle = 0;
    centreScale = 1.0;
    pulseFrequency = 0.01; 
    updateCount = 0;
    rotateRate = _rotateRate; //reverse rotation

    // generate the items inside around the edges of a circle
    // adding them to the array list
    for (int i = 0; i < nItems; i += 1) {
        Item item;
        if (depth <= 0) {
            item = new SpikeyItem(0, 0, itemSize);
        }
        else {
            item = new Blob(0, 0, itemSize, -4.0*rotateRate, depth - 1);
        }
        items.add(item);
    }
  } // end constructor

  void positionItem(float theta) {
      rotate(theta + itemOffsetAngle);
      translate(0, itemFromCentre * centreScale);
  }

  // returns a pulsating value varying from 0 to 1
  float pulseFactor(int step) 
  {
      return 0.5*sin(TWO_PI*step*pulseFrequency) + 0.5;
  }

  // the render method defined in the abstract class Item
  void render() {
  fill (103, 255, 0, 20);
      ellipse(xpos, ypos, centreScale*diam, centreScale*diam) ; // the containing ellipse

      //pushMatrix(); // push onto the matrix stack
      translate(xpos, ypos) ; // displace the matrix
      // iterate through our array list 
      for (int i=0; i< items.size(); i++) {
          float theta = i * TWO_PI/nItems;
          Item item = (Item) items.get(i) ; // get the current object in the araylist (is from the abstract class Item)
          pushMatrix(); // push onto the matrix stack
          positionItem(theta);
          item.render() ; // draw the item
          popMatrix();
      }
    // popMatrix() ; // pop off the matrix stack
  } // end render

  // animate the blob
  void update() {
      itemOffsetAngle += rotateRate;
      centreScale = 0.1*pulseFactor(updateCount) + 0.9;
      updateCount += 1;
      // update all of the child items as well
      for (int i=0; i< items.size(); i++) {
          Item item = (Item) items.get(i) ; // get the object in the araylist 
          item.update();
      }
  }
} // end class



