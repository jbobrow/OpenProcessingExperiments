
/*
  Lines and circles.
  Adaptation from examples on
  "Algorithms for Visual Design Using the Processing Language"
  chapter 1 examples
*/


void setup(){
 background(255);
 // Create the background lines 
 for(int i=100;i>0;i=i-2){
   rect(0,0,i,i); 
  } 
  // Decrease framerate to see the creation process
  frameRate(2);
}

// Counter for circles
int e=70;

void draw(){
  // Draw a circle
  ellipse(e,50,e,e);
  e -= 4;
}


