
// From Triangle Ribbon to Ribbon Mandala
// sabrinaverhage.com
//
// MOUSE
// click          : reset


PImage img;
 
int arrayLength = 12; //amount of circles in mandala
Snake[] snakes = new Snake[arrayLength];
float dividePoints[] = new float[arrayLength+1];
float dividemidPoints[] = new float[arrayLength];
float distanceBetween[] = new float[arrayLength];
int divide = arrayLength;

int factor = 2;  //ribbon width-height-ratio
float snakeWidthfactor;
int left, top;


void setup() {
  
  size(800, 800, P2D);
  background(240);

  img = loadImage("image.jpg");
  
//  //center image
//  left = (width - img.width) / 2;
//  top = (height - img.height) / 2;

  int maxCircles = height/2; //max dim
  int avg_snakeWidth = floor(maxCircles/divide);
  
  //Calculate division:
  // fill array with divide lines
  for (int i = 0; i < dividePoints.length; i++) {     
    if(i == 0) {
      dividePoints[i] = 0;
    } else if(i > 0 && i < dividePoints.length-1) {
      dividePoints[i] = i*avg_snakeWidth+floor(random(avg_snakeWidth));
    } else if(i == dividePoints.length-1) {
      dividePoints[i] = maxCircles; 
    }    
  }   
  // find divide lines midpoints
  for (int i = 0; i < dividePoints.length; i++) {  
    if(i > 0) {
      distanceBetween[i-1] = dist(0, dividePoints[i], 0, dividePoints[i-1]);
      //println(distanceBetween[i-1]);
      dividemidPoints[i-1] = dividePoints[i-1]+distanceBetween[i-1]/2;
    }  
  } 
  
  //Fill array with snakes
  for (int i = 0; i < snakes.length; i++) {
    //distance of one degree/oneArc
    float oneArc = (2*PI*dividemidPoints[i])/360;
    //than how many 'oneArc' is required distance....
    snakeWidthfactor = floor(((distanceBetween[i]/2)/oneArc)*factor); 
    snakeWidthfactor = optimizeStepsize(snakeWidthfactor);
    //if ((360-snakeWidthfactor) % snakeWidthfactor != 0) println("this is i: " + i + " and this is step: " + snakeWidthfactor);

    snakes[i] = new Snake(dividemidPoints[i], int(random(360)), snakeWidthfactor, int(random(1,7)));
  }

  
}

//optimize stepsize so ribbons line up
float optimizeStepsize(float stepsize) {
  for (int i = 0; i < 100; i++) {
    if ((360-stepsize) % stepsize != 0) {
      stepsize -= 1;
    } else {
      break; 
    }
  }
  return stepsize;
}

void draw() {
   
  //center Mandala
  pushMatrix();
  translate(width/2, height/2);
  
  // draw ribbons/snakes
  for (int i = 1; i < snakes.length; i++) {
    if(snakes[i].iscomplete == false) {
        snakes[i].calculate();
        snakes[i].pattern();
        snakes[i].draw();
    }
  }
  
  popMatrix();
}

void mousePressed() {
  setup();
}




class Snake {
  
  // all this stuff needed for ribbons
  float x, y, px, py, ppx, ppy;
  float d, pd;
  float deltaX, deltaY, pdeltaX, pdeltaY;
  float midPointx, midPointy, pmidPointx, pmidPointy;
  float directionAngle, pdirectionAngle;
  float xis, yis, pxis, pyis;
  // and midpoints...
  float mldeltaX, mldeltaY, mrdeltaX, mrdeltaY;
  float tmidPointx, tmidPointy, rtmidPointx, rtmidPointy;
  float lhmdeltaX, lhmdeltaY, rhmdeltaX, rhmdeltaY;
  float lhmidPointx, lhmidPointy, rhmidPointx, rhmidPointy;
  float tlhmdeltaX, tlhmdeltaY, trhmdeltaX, trhmdeltaY;
  float tlhmidPointx, tlhmidPointy, trhmidPointx, trhmidPointy;
  float plhmdeltaX, plhmdeltaY, prhmdeltaX, prhmdeltaY;
  float plhmidPointx, plhmidPointy, prhmidPointx, prhmidPointy;
  
  // color stuff
  color test;
  color cp1, cp2, cp3;
  
  float r;
  int deg, begindeg;
  float stepsize;
  int randomnumber; 
  
  boolean iscomplete = false;
  
  Snake(float radius, int degrees, float step, int randnum) {
    r = radius;
    deg = degrees;
    begindeg = degrees;
    stepsize = step;
    randomnumber = randnum;
  }
  
