

float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;
 
void setup(){
  size(700,400);
  noStroke();
  smooth();
}
 
void draw(){
  background(10);
  frameRate(100);
   
  fill(0);
  ellipseMode(CENTER);
  ellipse(350,200, 10, 10); // center circle
   
  //
  noFill();
  strokeWeight(sw);
   
  // increasing variables
  x += 15;
  y += 15;
  x2 += 10;
  y2 += 10;
  x3 += 5;
  y3 += 5;
 
   
  //
  stroke(40, random(0,255));
  ellipse(350,200,x, y);
   
  stroke(40, random(0,255));
  ellipse(350,200, x2, y2);
   
  stroke(40, random(0,255));
  ellipse(350,200, x3, y3);
}
 
void mouseClicked(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
   
  sw += 1;
  


}


