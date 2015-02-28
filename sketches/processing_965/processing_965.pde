
/* Worm
 demonstrates springs in a series */
 
/*  This code is taken from Ira Greenberg's book.  I made his original, crawly worm leave
behind a color trail.  I claim no responsibilty for knowing how to code this stuff, I'm
just learning and having fun creating.  

Many, many thanks to Ira for all the great code samples.

I'm also trying to learn how to take color from an image sample.  If anyone can help out
with that, I'd be very grateful.

Tks,
Jeff - 1/31/09
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
float fAngle, fSpeedX = .6, fSpeedY = .9;



void setup(){
  size(400, 400);
  smooth();
  
  // initialize array values
  for (int i=0; i<segments; i++){
    /* need to decrease both springing and 
     damping values as segments increase */
    springing[i] = .05*(0.05*(i+1)); 
    damping[i] = .95-(.02*i);  
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
    x[i] += accelX[i];
    y[i] += accelY[i];

    stroke(0, 0, 0, 100);
    strokeWeight(0.25);
    fill(0, random(255), random(255), 50);
    // draw worm
    if (i<segments/2){
      ellipse(x[i], y[i], i, i);
    } 
    else {
      ellipse(x[i], y[i], segments-i, segments-i);
    }
    // slow down springing
    accelX[i] *= damping[i];
    accelY[i] *= damping[i];
  }
}



