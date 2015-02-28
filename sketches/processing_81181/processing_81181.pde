
float z = 0;
PImage img;
void setup() {
  // When using (x,y,z) coordinates, we must tell Processing we want a 3D sketch. 
  // This is done by adding a third argument, P3D (or OPENGL), to the size() function. 
  size(480,270,P3D); 
  img = loadImage("mlb.jpg");
}

void draw() {
  background(255);
  image(img,0,0);
  fill(255);
  frameRate(90000);
  //not sure if this makes a difference but when i reduce it, the movement is slower
  
  // Translate to a point before displaying a shape there
  translate(width/2,height/2,z);
  ellipseMode(CENTER);
  ellipse(0,8,4,4); 
  // again 8 for positions and 4 for size of ball
  
  // Increment z (i.e. move the shape toward the viewer)
  z++ ;
  
  // Re loop action of ball
  if (z > 250) {
    z = 0;
  }
  
  
  
}
// Got code from: http://www.learningprocessing.com/examples/chapter-14/example-14-3/




