
int counter;

void setup(){
  size(380,120);
  background(230,0,200);
}
void draw(){
  cara(10,15);
  cara(150,15);
  cara(290,15);
}

void cara (int x, int y){
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(250, 220, 0);
  ellipse(40,40,80,80);
  fill(0);
  ellipse(20,40,10,10);
  ellipse(60,40,10,10);
  fill(255);
  ellipse(21,39,4,4);
  ellipse(61,39,4,4);
  stroke(0);
  line(25,53,55,53);
  

popMatrix();
}
