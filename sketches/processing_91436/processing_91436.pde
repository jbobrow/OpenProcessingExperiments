
// Rhys Martindale

// In this I wanted to create a sphere of spheres that could be controlled by the mouse
// My initial attemp at achieveing this sketch is here:

//import processing.opengl.*;
//int noSpheres = 7;
//
//void setup() {
//  size(600, 600, OPENGL);
//  background(0);
//  fill(255);
//  noStroke();
//  smooth();
//}
//
//void draw() {
//  background(0);
//  lights();
//  stroke(255, 0, 0);
//  line(0, height/2, width, height/2); 
//  line(width/2,0, width/2, height); 
//  noStroke();
//  translate(width/2, height/2, -300);
////  rotateZ(frameCount*0.01); // rotate on the Y axis
////  rotateY(frameCount*0.01); // rotate on the Y axis
//  rotateX(frameCount*0.01); // rotate on the Y axis
////  rotateY(HALF_PI);
//  for (int x=0; x<noSpheres; x++) {
//  
//    rotateX(TWO_PI/noSpheres);
//
//    for (int i=0; i<noSpheres; i++) { 
//      pushMatrix();
//      translate(0, 0, mouseX);
//      sphere(25);
//      popMatrix();
//      rotateY(TWO_PI/noSpheres);
//    }
//  }
//}

// Obviously the spheres are not spaced evenly around the sphere as I'd hoped.
// A little bit of research turned up fibonacci helixes as a method of achieving my goal, and I fhound an opensource sketch which I used as a base.
// My hacked and annotated code is next and that is followed by the opensouce code I used in its entire unedited form for comparison.



import processing.opengl.*; // import OPENGL library;

float rotationX = 0; //define rotation and velocity variables
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;

float phi = (sqrt(5)+1)/2 - 1; // golden ratio - original note
float ga = phi*2*PI;           // golden angle - original note

int nbrPoints = 50; // define the number of points around the sphere

void setup() // setup the workarea
{
  size(600, 600, OPENGL); // define the screen size and initiate the OPENGL library
  noStroke(); // turn off strokes


  initSphere(); // plot the points on the sphere

  colorMode(HSB, 1); // convert to Hue Saturation Brightness mode
  background(0); // set the colour to black
}

void draw() // start looping
{   

  background(0); // refresh the background
  smooth(); // smooth out the lines
  lights(); // turn on the lights so the 3d geometry can render

  renderGlobe(); // draw the globe

  rotationX += velocityX; // add the velocity figures to the rotation figures.
  rotationY += velocityY;
  velocityX *= 0.95; // friction
  velocityY *= 0.95; // friction

  // Implements mouse control (interaction will be inverse when sphere is  upside down) - original note
  if (mousePressed) { // when the mouse is pressed...
    velocityX += (mouseY-pmouseY) * 0.01; // ... vary the velocityX and y valuds baesed on the speed of the mouse
    velocityY -= (mouseX-pmouseX) * 0.01;
  }
}



//// opensource code used for reference:
///**
// * A fast method for getting an arbitrary number of equidistant points on a sphere.
// * Draws a fibonacci spiral down from the pole, which maintains uniform surface area.
// *
// * Click to toggle point adding.
// *
// * Jim Bumgardner 10/6/2011
// */
// 
//import processing.opengl.*;
// 
//float R = 277;
// 
//float rotationX = 0;
//float rotationY = 0;
//float velocityX = 0;
//float velocityY = 0;
//float pushBack = 0;
// 
//float phi = (sqrt(5)+1)/2 - 1; // golden ratio
//float ga = phi*2*PI;           // golden angle
// 
//int kMaxPoints = 100000;
// 
//int nbrPoints = 2000;
// 
//// To add: Give each point a heading and velocity, adjust based on distance/heading to nearby points.
////
//class SpherePoint {
//  float  lat,lon;
//  SpherePoint(float lat, float lon)
//  {
//    this.lat = lat;
//    this.lon = lon;
//  }
//};
// 
//SpherePoint[] pts = new SpherePoint[kMaxPoints];
// 
//boolean addPoints = true;
// 
//void initSphere()
//{
//  for (int i = 1; i <= min(nbrPoints,pts.length); ++i) {
//    float lon = ga*i;
//    lon /= 2*PI; lon -= floor(lon); lon *= 2*PI;
//    if (lon > PI)  lon -= 2*PI;
// 
//    // Convert dome height (which is proportional to surface area) to latitude
//    float lat = asin(-1 + 2*i/(float)nbrPoints);
// 
//    pts[i] = new SpherePoint(lat, lon);
//  }
//}
// 
//void setup()
//{
//  // size(1024, 768, P3D); 
//  size(600, 600, P3D); 
//  R = .8 * height/2;
//   
//  initSphere();
//   
//  colorMode(HSB, 1);
//  background(0);
// 
// 
//}
// 
//void draw()
//{   
//  if (addPoints) {
//    nbrPoints += 1;
//    nbrPoints = min(nbrPoints, kMaxPoints);
//    initSphere();
//  }
// 
//  background(0);           
//  smooth();
// 
//  renderGlobe();
// 
//  rotationX += velocityX;
//  rotationY += velocityY;
//  velocityX *= 0.95;
//  velocityY *= 0.95;
//   
//  // Implements mouse control (interaction will be inverse when sphere is  upside down)
//  if(mousePressed){
//    velocityX += (mouseY-pmouseY) * 0.01;
//    velocityY -= (mouseX-pmouseX) * 0.01;
//  }
//}
// 
// 
//void renderGlobe()
//{
//  pushMatrix();
//  translate(width/2.0, height/2.0, pushBack);
//   
//  float xRot = radians(-rotationX);
//  float yRot = radians(270 - rotationY - millis()*.01);
//  rotateX( xRot ); 
//  rotateY( yRot );
//  
// 
//  strokeWeight(3);
//   
//  float elapsed = millis()*.001;
//  float secs = floor(elapsed);
//   
//  for (int i = 1; i <= min(nbrPoints,pts.length); ++i)
//  {
//      float lat = pts[i].lat;
//      float lon = pts[i].lon;
// 
//      pushMatrix();
//      rotateY( lon);
//      rotateZ( -lat);
//      float lum = (cos(pts[i].lon+PI*.33+yRot)+1)/2;
//      stroke(.5,.5*lum,.2+lum*.8);
//       
//      point(R,0,0);
//       
//      popMatrix();
//  }
// 
//  popMatrix();
//   
//}
// 
//void mouseClicked()
//{
//  addPoints = !addPoints;
//}


