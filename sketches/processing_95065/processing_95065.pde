
float incremeter = 0 ;
void setup() {
  size(350, 600);
}

void draw() {
  
  float yOff = sin(incremeter) *300;
  float xOff = cos(incremeter *3) *100;
  ellipse(175 + xOff, 300+yOff, 30, 30);
  println(sin(incremeter)*50);
  incremeter += .05;
}
