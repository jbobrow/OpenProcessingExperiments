
// Transformações
// Rotate, Translate, Scale
float px, py, angulo, escala;

void setup() {
  size(500, 500);
  background(0);
  stroke(255, 30);
  noFill();
  px = 0;
  py = 0;
  angulo = 0;
  escala = 0;
  frameRate(30);
}
void draw() {
  translate (250,250);
  angulo += 15;
  rotate (radians(angulo));
  escala += 0.001;
  scale(escala);
  rect (0,0,30,30);
  ellipse (random(60), random(60), 60, 60); 
}
