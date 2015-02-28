
// Transformações
// Rotate, Translate, Scale
float px, py, angulo, escala;

void setup() {
  size(500, 500);
  background(0);
  stroke(255, 8);
  fill(255, 0, 0, 8);
  px = 0;
  py = 0;
  angulo = 0;
  escala = 0;
  frameRate(10);
}
void draw() {
  angulo += 5;
  translate (250,250);
  rotate (radians(angulo));
  //background(0);
  escala += 0.001;
  scale(escala);
  for (int i=0; i<500; i+=30){
    line(i, 0, i, 500);
    line(0, i, 500, i);
  }
  rect (0,0,30,30);
  ellipse (100, 20, 60, 60); 
}
