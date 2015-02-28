

void setup(){
  size(900,600);
  frameRate(250);
  background(250);
  stroke(0,250);
  ellipseMode(CENTER);
  
}

float a,b,c;
void draw() {
  stroke(130);
  smooth();

  a=sqrt(b*b+c*c);
  b=abs(pmouseX-mouseX);
  c=abs(pmouseY-mouseY);
  float d= noise(1)*mouseX;
  float f= noise(2)*mouseY;
    fill(f,d,a,30);

  ellipse (mouseX, mouseY,a,a);
}
 	




