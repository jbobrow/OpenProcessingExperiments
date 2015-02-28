
float xoff = 0.0;
float unox = 200;
float unoxx = 200;

void setup(){
  size(700,700);
  frameRate(15);
}
void draw() {

  
  background(255);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  float a = random(150,300)/mouseX*10 + mouseY;
  float b = a;
  
  //line(unox, a, 1, b);
  rect(unox, a, 1, b);
  rect(a, unox, b, 1);
  rectMode(CORNER);
  fill(0);
  rect(0,a,50,a);
  rect(a,0,a,50);
}


