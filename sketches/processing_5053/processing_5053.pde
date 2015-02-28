
/*
sketch_2
ruffles
October, 2009
dthibert@telus.net
*/


float turn = 0;
float noiseNum = 0;


void setup() {
  size(500,500);
  background(0,20,50);
  smooth();
  
  noiseSeed(6);
  
};

void draw() {
  //turns whole page
  rotate(turn);
  
  float end = noise(noiseNum) * 800;
  noiseNum = noiseNum + 0.01;
  
  stroke(random(150,255), 100);
  line(0,0,end,0);
  fill(0,200,1500,40);
  ellipse(end,0,6,6);
  
  turn = turn + 0.01;
};

