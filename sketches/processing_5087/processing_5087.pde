


float turn = 0;
float noiseNum = 10;
float turn2 = 0.01;
float noiseNum2 = 30;

void setup () {
  size(500,500);
  background(0);
  smooth();
  
  noiseSeed(3);
};

void draw() {
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
//    float end= random(140,150)
  float end = noise(noiseNum)* 130;
  noiseNum =noiseNum - 0.1;
  
  stroke(50,40);
  line(0,0,end,0);
  ellipse(end,10,20,0);
  
  turn = turn  - 0.01;
  
  translate(width/3,height/3);
  rotate(turn2);
  float end2 = noise(noiseNum2)* 150;
  noiseNum2 =noiseNum2 - 10;
  
  stroke(50,40);
  line(1,0,end2,20);
  ellipse(end2,20,40,0);
  
  turn2 = turn2  - 10;
  popMatrix();
};



