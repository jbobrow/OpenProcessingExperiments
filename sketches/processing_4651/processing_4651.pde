
/* paintingRectangles300b
 demonstrates springs in a series */
 
/*  So here is another iteration of the painting worms code, that started from Ira Greenberg's
code in his book on Processing.  This one changes the ellipses to rectangles and throws in
bursts of speed to make it lively and chaotic.

Tks,
Jeff Hendrickson 14 Sept 09
*/

// for worm
int segments = 70;  //smaller num gives tighter size range also
float[] x = new float[segments];
float[] y = new float[segments];
float[] accelX = new float[segments];
float[] accelY = new float[segments];
float[] springing = new float[segments];
float[] damping = new float[segments];
float[]w = new float[segments];
float[]h = new float[segments];
color[]colors = new color[segments];

// for food
float fx, fy;
float fCntrX, fCntrY;
float fAngle, fSpeedX = .6, fSpeedY = .6;



void setup(){
  size(900, 400);
  smooth();
  background(255);
  
  // initialize array values
  for (int i=0; i<segments; i++){
    /* need to decrease both springing and 
     damping values as segments increase */
    springing[i] = .07*(0.07*(i+2)); 
    damping[i] = .95-(.05*i);  
  }

  // food center
  fCntrX = width/2;
  fCntrY = height/2;
}

//if you want to save a capture uncomment below
/*
void mousePressed() {
  save("worm100.tif");
}  */

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

void mousePressed()  {
  save("rectangles300-100.png");
}

void createFood(){
  // food moves in random wave pattern
  fx = fCntrX + tan(radians(fAngle))*random(25); 
  fy = fCntrY + sin(radians(fAngle))*random(25); 

  fCntrX+=fSpeedX;
  fCntrY+=fSpeedY;

  fAngle+=random(-6, 6); 

  // keep food within display window
  if (fCntrX>width-15 || fCntrX<15 ){
    fSpeedX*=-1;
  } 
  if (fCntrY>height-15 || fCntrY<15 ){
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
    x[i] += accelX[i]*10;
    y[i] += accelY[i]*10;

    stroke(0, 0, 0, 100);
    strokeWeight(0.25);
    fill(random(255), random(255), random(255), 165);
    // draw worm
    if (i<segments/2){
      //ellipse(x[i], y[i], i, i);
       rect(x[i], y[i], i, i);
    } 
    else {
      //ellipse(x[i], y[i], segments-i, segments-i);
       rect(x[i], y[i], segments-i, segments-i);
    }
    // slow down springing
    accelX[i] *= damping[i];
    accelY[i] *= damping[i];
  }
   if (millis() >= 25000) {
  noLoop();
}
}



