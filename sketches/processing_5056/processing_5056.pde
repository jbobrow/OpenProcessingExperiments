
/*
spiral
Sept 2009
illustrator9@gmail.com
*/
float turn =0;
float noiseNum = 0;

void setup() {
  size(600,600);
  background(155,156,89);
  smooth();
  
  noiseSeed(1);
  
};

void draw() {
  translate(width/2,height/5);
  rotate(turn);
  
  //float end = random(140,150);
  float end =noise(noiseNum) * 350;
  noiseNum = noiseNum + 0.01;
  
  stroke(0,100);
  line(0,0,end,0);
  ellipse(end,0,3,10);
  
  turn = turn + 0.21;
  
};
  

