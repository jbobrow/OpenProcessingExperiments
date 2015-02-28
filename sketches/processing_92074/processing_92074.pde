
//for ellipse
float x1, y1;
//for bezier 1
float x2, y2;
float x3, y3;
float x4, y4;
float x5, y5;
//for bezier 2
float x6, y6;
float x7, y7;
//for inner circles
float x8, y8;
float x9, y9;
float Spy1;
float Spy2;
float Spy3;
float C1;
float C2;
float w1;


void setup() {
 size(460, 700);
 colorMode(HSB, 360, 100, 100, 100);
 //background(30, height, height, 70);
 
 x1 = width/2;
 y1 = height/3;
 C1 = 0;
 
 Spy1 = .5;
 
 
}

void draw() {
  background(30, height, height, 70);
  
  //---formas--------------
  
  //central ellipse
  C1 = map(mouseX, 0, width, 0, 20);
  noStroke();
  fill(326, C1, 98, 80);
  ellipse(x1, y1, width-width/3, width-width/3);
  
  //center bezier
  x2 = random(0, width);
  y2 = random(0, height);
  x3 = random(0, width);
  y3 = random(0, height);
  x8 = map(mouseX, 0, 10, 0, 10);
  y8 = map(mouseY, 0, 10, 0, 10);
  w1 = random(1, 2.9); 
  C2 = random(78, 138);
  
  stroke(C2, 78, 69, 70);
  strokeWeight(w1);
  noFill();
  beginShape();
  vertex(x1, y1);
  bezierVertex(x2, y2, x3, y3, x8, y8);
  endShape();
  

  
}


