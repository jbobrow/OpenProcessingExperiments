
void setup(){
  size(450,455);
  smooth();
}
//black background
void draw(){
  background(0);
  noStroke();
rectMode(CORNERS);
//white
fill(255);
rect(0,0,106,130);
rect(0,151,106,324);
rect(118,336,424,455);
rect(436,336,450,390);
//blue
fill(32,64,125);
rect(0,336,105,455);
//red
fill(232,20,8);
rect(118,0,450,324);
//yellow
fill(241,228,61);
rect(436,406,450,455);
}


