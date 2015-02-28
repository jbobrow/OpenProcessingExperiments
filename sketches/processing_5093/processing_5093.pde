


float turn = 0;
float around = 1;
float around2 = 2;
float noiseNum = 0;
float noiseNume = 1;
float noiseNum3 = 4;

void setup () {
  size(500,500);
  background(250);
  smooth();
  
  noiseSeed(1);
  // start recording PDF

};

void draw() {
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
//    float end= random(140,150)
  float end = noise(noiseNum)* 150;
  noiseNum =noiseNum - 0.01;
 
  stroke(255,255,0,30); // red,blue,gree,opacity
  line(100,255,end,0);
  ellipse(end,0,3,3);
  turn = turn  - 0.01;

 
  rotate(around);
  float end2 = noise(noiseNume)* 200;
  noiseNume = noiseNume - 0.01;
  
  stroke(255,100,0,30);
  line(255,0,end2,240);
  ellipse(end2,255,255,3);
  around = around  - 0.013;
  
  rotate(around2);
  float end3 = noise(noiseNum3)* 200;
  noiseNum3 = noiseNum3 - 0.01;
  
  stroke(0,255,255,30);
  line(255,0,end3,240);
  ellipse(end3,0,255,0);
  around2 = around2  - 0.1;
  
  popMatrix();
};


