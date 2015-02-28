
float a;

void setup() {
  //point(0,0);
  rectMode(CENTER);
  a=0;
  smooth();
}

void draw() {
  translate(width*.5,height*.5);
  a+=PI/4;
  rotate(a);
  point(0,0);
  
 // strokeWeight(2);
  //point(width*.5,0);
  stroke(255);
  fill(180,180,255);
  rect(0,0,width*.6,width*.07);
  fill(0,180,0);
  noStroke();
  rect(width*.25,0,width*.05,width*.05);  
  
}

