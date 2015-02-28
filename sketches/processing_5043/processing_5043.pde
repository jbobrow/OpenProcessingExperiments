
/*

Fun with Random Numbers!
Sept 2009
illustrator9@gmail.com
*/
float turn =19;
float noiseNum = 110;

void setup() {
  size(600,650);
  background(155,65,20);
  smooth();
  
  noiseSeed(151);
  
};

void draw() {
  translate(width/3,height/3);
  rotate(turn);
  
  //float end = random(140,150);
  float end =noise(noiseNum) * 950;
  noiseNum = noiseNum + 0.01;
  
  stroke(12,16);
  line(1,10,end,2000);
  ellipse(5,2,33,10);
  
  turn = turn + 2.21;
  
};
  

