
void setup(){
  size(200,200);
  colorMode(HSB,width);
  frameRate(5);
}
int x=0;
void draw(){
  background(0);
  fill(x,width,width);
  ellipse(100,100,x,x);
  x++;
}

