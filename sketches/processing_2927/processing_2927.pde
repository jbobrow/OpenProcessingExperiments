
// Hilbert, by Charles Morrice
// recursively draws Hilbert peano curve
// move the mouse left and right to set the minimum scale of the recursion
// The Hilbert Curve is an example of a Peano curve: a one dimensional curve which eventually will cover 2-dimensional space.

float level;

void setup()
{
  size(512,512);
  background(0);
  colorMode(HSB, width);
}

void draw()
{
   if (pmouseX<width/8) {            // gets the minimum scale from the mouse position
       level=width/4; 
     } else if (pmouseX<2*width/8) {
       level=width/8; 
     } else if (pmouseX<3*width/8) {
       level=width/16; 
     } else if (pmouseX<4*width/8) {
       level=width/32; 
     } else if (pmouseX<5*width/8) {
       level=width/64; 
     } else if (pmouseX<6*width/8) {
       level=width/128; 
     } else if (pmouseX<7*width/8){
       level=width/256;
     } else if (pmouseX<width){
       level=width/512;
     }
   pushMatrix();
   translate(width/4,height/4);
   background(0);
   Left(width/2, level);                // Starts drawing with a left hand U shape
   popMatrix();                         // need this 'cos the various scales stop in different places
   }
void Left(float H, float end) {        // Left Hand U shape length H, recursively down to scale 'end'
  if (H > end)  {
    //first draw the initial LH-shape
    Grayer(H);//getting grayer
    Fwd(H);
    rotate(-PI/2);
    Fwd(H);
    rotate(-PI/2);
    Fwd(H);
    H=H/2;                            // The recursive bit, building the smaller curve from 4 recursive components
    if (H > end) {                    // Test for min scale
      Grayer(H);                      // set colour
      rotate(PI); translate(-2*H,0);  // set starting position for smaller scale
      translate(-H/2,-H/2);
      rotate(-PI/2);
      Right(H, end);
      rotate(-PI/2);
      FwdR(H, end);
      Left(H, end);
      rotate(+PI/2);
      FwdL(H, end);
      rotate(+PI/2);
      Left(H, end);
      FwdR(H, end);
      rotate(-PI/2);
      Right(H, end);
      translate(-H/2,-H/2);           //to join up again with one scale higher
      rotate(-PI/2);
    }
  }
}
void Right(float H, float end) {        // Right handed 'U' shape, recursively adding detail down to scale 'end'
  if (H > end){
    Grayer(H);//                        // first draw the initial 'U' shape.
    Fwd(H);
    rotate(+PI/2);
    Fwd(H);
    rotate(+PI/2);
    Fwd(H);
    H=H/2;                              // next scale down, build smaller scale shape recursively from components
    if (H > end) {                      // test for min scale
      Grayer(H);                        // set colour
      rotate(PI); translate(2*H,0);     // back to the beginning for the recursive bit
      translate(+H/2,-H/2);             // move to start position for smaller scale
      rotate(+PI/2);
      Left(H, end);
      rotate(+PI/2);
      FwdL(H, end);
      Right(H, end);
      rotate(-PI/2);
      FwdR(H, end);
      rotate(-PI/2);
      Right(H, end);
      FwdL(H, end);
      rotate(+PI/2);
      Left(H, end);
      translate(+H/2,-H/2);            //to join up again with one scale higher
      rotate(+PI/2);
    }
  }
}
void FwdR(float f, float end) {        //forward move with recursive link additions (to the Right) down to scale 'end'
  Grayer(f);
  line(0,0,0,f);
  f=f/2;                               // set next scale 
  if (f>end){                          // test for min scale
    Grayer(f);                         // set colour
    translate(-f/2, f/2);              // move to location to draw next scale down
    FwdR(f, end);
    translate(f/2, -3*f/2);            // back to where we started
  }
  translate(0,2*f);                    // move to start point for next step
}
void FwdL(float f, float end) {        //forward move on 'inside' of shape
  Grayer(f);
  line(0,0,0,f);
  f=f/2;
  if (f>end){
    Grayer(f);
    translate(f/2, f/2);                //location to draw next scale down
    FwdL(f, end);  
    translate(-f/2, -3*f/2);            // back to where we started
  }
  translate(0,2*f);
}
void Fwd(float f) {                    //forward move with no recursion
  Grayer(f);
  line(0,0,0,f);
  translate(0,f);
}
void Grayer(float G) {                 //sets colour for various scale levels
  colorMode(HSB, 100);
  stroke(110-(log(G)/log(2))*10, 100); // ensures a linear progression of the grayscale
}


