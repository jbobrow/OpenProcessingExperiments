
float xoff = 0.1;
void setup(){
  size(1200,600);}
void draw() {
  background(255);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
  fill(0);
  rect(0,n-mouseX,n-mouseY,n);
}



