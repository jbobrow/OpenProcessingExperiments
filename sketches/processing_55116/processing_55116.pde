
// define our shape variable

PShape tri1;

 
float angle;
float jitter;
 
float angle2;
float jitter2;
 
float tri1Scale;

 
// set up our app borders
void setup() {
  // set the size of our app
  size(270,270);
   
  // find our shape
 
  tri1 = loadShape("vibrate.svg");
  
   
  // anti-alias that shit!
  smooth();
   
  //noLoop();
  frameRate(60);
   
  shapeMode(CENTER);
}
 
// draw our shape
void draw() {
  // set a background
  background(255,255,255);
   
  // every three seconds, change up the rotation and scale!
  if (second() % 5 == 0) { 
    jitter = random(0.5, 3.5);
    jitter2 = random(0.5, 3.5); 
  }
   
  angle = angle + jitter;
  angle2 = angle2 + jitter2;
   
  tri1Scale = jitter*10;
  
   
  
   
  // start our animation loop
  pushMatrix();
  float c = cos(angle);
   
  // reposition the object in the center of the screen
  translate(width/2, height/2);
  
  shape(tri1, 0, 0, 250-tri1Scale, 250-tri1Scale);
  popMatrix();
   
  // start our animation loop
  pushMatrix();
  float c2 = cos(angle);
   
 
 

  popMatrix();
}


