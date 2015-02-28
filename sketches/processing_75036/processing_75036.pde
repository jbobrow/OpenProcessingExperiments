
int d1,d3,d2;
void setup(){
  size(400,400);
}
void draw(){
  colorMode(RGB,height);
  background(0);
  d1=(height-mouseY)+mouseY/2;
  d2=(height-mouseY)/4+mouseY/2;
  d3=mouseY/2;
  noStroke();
  fill(0,d3,d3);
  ellipse(width/6*5,height/6,d3,d3);
  fill(0,d2,d2);
  ellipse(width/2,height/2,d2,d2);
  fill(0,d1,d1);
  ellipse(width/6,height/6*5,d1,d1);
}
