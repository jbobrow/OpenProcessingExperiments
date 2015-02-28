
class Branch {
  // each branch that is above a minimum thickness will have at least two smaller branches forking from its endpoint
  // it may have third and/or fourth additional branches emerging at random points along its length
  //  
  float thickness, startX, startY, angle, branchLength, endX, endY;  
  float deltaBranch; // angle offset of children from parent
  float thicknessShrinkage; //how much each branch will be thinner than is parent
  float thirdStart, fouthStart;
  boolean isTrunk;
  float childStartX;
  float childStartY;
  float childAngle;
  float childOffset;
  float bushiness;
  float spread;
  float parentHeight;



  //child objects of the same type (recursive)
  Branch[] offshoots;



  Branch (float _thickness, float  _startX, float _startY, float _angle, boolean _isTrunk, float _bushiness, float _spread) {
    thickness = _thickness;
    startX = _startX;
    startY=_startY;
    angle = _angle;
    isTrunk = _isTrunk;
    bushiness = _bushiness;
    spread = _spread;


    thicknessShrinkage = .55 + _bushiness; //how much each branch will be thinner than is parent
    deltaBranch = .1 + _spread; // angle offset of children from parent
    //Length varies with thickness + a random amount), the main trunk is longer
    if (isTrunk) { // the main trunk can be given different length/thickness ratio, or not
      branchLength = thickness * (6 + random(12));
    }
    else {
      branchLength = thickness * (6 + random(12));
    }
    endX = startX + cos(angle) * branchLength;
    endY = startY + sin(angle) * branchLength;

    //if its not too thin it will have child branches
    if (thickness <= 1) {
      offshoots = new Branch[0]; //if its too thin make offshoots[] empty
    }
    else {
      // if it has children give it 2-4 child branches (offshoots)
      int numB = (int) random(3) + 2;
      //int numB = min ((int) random(3) + 2, (int(thickness)+1)); // 2-4 branches unless thickness (rounded up) is less than that.
      offshoots = new Branch[numB];

      // every branch has two emerging from the end (calling the consructor in the constructor, recursive!)
      if (isTrunk) {
        childOffset = thickness/3.5;
      }
      else if ( thickness > 7) { // this makes forks on thicker branches draw smoother
        childOffset = (thickness - thickness * thicknessShrinkage) * .6;
      }
      else {
        childOffset = 0;
      }

      offshoots[0] = new Branch(max(1, thickness * thicknessShrinkage), endX + childOffset, endY, angle + deltaBranch + random(.35), false, bushiness, spread);
      offshoots[1] = new Branch(max(1, thickness * thicknessShrinkage), endX - childOffset, endY, angle - deltaBranch - random(.35), false, bushiness, spread);

      //if a third choose a startpoint along the parent> its 2 steps thinner or 1 if thickness is 1
      if (offshoots.length > 2) {
        thirdStart = random(branchLength *.6) + branchLength *.2;
        childStartX = startX + cos(angle) * thirdStart;
        childStartY = startY + sin(angle) * thirdStart;
        //50/50% chance left/right
        if (random(2)>1) {
          childAngle = angle - deltaBranch - random(.4);
        }
        else {
          childAngle = angle + deltaBranch + random(.4);
        }

        offshoots[2] = new Branch(max(1, thickness * thicknessShrinkage* .8), childStartX, childStartY, childAngle, false, bushiness, spread);
      }
      if (offshoots.length == 4) {

        fouthStart =  random(branchLength *.6) + branchLength *.2;
        //if its too close to 3rd branch move seems to be un-necessary
        /*if (fouthStart - thirdStart < branchLength *.1) {
         if (fouthStart > branchLength *.6) {
         fouthStart -= branchLength *.3;
         }
         else {
         fouthStart -= branchLength *.3;
         }
         }*/

        childStartX = startX + cos(angle) * fouthStart;
        childStartY = startY + sin(angle) * fouthStart;
        //opposite side of parent from 3rd
        if (childAngle > angle) {
          childAngle = angle - deltaBranch - random(.2);
        }
        else {
          childAngle = angle + deltaBranch + random(.2);
        }

        offshoots[3] = new Branch(max(1, thickness * thicknessShrinkage* .8), childStartX, childStartY, childAngle, false, bushiness, spread);
      }
    }
  }

  void drawBranch() {
    stroke(0);
    if (thickness > 4) {
      strokeWeight(thickness*1.25);
    }
    else {
      strokeWeight(thickness);
    }
    line(startX, startY, endX, endY);
    //recursively draw the children
    for (int i = 0; i < offshoots.length; i ++) {
      offshoots[i].drawBranch();
    }
  }
  void drawShadow(float _foreshorten, float _toTheSide) {
    stroke (100);
    if (thickness > 4) {
      strokeWeight(thickness*1.25);
    }
    else {
      strokeWeight(thickness);
    }
    // foreshorten scales the height (not used, now done with scale transform before calling drawShadow
    //toTheSide moves the x farther depending on the height.
    // 	map(value, low1, high1, low2, high2)
    // xVal +(map, yVal* toTheSide)

    line(startX + startY * _toTheSide , startY, endX + endY * _toTheSide, endY);

    //recursively draw the children shadows
    for (int i = 0; i < offshoots.length; i ++) {
      offshoots[i].drawShadow( _foreshorten, _toTheSide);
    }
  }

  //after calling this call setParentHeight to make sure each branch knows the total treeHeight
  void getBranchHeight(Tree _parent) {
    if (endY < _parent.treeHeight) { // because y values are negative
      _parent.treeHeight = endY;
    }

    for (int i = 0; i < offshoots.length; i ++) {
      offshoots[i].getBranchHeight(_parent);
    }
  }
  void setParentHeight (float _treeHeight) {
    parentHeight = _treeHeight;
    for (int i = 0; i < offshoots.length; i ++) {
      offshoots[i].setParentHeight(_treeHeight);
    }
  }
}


