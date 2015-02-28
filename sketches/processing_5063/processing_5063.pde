
/*
spiral
Sept 2009
illustrator9@gmail.com
*/
float turn =16;
float noiseNum = 13;

void setup() {
  size(600,600);
  background(15,176,203);
  smooth();
  
  noiseSeed(144);
  
};

void draw() {
  translate(width/7,height/1);
  rotate(turn);
  
  //float end = random(240,180);
  float end =noise(noiseNum) * 450;
  noiseNum = noiseNum + 28.01;
  
  stroke(18,190);
  line(150,105,end,160);
  ellipse(230,end,100,end);
  
  turn = turn + 16.21;
  
};
  

