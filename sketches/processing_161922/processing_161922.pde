
// Day_2 Sketch from james_yuxi_cao


float offset = 250; // claim position variable 
float speed = 0.02;// claim increment variable 
float nnnn = 0;// claim noise variable 


void setup() {
  size(500, 500);
  background(123);
  smooth();
}

void draw() {
  
  //saveFrame("output/frames#################.tif");
  

  nnnn = nnnn + .01; //augment with 0.01 
  float n = noise(nnnn) * 255;  // claim float n color variable
  float wid =noise(nnnn) * width; // claim noise width
  float quadism =noise(nnnn) * width;
  
  stroke(255-n);     // small ellpise section
  strokeWeight(noise(nnnn)*30);
  fill(255-n,random(0,20));
  ellipse(offset, offset, wid/2, wid/2);

  rectMode(CENTER);     // small rect section
  stroke(n);
  strokeWeight(noise(nnnn)*5);
  //fill(255-n,random(0,20));
  rect(offset, offset, wid/1.5, wid/1.5);
 
  translate(width/2, height/2); // Rotation
  rotate(radians(45));

  fill(n, random(0, 10)); // big ellipse section
  //noStroke();
  stroke(255-n);
  strokeWeight(noise(nnnn)*1);
  ellipse(0, 0, wid, wid);

  rectMode(CENTER);     // big rect section
  stroke(n);
  //fill(255-n,random(0,20));
  rect(0, 0, wid, wid);

 
  //quad(quadism/2, 0, quadism, quadism/2, quadism/2, quadism, 0, quadism/2);
}

