
void setup(){
  frameRate(120);
  size(500,500);
  colorMode(HSB,255);
}
int h = 0;
void draw(){
  h++;
  fill(h,255,255);
  if(h==256){h = 0;}
  ellipse (mouseX,mouseY,width/10,height/10);
}
