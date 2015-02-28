
void setup() {
  size(640,360);
  background(255);
  strokeWeight(2);
  smooth();  
}
void draw(){
  int borderDistanceX = max(mouseX,width-mouseX)*255/width*2-255;
  int borderDistanceY = max(mouseY,height-mouseY)*255/height*2-255;
  int c255 = max(borderDistanceX,borderDistanceY);
 
  fill(255,255-c255,c255);
  ellipse(mouseX,mouseY,10,10);
}


