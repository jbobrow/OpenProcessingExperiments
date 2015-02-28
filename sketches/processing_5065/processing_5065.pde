
/*
spiral
Sept 2009
illustrator9@gmail.com
*/
float turn =16;
float noiseNum = 13;

void setup() {
  size(600,600);
  background(1,18,220);
  smooth();
  
  noiseSeed(144);
  
};

void draw() {
  translate(width/7,height/1);
  rotate(turn);
  
  //float end = random(240,180);
  float end =noise(noiseNum) * 40;
  noiseNum = noiseNum + 128.01;
  
  stroke(18,198);
  line(end,105,end,16);
  ellipse(230,end,100,end);
  
  turn = turn + 66.21;
  
};
  

