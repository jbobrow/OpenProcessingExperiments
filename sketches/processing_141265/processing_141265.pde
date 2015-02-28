
/*
"capitello bizantino" by Lorenzo, licensed under Creative Commons Attribution-Share Alike 3.0.
*/
void setup() {
  size(400, 400, P3D);
}
void draw() {
  background(0); 
  lights();
  scale(2);
  translate(width/4, 20, -150);
  rotateY(map(mouseX, 0, width, -PI, PI));
  noFill();
  stroke(0,255,0);
  drawCyl(140, 120, 60, 4);//alto   
  drawCyl(100, 120, 60, 8);
  translate(0, 60, 0);
  drawCyl(120, 100, 60, 8);//medio
  drawCyl(100, 100, 60, 16);
  translate(0, 60, 0);
  drawCyl(100, 80, 60, 16);//basso
  translate(0, -130, 0);
  rotateY(PI/4);
  box(197.2, 20, 197.2);//imposta
  translate(0, -60, 0);
  box(150, 100, 197.2);//archi
  box(197.2, 100, 150);
  translate(0, 250, 0);
  drawCyl(80, 100, 300, 32);//colonna
}
void drawCyl(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides; 
  beginShape(QUAD_STRIP);
  for (int i=0; i<sides+1;i++) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle+=angleIncrement;
  }
  endShape();
}
