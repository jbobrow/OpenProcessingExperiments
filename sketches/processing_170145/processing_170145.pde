
float r = 0;

void setup() {
  size(600,600);
  background(2);
  rectMode(CENTER);
}

void draw() {

  fill(113,13,0);
  translate(width/2,height/2);
  rotate(r);
  rect(0,0,150,10);
  fill(2,85,51);
  rect(50,50,150,10);
  fill(2,107,155);
  rect(100,100,150,10);
   fill(193,43,2);
  rect(150,150,150,10);
   fill(113,13,0);
  rect(200,200,150,10);
  r = r+.02;
  
//Outer Tier
  fill(2,85,51);
  translate(width/2, height/2);
  rotate(r);
  rect(0,0,100,100);
  r = r+.03;

}
  
