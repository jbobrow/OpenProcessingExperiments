

void setup() {
  size(680,400);
  frameRate(1);
  smooth();
}

void draw() {
  background(0);
  int h = hour();
  int m = minute();
  int s = second();
  stroke(255);
  
  strokeWeight(4);
  pushMatrix();
  translate(width*0.3, height*0.5);
  rotate((h%12+m/60.0)*TWO_PI/12);
  line(0, 0, 0, -60);
  popMatrix();
  
  strokeWeight(4);
  pushMatrix();
  translate(width*0.7, height*0.5);
  rotate((h+7 %12+m/60.0)*TWO_PI/12);
  line(0, 0, 0, -60);
  popMatrix();
  
  strokeWeight(2);
  pushMatrix();
  translate(width*0.3, height*0.5);
  rotate((m+s/60.0)*TWO_PI/60);
  line(0, 0, 0, -80);
  popMatrix();
  
  strokeWeight(2);
  pushMatrix();
  translate(width*0.7, height*0.5);
  rotate((m+s/60.0)*TWO_PI/60);
  line(0, 0, 0, -80);
  popMatrix();
  
  /*strokeWeight(1);
  pushMatrix();
  translate(width*0.3, height*0.5);
  rotate(s*TWO_PI/60);
  line(0, 0, 0, -90);
  popMatrix();*/
  
  /*strokeWeight(1);
  pushMatrix();
  translate(width*0.7, height*0.5);
  rotate(s*TWO_PI/60);
  line(0,0,0,-90);
  popMatrix();*/
  
  pushMatrix();
  translate(width*0.3, height*0.5);
  noStroke();
  ellipseMode(CENTER);
  rotate(s*TWO_PI/60);
  fill(random(200,250),0,random(100),100);
  ellipse(0,0,50,400);
  popMatrix();
  
  pushMatrix();
  translate(width*0.7, height*0.5);
  ellipseMode(CENTER);
  rotate(s*TWO_PI/-60);
  fill(random(100),0,random(220,250),100);
  ellipse(0,0,50,400);
  popMatrix();
}


