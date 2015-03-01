
float px = 1;
float py = 300;

void setup() {
  colorMode (HSB);
  size(600, 600);
}
void draw() {
  float aleatorio = random(0,250);
  background ((aleatorio), (aleatorio),(aleatorio));
  for (int i = 500; i>0; i--) {
    println(i);
    ellipse(i, 300, i, i);
    stroke ((i/2) + (mouseX/3),100,155);
  }
  if (px<height) {
    px = px + 2;
  } else {
    py=py - 2;
  } 
  ellipse (px, py, 10, 10);
  
  
}
