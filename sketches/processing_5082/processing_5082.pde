
/*

Fun with random numbers
September 2009
mcnabbulator@hotmail.com

*/
float turn = 0;
float turn2 = 0;
float turn3 = 0;
float noiseNum = 0;

void setup() {
  size(500,500);
  background(255);
  smooth();
  
  //noiseSeed(1);
};

void draw() {
  translate(width/1.5,height/1.5);
  rotate(turn);
  
  //float end = random(0,150);
  float end = noise(noiseNum) * 150;
  noiseNum = noiseNum + 0.01;
  
  stroke(50,128,66,100);
  line(0,0,end,0);
  ellipse(end,0,3,3);
  
  turn = turn + 0.01;


  translate(width/2,height/2);
  rotate(turn2);
  
  //float end = random(0,150);
  float end2 = noise(noiseNum) * 150;
  noiseNum = noiseNum + 0.01;
  
  stroke(255,200,50,100);
  line(0,0,end2,0);
  ellipse(end2,0,3,3);
  
  turn = turn + 0.1;
  
  translate(175,175);
  rotate(turn3);
  
  float end3 = random(0,150);
  //float end3 = noise(noiseNum) * 150;
  noiseNum = noiseNum + 0.01;
  
  stroke(170,0,50,100);
  line(0,0,end3,0);
  ellipse(end3,0,3,3);
  
  turn = turn + 0.1;
};

