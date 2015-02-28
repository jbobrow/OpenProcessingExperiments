
void setup(){
  frameRate(4);
}
void draw(){
  background(0);
  smooth();
  stroke(3,25,252);
  strokeWeight(12);
  line(0,random(100),99,random(100));
  
  
  stroke(255);
  strokeWeight(2);
  line(0,random(50),99,random(50));
  
  fill(255,0,0);
  stroke(0);
  strokeWeight(0);
  ellipse(50, 50, 05, 05);
  
  stroke(252,232,3);
  strokeWeight(3);
  line(0,75,100,75);
}

