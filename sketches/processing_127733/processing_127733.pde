
float r = 5;
float a = 0;

void setup(){
  size(600, 600);
  background(0);
  colorMode(HSB, 600);
}

void draw() {
  fill(0,3);
  rect(0,0,width, height);
  r = r+0.3;
  a = a+0.01;
  if (a>2*PI) {
    a = 0;
    r=5;
  }
  stroke(600-mouseX, mouseY, 600, 100);
  fill(mouseX, 600-mouseY, 600, 30);
  for (int i=0; i<6; i++){
    float c1x = mouseX + r*cos(a+PI*i/3);
    float c1y = mouseY + r*sin(a+PI*i/3);
    float c2x = mouseX + r*cos(PI*i/3-a)/2;
    float c2y = mouseY + r*sin(PI*i/3-a)/2;
    bezier(mouseX, mouseY, c1x, c1y, c2x, c2y, mouseX, mouseY);
    point(c1x, c1y);
    point(c2x, c2y);
  }
}
