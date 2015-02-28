
float x= 0;
float y=0.5;
int z=0;
void setup() {
  size(1000,1000);
  background(0);
  colorMode(HSB);
}
void draw() {
x=x+y;
z=z+1;
fill(z,255,255);
  ellipse(mouseX, mouseY,x, x);
  ellipse(mouseY, mouseX,x, x);
  ellipse(height-mouseY, width-mouseX,x, x);
  ellipse(width-mouseX,height-mouseY,x, x);
  ellipse(height-mouseY, mouseX,x, x);
  ellipse(mouseX,height-mouseY,x, x);
  ellipse(mouseY, width-mouseX,x, x);
  ellipse(width-mouseX,mouseY,x, x);
if (x>100||x<0){
y=y*-1;
}
if (z>255){
z=0;
}
}
