
/* Worm
 demonstrates springs in a series */
 
 /*  This is also from Ira Greenberg's code.  I've changed the ellipses to
 rectangles and tweaked the variables in a way that makes
 them jump in their pattern, very quickly.
 */

// for worm
int segments = 40;  //smaller num gives tighter size range also
float[] x = new float[segments];
float[] y = new float[segments];
float[] accelX = new float[segments];
float[] accelY = new float[segments];
float[] springing = new float[segments];
float[] damping = new float[segments];
float[] w = new float[segments];
float[] h = new float[segments];
color[] colors = new color[segments];

// for food
float fx, fy;
float fCntrX, fCntrY;
float fAngle, fSpeedX = 0.7, fSpeedY = 0.6;

void setup(){
  background(0);
  size(400, 400);
  smooth();
  // initialize array values
  for (int i=0; i<segments; i++){
    /* need to decrease both springing and 
     damping values as segments increase */
    springing[i] = .854*(0.2*(i+1));  //this config really speeds it up and spaces out the rects
    damping[i] = .55-(.03*i);  //damping[i] = .95-(.02*i);   really small first var makes it paint the lines
  }

  // food center
  fCntrX = width/4;
  fCntrY = height/4;
}

void draw(){
  for (int i=0; i<segments; i++){
    fill(colors[i]);
    rect(x[i], y[i], w[i], h[i]);
    x[i]+=accelX[i];
    y[i]+=accelY[i];
  }
  createFood();
  createWorm();
}
//save a capture
/*
void mousePressed() {
  save("worm4-130.tif");
}  */

void createFood(){
  // food moves in random wave pattern
  fx = fCntrX + sin(radians(fAngle))*random(25);  // fx = fCntrX + cos(radians(fAngle))*random(25);
  fy = fCntrY + tan(radians(fAngle))*random(25);  // fy = fCntrY + sin(radians(fAngle))*random(25);

  fCntrX+=fSpeedX;
  fCntrY+=fSpeedY;

  fAngle+=random(-150, 150);  //   fAngle+=random(-6, 6);

  // keep food within display window
  if (fCntrX>width-25 || fCntrX<25 ){
    fSpeedX*=-1;
  } 
  if (fCntrY>height-25 || fCntrY<25 ){
    fSpeedY*=-1;
  }
}

void createWorm(){
  float[] deltaX = new float[segments];
  float[] deltaY  = new float[segments];

  for (int i=0; i<segments; i++){
    // lead ellipse
    if (i==0){

      /* food position used to calculate the 
       initial ellipse of the worm */
      deltaX[i] = (fx-x[i]);
      deltaY[i] = (fy-y[i]);
    } 
    else {
   /* preceding ellipse used to calculate the 
      next ellipse of the worm */
      deltaX[i] = (x[i-1]-x[i]);
      deltaY[i] = (y[i-1]-y[i]);
    }

    // create springing effect
    deltaX[i] *= springing[i];
    deltaY[i] *= springing[i];

    accelX[i] += deltaX[i];
    accelY[i] += deltaY[i];

    // move worm
    x[i] += accelX[i];
    y[i] += accelY[i];

    
    //********  color section   ********
    //noFill();
    fill(random(255), random(255), random(255), random(100,200));
    stroke(random(255), random(255), random(255), random(100,200));
    //stroke(255, 255, 255, random(10,50));
    // draw worm
    if (i<segments/2){    //size range seems to be between this and 12  -- try it out
      rect(x[i], y[i], i, i);
    } 
    else {
     rect(x[i], y[i], segments-i, segments-i);
    }
    // slow down springing
    accelX[i] *= damping[i];
    accelY[i] *= damping[i];
  }
  
}




