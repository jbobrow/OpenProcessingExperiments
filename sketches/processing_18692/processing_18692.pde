
void setup(){
  size(250,250);
  smooth();
  background(255);
}

void draw(){
  fill(0,5);
  noStroke();
  rect(20,20,210,210);
  fill(255);
  rect(0,0,20,250);
  rect(0,0,250,20);
  rect(230,0,20,250);
  rect(230,230,250,20);
}

void mousePressed(){
  stroke(random(255),random(255),random(255));
  strokeWeight(random(5));
  line(20,random(230),230,random(230));
}


