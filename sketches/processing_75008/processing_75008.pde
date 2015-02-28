
int count7 = 0;
int count2 = 0;
float fallSpeed = 2;
float growthSpeed= 1;
int countSpin = 0;
class Shape {
  private PVector start, end;


  public Shape(float startX, float startY, float endX, float endY) {
    start = new PVector(startX, startY);
    end = new PVector(endX, endY);
  }

  public void drawer(Shape lineShape) {
    PVector startPoint= start.get();
    PVector endPoint = end.get();

    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  }
  public Shape leftShape(Shape lineShape, float x1, float y1, float x2, float y2) {
    float xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector startPoint = lineShape.getStart();
    PVector endPoint = lineShape.getEnd();
    Shape shape = new Shape(startPoint.x, startPoint.y, xIntercept, endPoint.y);
    return shape;
  }

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
  public int whatShape(Shape lineShape, float x1, float y1, float x2, float y2, int index) {
    PVector startPoint = lineShape.getStart();
    PVector endPoint = lineShape.getEnd();
    float  xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);

    if (xIntercept>startPoint.x && xIntercept<endPoint.x && y2> startPoint.y ||xIntercept>startPoint.x && xIntercept<endPoint.x && y2< startPoint.y  ) {

      return index;
    }
    return -1;
  }

  public void editLeft(Shape lineShape, float x1, float y1, float x2, float y2) {
    float xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector startPoint =  lineShape.getStart();
    startPoint.x = xIntercept;
  }

  public void editRight(Shape lineShape, float x1, float y1, float x2, float y2) {
    float  xIntercept = lineShape.intersect(lineShape, x1, y1, x2, y2);
    PVector endPoint =  lineShape.getEnd();
    endPoint.x = xIntercept;
  }

  public void fall(Shape select) {
    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();
    startPoint.y = startPoint.y +fallSpeed;
    endPoint.y = endPoint.y +fallSpeed-0.1;
    startPoint.x = startPoint.x+0.3;
    endPoint.x = endPoint.x-0.3;
    countSpin++;
    
    // disolve
    if(endPoint.x<startPoint.x && countSpin>1000){
      endPoint.x = endPoint.x+0.3;
      startPoint.x = startPoint.x-0.3;
      
    }
  
    

   
    
  }


  public void stuck(Shape select) {
    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();
    
      startPoint.y = height;
     
      
    }
  
  
  
  public void reGrow(Shape select) {

    PVector startPoint = select.getStart();
    PVector endPoint = select.getEnd();

   if (startPoint.x>intialStartX) {

      if (count7<60) {
        startPoint.x = startPoint.x-growthSpeed;
      }
      if (count7>=60 && count7<=95) {
        startPoint.x = startPoint.x+growthSpeed;
        if (count7==95) {
          count7=0;
        }
      }
      count7= count7+1;
      println(count7);
    }
    
    if (endPoint.x<intialEndX) {

      if (count2<60) {
        endPoint.x = endPoint.x+growthSpeed;
      }
      if (count2>=60 && count2<=95) {
        endPoint.x = endPoint.x-growthSpeed;
        if (count2==95) {
          count2=0;
        }
      }
      count2 = count2+1;
    
    }
  }
  public float intersect(Shape select, float x1, float y1, float x2, float y2) {

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
    if (mxL>=0) {
      mxL = -mxL;
      bL = startLine.y +(mxL);
    }

    else if (mxL<=0) {
      mxL = -mxL;
      bL = startLine.y -mxL;
    }

    //m(x)+b = mL(x)+bL

      if (bL<0) {
      // turns number into positive
      bL = bL;
      b = b+bL;
    }
    else if (bL>=0) {
      bL = -bL;

      b = b+(bL);
    }
    if(m<0){
      m = -m;
      mL = mL+m;
    }
    else if(m>=0){
      mL = mL-m;
    }

   



    float xIntercept = b/(mL);
println(xIntercept);
    return xIntercept;
  }
}


