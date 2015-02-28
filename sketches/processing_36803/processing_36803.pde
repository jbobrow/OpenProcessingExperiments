

//
float x, y;

void setup() {
  smooth();
  size(300, 300);
  colorMode(HSB,100);
  background(100);
  x = 10;
  y = 200;
 }

int numOfEllipses = 1000;


void draw() {
  //these ellipses are drawn with a yellow fill and have a stroke weight
  //they create the background for the composition
  float count = 500;
  float circleSize;
 
  if(numOfEllipses > 0){
    ellipse(random(width),random(height),50,50);
  }
  numOfEllipses++;
  

  x = x + random(-1, 2);
  y = y + random(-2,2);
  //a sets the blue circles up to start at x=200
  //b sets the y coordinate for the blue circlese
  float a = 200;
  float b = 150;
  
  a = a + random(-10,10);
  b = b + random(-150,150);
 
  //the first ellipse is the one that walks from left to right at random
  //the second ellipse is the blue one that goes up and down at random
  fill(66,100,100,10);
  ellipse(x, y,60,60);
  fill(66,100,100,10);
  ellipse(a,b,60,60);
 
 //this means that when the "walking" ellipse hits x=300 it changes color to red
 if(x>300){
   fill(100,50,100,10);
   ellipse(random(height),y,60,60);
 }
 //this means that when the "walking" ellipse hits x=150 it loses it's stroke
 if(x>150){
   noStroke();
   fill(20,20,100,10);
   ellipse(150,random(width),20,20);
 }
 //this means if x is greater than 50, then rectangles are drawn with no fill in the background
 if(x>50){
   noFill();
  rect(random(height),random(width),20,30);
 } 
 
 //this draws circles with no stroke over top of the existing pattern, which will eventually turn the background completely yellow
 if (count > 0) {
   circleSize = random(1,20); 
   fill(10,100,100,10);
   ellipse(200,random(height), circleSize, circleSize);
  }
  count++;
}


