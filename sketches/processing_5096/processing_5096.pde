
/*

Fun with random numbers
September 2009
mcnabbulator@hotmail.com

*/

float turn = 0;
float noiseNum = 0;

void setup() {
  size(500,500);
  background(0);
  smooth();
  

  //noiseSeed(1);
};

void draw() {
  translate(width/2,height/2);
  rotate(turn);
  
  //float end = random(0,150);
  float end = noise(noiseNum) * 150;
  noiseNum = noiseNum + 0.01;
  
  stroke(0,100,227);
  fill(45,227,229);
  line(0,0,end,0);
  ellipse(end,0,30,300);
  
  turn = turn + 0.01;
};

