
float a = 0;

void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB, 100);
}

void draw() {
  fill(0,0,0,0);
  rect(0,0,width,height);
  
  fill(abs(sin(a)*100),100,90);
  float x = map(sin(a)*cos(a*.7), -1, 1, 10, width-10);
  float y = map(sin(a+.8), -1, 1, 10, height-10);

  ellipse(x,y,20,20); 
  ellipse(y,x,20,20); 
  a += .01;
}

