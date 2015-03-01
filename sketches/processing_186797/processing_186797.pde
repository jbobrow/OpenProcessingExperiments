
float k=30;
void setup() {
  size (600,600);
  background(214,111,200);
  smooth();
  noStroke();
}
void draw() {
  noStroke ();
  fill (random(245),random(0),random(135));
  smooth();
  rotate (k);
  float triangle_size = random (5,15);
  triangle ( 100+k, -mouseX, 10, 9, 9/k, 3);
  k= k+10;
}

