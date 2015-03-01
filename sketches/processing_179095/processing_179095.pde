
PFont f;
// The radius of a circle
float r = 100;
// The width and height of the boxes
float w = 4;
float h = 4;

void setup() {
  size(320, 320);
}
float theta;float rayon=20;int er;
void draw() {
//  background(255);
  
  // Start in the center and draw the circle
  translate(width / 2, height / 2);

 er++;
 theta-=radians(1);

//like y ;
 rayon=150*sin(theta*4);
    // Polar to cartesian coordinate conversion

    // Rotate the box
   
noStroke();
    rectMode(CENTER);
    rect(rayon*cos(theta), rayon*sin(theta),w,h);  
  
}
