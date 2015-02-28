
// Transformações
// Rotate, Translate, Scale
float px, py, angulo;

void setup() {
  size(500, 500);
  background(0);
  stroke(255, 10);
  fill(255, 0, 0, 8);
  px = 0;
  py = 0;
  angulo = 0;
  frameRate(20);
}
void draw() {
  // background(0);
  px += 0.5;
  py += 1;
  angulo += 5;
  //translate(250,250);
  translate(px,py);
  rotate(radians(angulo));
  for (int i=0; i<500; i+=30){
    line(i, 0, i, 500);
    line(0, i, 500, i);
  }
  rect (0,0,30,30); 
}
