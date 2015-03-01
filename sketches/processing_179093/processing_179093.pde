
PFont f;
// The radius of a circle
float r = 100;
// The width and height of the boxes
float w = 4;
float h = 4;

void setup() {
  size(320, 320);

}
float theta;float rayon;
void draw() {
//  background(255);
  noStroke();
  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  


  // Our curve is a circle with radius r in the center of the window.
// noFill(); ellipse(0, 0, r*2, r*2);


 // float arclength = 0;
//arclength += w/2;
//  float theta = arclength / r;     
// theta+=radians(1); 
// like  x
 theta+=radians(1); 
//like y ;
 rayon+=0.1*cos(radians(1));
    // Polar to cartesian coordinate conversion

    // Rotate the box

    rectMode(CENTER);
    rect(rayon*cos(theta), rayon*sin(theta),w,h);  
  
}
