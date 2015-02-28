
/*
  Lines and circles 2.
  Trying d1 approach with everything inside draw using the
  functions fill() and noFill().
*/


void setup(){
 background(255);
 // Create the background lines 
// for(int i=100;i>0;i=i-2){
//   rect(0,0,i,i); 
//  } 
  // Decrease framerate to see the creation process
  frameRate(2);
}

// Counter for circles
int e=70;
int r=100;


void draw(){
  // Draw a circle
  noFill();
  rect(0,0,r,r);
  fill(100);
  ellipse(e,50,e,e);
  e -= 4;
  r -= 2;
}