  void calculate() {
    
    x = r * cos(radians(deg));
    y = r * sin(radians(deg));
    px = r * cos(radians(deg-stepsize));
    py = r * sin(radians(deg-stepsize));
    ppx = r * cos(radians(deg-(stepsize*2)));
    ppy = r * sin(radians(deg-(stepsize*2)));
    
    // midpoints...
    d = dist(x, y, px, py);
    pd = dist(px, py, ppx, ppy);
    
    deltaX = x-px;
    deltaY = y-py;
    pdeltaX = px-ppx;
    pdeltaY = py-ppy;
    
    midPointx = x-deltaX/2;
    midPointy = y-deltaY/2;
    pmidPointx = px-pdeltaX/2;
    pmidPointy = py-pdeltaY/2;
    
    directionAngle = atan2(deltaY, deltaX);
    pdirectionAngle = atan2(pdeltaY, pdeltaX);
      
    xis = (d * cos(radians(90) + directionAngle))/factor;
    yis = (d * sin(radians(90) + directionAngle))/factor;
    pxis = (pd * cos(radians(90) + pdirectionAngle))/factor;
    pyis = (pd * sin(radians(90) + pdirectionAngle))/factor;
    
    // and in between midpoints...
    mldeltaX = (midPointx+xis)-(pmidPointx+pxis);
    mldeltaY = (midPointy+yis)-(pmidPointy+pyis);
    mrdeltaX = (midPointx-xis)-(pmidPointx-pxis);
    mrdeltaY = (midPointy-yis)-(pmidPointy-pyis);
    
    tmidPointx = (midPointx+xis)-mldeltaX/2;
    tmidPointy = (midPointy+yis)-mldeltaY/2;
    rtmidPointx = (midPointx-xis)-mrdeltaX/2;
    rtmidPointy = (midPointy-yis)-mrdeltaY/2;  
  
    // horizontal midpoints...
    lhmdeltaX = (midPointx+xis)-midPointx;
    lhmdeltaY = (midPointy+yis)-midPointy;
    rhmdeltaX = (midPointx-xis)-midPointx;
    rhmdeltaY = (midPointy-yis)-midPointy;
    
    lhmidPointx = (midPointx+xis)-lhmdeltaX/2;
    lhmidPointy = (midPointy+yis)-lhmdeltaY/2;
    rhmidPointx = (midPointx-xis)-rhmdeltaX/2;
    rhmidPointy = (midPointy-yis)-rhmdeltaY/2;
    
    // and in between horizontal midpoints
    tlhmdeltaX = tmidPointx-px;
    tlhmdeltaY = tmidPointy-py;
    trhmdeltaX = rtmidPointx-px;
    trhmdeltaY = rtmidPointy-py;
    
    tlhmidPointx = tmidPointx-tlhmdeltaX/2;
    tlhmidPointy = tmidPointy-tlhmdeltaY/2;
    trhmidPointx = rtmidPointx-trhmdeltaX/2;
    trhmidPointy = rtmidPointy-trhmdeltaY/2;
    
    // previous horizontal midpoints
    plhmdeltaX = (pmidPointx+pxis)-pmidPointx;
    plhmdeltaY = (pmidPointy+pyis)-pmidPointy;
    prhmdeltaX = (pmidPointx-pxis)-pmidPointx;
    prhmdeltaY = (pmidPointy-pyis)-pmidPointy;
    
    plhmidPointx = (pmidPointx+pxis)-plhmdeltaX/2;
    plhmidPointy = (pmidPointy+pyis)-plhmdeltaY/2;
    prhmidPointx = (pmidPointx-pxis)-prhmdeltaX/2;
    prhmidPointy = (pmidPointy-pyis)-prhmdeltaY/2;
    
    float widthOfSnake = dist(midPointx+xis, midPointy+yis, midPointx-xis, midPointy-yis);
    //println("radius:" + r + " and stepsize:" + stepsize + " and width:" + widthOfSnake + " and between points:" + d);
         
    // calculate colors
    test = color(deg/2, 255-deg/2, 134);
    cp1 = img.get(int(x+width/2-left),int(y+height/2-top)); //get color from x and y
    cp2 = img.get(int(px+width/2-left),int(py+height/2-top)); //get color from px and py
    cp3 = img.get(int(ppx+width/2-left),int(ppy+height/2-top)); //get color from ppx and ppy

  }
  
  
  void pattern() {
    
    strokeWeight(1);
    if(randomnumber == 1) { //diamonds
      
      //noStroke();
      // inside left
      beginShape();
      fill(cp2);
      vertex(px, py);
      vertex(midPointx+xis, midPointy+yis);
      vertex(x, y);  
      
      endShape(CLOSE);
      
      // inside right
      beginShape();
      fill(cp3);
      vertex(px, py); 
      vertex(midPointx-xis, midPointy-yis);
      vertex(x, y);  
      
      endShape(CLOSE);
          
      // outside left
      beginShape();
      fill(cp1);
      vertex(px, py);  
      vertex(midPointx+xis, midPointy+yis);
      vertex(pmidPointx+pxis, pmidPointy+pyis);  
      
      endShape(CLOSE);
      
      // outside right
      beginShape();
      fill(cp1);
      vertex(px, py);  
      vertex(midPointx-xis, midPointy-yis);
      vertex(pmidPointx-pxis, pmidPointy-pyis); 
      
      endShape(CLOSE);
      
    } else if(randomnumber == 2) { //teeth
      
      noStroke();
      beginShape();
      fill(cp1);
      vertex(midPointx+xis, midPointy+yis);
      vertex(midPointx-xis, midPointy-yis);
      vertex(pmidPointx-pxis, pmidPointy-pyis);
      
      endShape(CLOSE);
      
      beginShape();
      fill(0);
      vertex(midPointx+xis, midPointy+yis);
      vertex(pmidPointx+pxis, pmidPointy+pyis);
      vertex(pmidPointx-pxis, pmidPointy-pyis);
      
      endShape(CLOSE);
      
    } else if(randomnumber == 3) { //miniTriangles
      
      noStroke();
      //println(frameCount);
      if(deg <= begindeg+(360-stepsize)) if(frameCount % 2 == 0) {
              
        beginShape();
        fill(cp1);
        vertex(midPointx, midPointy);
        vertex(trhmidPointx, trhmidPointy);
        vertex(tlhmidPointx, tlhmidPointy); 
        
        endShape(CLOSE);
        
        beginShape();
        vertex(px, py);
        vertex(plhmidPointx, plhmidPointy);
        vertex(prhmidPointx, prhmidPointy);
        
        endShape(CLOSE);
        
      } else {
        beginShape();
        fill(cp1);
        vertex(lhmidPointx, lhmidPointy);
        vertex(rhmidPointx, rhmidPointy); 
        vertex(px, py);
        
        endShape(CLOSE);
        
        beginShape();
        vertex(trhmidPointx, trhmidPointy);
        vertex(tlhmidPointx, tlhmidPointy); 
        vertex(pmidPointx, pmidPointy);
        
        endShape(CLOSE);
        
      } 
    } else if(randomnumber == 4) { // squares
      
      noStroke();
      beginShape();
      fill(cp1);
      vertex(midPointx+xis, midPointy+yis);
      vertex(midPointx, midPointy);
      vertex(px, py);
      vertex(tmidPointx, tmidPointy);
      
      endShape(CLOSE);
      
      beginShape();
      fill(0);
      vertex(midPointx-xis, midPointy-yis);
      vertex(midPointx, midPointy);
      vertex(px, py);
      vertex(rtmidPointx, rtmidPointy);
      
      endShape(CLOSE);
      
        
      beginShape();
      fill(0);
      vertex(px, py);
      vertex(tmidPointx, tmidPointy);
      vertex(pmidPointx+pxis, pmidPointy+pyis);
      vertex(pmidPointx, pmidPointy);
      
      endShape(CLOSE);
      
      beginShape();
      fill(cp2);
      vertex(rtmidPointx, rtmidPointy);
      vertex(px, py);
      vertex(pmidPointx, pmidPointy);
      vertex(pmidPointx-pxis, pmidPointy-pyis);
      
      endShape(CLOSE);
      
    } else if(randomnumber == 5) { // black line

      //line(x, y, px, py);      
      fill(0);
      noStroke();
      beginShape();     
      vertex(x, y);
      vertex(px, py);
      vertex(px+pxis, py+pyis);
      vertex(x+xis, y+yis);
      endShape(CLOSE); 
      
    } else if(randomnumber == 6) { // stripes
      
      fill(cp2);
      beginShape();     
      vertex(x-xis, y-yis);
      vertex(midPointx-xis, midPointy-yis);
      vertex(midPointx+xis, midPointy+yis);
      vertex(x+xis, y+yis);
      endShape(CLOSE); 
      
    } else {
      // possibility to add more patterns
    }
    
  }
  
  
  void draw() {
    
    strokeWeight(2);
    stroke(0);
    // outside lines between side points
    line(midPointx+xis, midPointy+yis, pmidPointx+pxis, pmidPointy+pyis); 
    line(midPointx-xis, midPointy-yis, pmidPointx-pxis, pmidPointy-pyis);
   
    // draw circle
    if (deg <= begindeg+(360-stepsize)) {
      deg += stepsize;
    } else if(deg > begindeg+(360-stepsize)) {
      iscomplete = true; 
    }
    
  }
  
} //end class


