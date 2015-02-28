
void setup(){
  size(500,150);
}
void draw(){
  cara(35,10,80,5);
  cara(185,10,100,5);
}

void cara (int x, int y, color c, int ojos){
  pushMatrix();
  translate(x,y);
  fill(c);
  ellipse(115,50,100,100); //cara general
  fill(0);
  triangle(60,20,100,20,80,57);
  triangle(127,23,170,23,148,60);
  stroke(2);
  line(89,86,144,86);
  

popMatrix();
}
