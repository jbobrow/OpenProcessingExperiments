
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyeri Kim
// ID: 201420075

float r;
float g;
float b;


void setup() {
  size(600, 600);
  smooth();
  background(225);
  //noLoop();
}

void draw() {
   for(int i=5; i<width; i=i+30){
    for(int j=10; j<height; j=j+30){
      r=random(255);
      g=random(255);
      b=random(255);
      
      
      fill(r,g,b);
      stroke(r,g,b);
      strokeWeight(random(5));
      rect(i,j,20,20,5);
      

  //minute
  stroke(150);
  strokeWeight(10);
  fill(98, 193, 255);
  ellipse(100, 100, minute()*10, minute()*10);

  //hour
  noStroke();
  fill(98, 255, 151);
  ellipse(220, 250, hour()*25, hour()*25);

  //second
  stroke(0);
  strokeWeight(5);
  fill(255, 229, 98);
  rect(400, 10, 50, second()*10+10);
}
   }
}

