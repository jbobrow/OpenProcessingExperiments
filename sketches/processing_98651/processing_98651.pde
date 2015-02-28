
int c= 1;
void setup(){
  size(640,480);
  background(255);
  frameRate(100);
}

void draw(){
  fill(c);
  ellipse(mouseX, mouseX, mouseY, mouseY);
}
void mouseMoved(){
  c=c+1;
  if(c>155) {
    c=0;
  }
}
