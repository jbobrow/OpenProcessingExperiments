
void setup() {
  size(600, 600);
}
void draw() {
  float vt = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la distancia entre la posiciÃ³n actual y la //anterior del cursor
  strokeWeight(vt/5);
  //stroke(0,100);
  line(mouseX,mouseY,pmouseX,pmouseY); // traza una línea continua
  ellipse(mouseX,mouseY,vt,vt);
}

