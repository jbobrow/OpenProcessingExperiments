
float x= 0;
void setup() {
  size(600,600);
  colorMode(HSB);
}
void draw() {
  background(0);
x+=0.01;
stroke(random(0,250),255,255);
strokeWeight(random(30));
  line(mouseX, mouseY,pmouseX, pmouseY);
 line(mouseY, mouseX,pmouseY, pmouseX);
 line(height-mouseY, width-mouseX,height-pmouseY, width-pmouseX);
  line(width-mouseX,height-mouseY,width-pmouseX,height-pmouseY);
  line(height-mouseY, mouseX,height-pmouseY, pmouseX);
  line(mouseX,height-mouseY,pmouseX,height-pmouseY);
  line(mouseY, width-mouseX,pmouseY, width-pmouseX);
  line(width-mouseX,mouseY,width-pmouseX,pmouseY);
}
