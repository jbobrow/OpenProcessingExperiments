
float i = 0;
void setup() {
  size(300, 300);
  colorMode(HSB);
  noStroke();
}
void draw() {
i=i+0.002;
float fondo = 122+(122*sin(i));
float fondob = 122+(122*sin(i+PI));
background(fondo,255,255);
fill(fondob,255,255);
ellipse(150,150,150,150);
}

