
// mostly counts and speed based varibles intialise here

int count7 = 0;
int count2 = 0;
float fallSpeed = 2;
float growthSpeed= 2;
int countSpin = 0;
float freezeSpeed=0.2;
class Shape {
  private PVector start, end;


  public Shape(float startX, float startY, float endX, float endY) {
    start = new PVector(startX, startY);
    end = new PVector(endX, endY);
  }

  public void drawer(Shape lineShape) {
    PVector startPoint= start.get();
    PVector endPoint = end.get();

    // experimenting with colours

    //*   colorMode(HSB);
    // stroke(360-endPoint.y/15,100,255-endPoint.y/15);

    // strokeWeight(0.2);


    // this draws the lines
    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  }
  //  this calculates the left shape when cut
  public Shape leftShape(Shape lineShape, float x1, float y1, float x2, float y2) {
    float xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector startPoint = lineShape.getStart();
    PVector endPoint = lineShape.getEnd();
    Shape shape = new Shape(startPoint.x, startPoint.y, xIntercept, endPoint.y);
    return shape;
  }
  // this calculates the right shape when cut
  public Shape rightShape(Shape lineShape, float x1, float y1, float x2, float y2) {
    float  xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector endPoint = lineShape.getEnd();
    PVector startPoint = lineShape.getStart();
    Shape shape = new Shape(xIntercept, startPoint.y, endPoint.x, endPoint.y);
    return shape;
  }

  public PVector getStart() {
    return start;
  }
  public PVector getEnd() {
    return end;
  }

  // calculates what shape is being cut and returns the index
  public int whatShape(Shape lineShape, float x1, float y1, float x2, float y2, int index) {
    PVector startPoint = lineShape.getStart();
    PVector endPoint = lineShape.getEnd();
    float  xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);

    if (xIntercept>startPoint.x && xIntercept<endPoint.x && y2> startPoint.y ||xIntercept>startPoint.x && xIntercept<endPoint.x && y2< startPoint.y  ) {

      return index;
    }
    return -1;
  }


  // edits the main lines on screen once they have been cut from left
  public void editLeft(Shape lineShape, float x1, float y1, float x2, float y2) {
    float xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector startPoint =  lineShape.getStart();
    startPoint.x = xIntercept;
  }
  // edits the main lines on screen once they have been cut from right
  public void editRight(Shape lineShape, float x1, float y1, float x2, float y2) {
    float  xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector endPoint =  lineShape.getEnd();
    endPoint.x = xIntercept;
  }
  // does the falling animation for shape
  public void fall(Shape select) {
    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();
    startPoint.y = startPoint.y +fallSpeed;
    endPoint.y = endPoint.y +fallSpeed-0.1;
    startPoint.x = startPoint.x+random(0.0, 3);
    endPoint.x = endPoint.x-random(0.0, 3);
    countSpin++;


    if (endPoint.x<startPoint.x && countSpin>1000) {
      endPoint.x = endPoint.x+random(0.0, 6);
      startPoint.x = startPoint.x-random(0.0, 6);
    }
  }

  // does the freeze falling animation for freeze mode
  public void freeze(Shape select) {
   
    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();
    startPoint.y = startPoint.y +freezeSpeed;
    endPoint.y = endPoint.y +freezeSpeed-0.01;
  }
  // does the freeze grow animation for freeze mode
  public void freezeGrow(Shape select) {

    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();

    if (startPoint.x>intialStartX) {


      if (count7<60) {
        startPoint.x = startPoint.x-freezeSpeed;
      }
      if (count7>=60 && count7<=95) {
        startPoint.x = startPoint.x+freezeSpeed-0.05;
        if (count7==95) {
          count7=0;
        }
      }
      count7= count7+1;
    }

    if (endPoint.x<intialEndX) {

      if (count2<60) {
        endPoint.x = endPoint.x+freezeSpeed;
      }
      if (count2>=60 && count2<=95) {
        endPoint.x = endPoint.x-freezeSpeed+0.05;
        if (count2==95) {
          count2=0;
        }
      }
      count2 = count2+1;
    }
  }
  // was used for stuck array, not using anymore
  public void stuck(Shape select) {
    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();

    startPoint.y = height;
  }


  // regrow method for lines when cut  
  public void reGrow(Shape select) {


    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();

    if (startPoint.x>intialStartX) {


      if (count7<60) {
        startPoint.x = startPoint.x-growthSpeed;
      }
      if (count7>=60 && count7<=95) {
        startPoint.x = startPoint.x+growthSpeed-0.5;
        if (count7==95) {
          count7=0;
        }
      }
      count7= count7+1;
    }

    if (endPoint.x<intialEndX) {

      if (count2<60) {
        endPoint.x = endPoint.x+growthSpeed;
      }
      if (count2>=60 && count2<=95) {
        endPoint.x = endPoint.x-growthSpeed+0.5;
        if (count2==95) {
          count2=0;
        }
      }
      count2 = count2+1;
    }
  }

  // this is my intersect method which took me 3 weeks to perfect
  // effectively the intersection method works out a simultaneous equation
  // the equation looks like mx+b = mx+b
  // hard part was cancelling out numbers and putting them on the otherside of the equation
  // However i finally done it and im proud! Ill step through it inside the method
  public float intersect(Shape select, float x1, float y1, float x2, float y2) {
    // intialises b(y intercept)
    float b =0;
    float bL =0;


    PVector startLine = select.getStart();
    PVector endLine = select.getEnd();


    //workout for m(slope of mouseline);

    float workY = y2-y1;
    float workX = x2-x1;
    float m = workY/workX;


    //workout b(y intercept)

    float mx = m*x1;
    // finds out if no. is pos or neg, then switches operator around
    // to cancel out
    if (mx>0) {


      //pos number
      b = y1-mx;
    }
    else if (mx<=0) {
      mx = -mx;

      //neg number
      b = y1+mx;
    }


    //workout m(slope of line)
    float lineY = endLine.y - startLine.y;
    float lineX = endLine.x -startLine.x;
    float mL = lineY/lineX;

    //workout b(y intercept)
    float mxL = mL*startLine.x;
    // finds out if no. is pos or neg, then switches operator around
    // to cancel out
    if (mxL>=0) {
      mxL = -mxL;
      bL = startLine.y +(mxL);
    }

    else if (mxL<=0) {
      mxL = -mxL;
      bL = startLine.y -mxL;
    }

    //m(x)+b = mL(x)+bL

      // below moves bL to the otherside of equation

    if (bL<0) {
      // turns number into positive
      bL = bL;
      b = b+bL;
    }
    else if (bL>=0) {
      bL = -bL;

      b = b+(bL);
    }
    // samething applies here, working out if no. is pos or neg
    // then flipping operator to cancel out

    if (m<0) {
      m = -m;
      mL = mL+m;
    }
    else if (m>=0) {
      mL = mL-m;
    }



    // finally when we have x on its own, we can divide m from it

    float xIntercept = b/(mL);

    return xIntercept;
  }
}


