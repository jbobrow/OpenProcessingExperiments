
float i=0;
void setup(){
  size(300,300);
  colorMode(HSB);
  noStroke();
}
void draw() {
  i=i+0.002;
  float fondo = (127*sin(i))+127;
  float fondob = (127*sin(i+PI))+127;
  background(fondo,255,255);
  fill(fondob,255,255);
  ellipse(150,150,150,150);
}
