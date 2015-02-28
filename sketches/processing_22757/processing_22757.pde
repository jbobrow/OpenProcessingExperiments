
//03/6/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//A small modification of Shiffman's noise example, with movie capture language

//\/\/\/\/\/MOVIE MAKER STUFF\/\/\/\/\/\/\/\\
//import processing.video.*;  //MOVIEMAKER
//MovieMaker mm;

//time functions to get different noise characteristics
float t1 = 0.0;
float t2 = 0.2;
float t3 = 0.4;
float tX = 0.0;
float tY = 0.3;

//increments, the overall movement and the circle size vary in different ways
float incrementX = 0.01;
float increment = 0.1;

void setup() {
  size(500,500);
  frameRate(30);
  smooth(); 
  background(100, 200, 200);
  
  //\/\/\/\/\/MOVIE MAKER STUFF\/\/\/\/\/\/\/\\
 // mm = new MovieMaker(this, width, height, "perlin2.mov", 30, MovieMaker.JPEG,MovieMaker.HIGH);
}

void draw() {
  noStroke();
  
  //thi rectangle "fades" the drawing slowly
  fill(100, 200, 200, 1);
  rect(0, 0, width, height);
  
  //\/\/\/\/\/MOVIE MAKER STUFF\/\/\/\/\/\/\/\\
  //loadPixels();
  //mm.addFrame(pixels,width,height);
  
   // Get a noise value at "time" and scale it for each dot.
  float n = noise(t1)*40;
  float m = noise(t2)*80;
  float o = noise(t3)*20;
  
  //get a noise value at time and scale it for movement
  float x = noise(tX)*width;
  float y = noise(tY)*height;
  
  // With each cycle, increment the " time "
  t1 += increment;
  t2 += increment;
  t3 += increment;
  tX += incrementX;
  tY += incrementX;
  
  // Draw the ellipse with size determined by Perlin noise
  stroke(255);
  fill(n, 50, 80);
  ellipse(x-m, y-m, m, m);
  ellipse(x+o, y+o, o, o);
  ellipse(x-n, y+n, n, n);
}

//void mousePressed(){
//  saveFrame("screenshot.jpg");
  
  //\/\/\/\/\/MOVIE MAKER STUFF\/\/\/\/\/\/\/\\
  //mm.finish();
//}

