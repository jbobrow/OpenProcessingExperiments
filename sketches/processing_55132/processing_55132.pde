
float turn =0;
float noiseNum = 0;
 
void setup() {
  size(450,450);
  background(#d5c3b8);
  smooth();
   
};
 
void draw() {
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
   
  float end =noise(noiseNum) * 200;
  noiseNum = noiseNum + .02;
   
  noStroke();
  fill(255,60);
  line(0,0,end,10);
  rectMode(CENTER);
  rect(end,0,random(20,100),random(2,7));
   
  turn = turn + 0.5;
  popMatrix();
}
