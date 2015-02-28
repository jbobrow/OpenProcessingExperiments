
/*
spiral
Sept 2009
illustrator9@gmail.com
*/
float turn =10;
float noiseNum = 130;

void setup() {
  size(600,600);
  background(155);
  smooth();
  
  noiseSeed(14);
  
};

void draw() {
  translate(width/5,height/5);
  rotate(turn);
  
  //float end = random(140,180);
  float end =noise(noiseNum) * 350;
  noiseNum = noiseNum + 298.01;
  
  stroke(0,100);
  line(50,105,end,10);
  ellipse(end,30,33,10);
  
  turn = turn + 6.21;
  
};
  

