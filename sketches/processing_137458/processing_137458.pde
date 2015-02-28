
void setup() {
  size(500, 500);
  background(245, 232, 119);
  for(int i = 0; i<360; i++){
    rotate(i);
  a(width/2, height/2, 29, 28);

}
  
}
void a (int x, int y, int ancho, int alto) {
  //1circulo hasta abajo dibujado izquierda
  fill(0, 234, 245);
  ellipse(x, y, ancho, alto-1);
  //2circulo segundo de abajo a arriba dibujado izquierda
  fill(2, 195, 203);
  ellipse(x, y-alto*1.3, ancho-3, alto);
  //3circulo tercero abajo a arriba dibujado izquierda
  fill(0, 163, 170);
  ellipse(x, y-alto*2.5, ancho-10, alto-9);
  //4circulo cuarto abajo a arriba dibujado izquierda
  fill(0, 126, 131);
  ellipse(x, y-102, ancho-16, alto-15);
  //5punto quinto abajo a arriba dibujado izquierda
  fill(1, 86, 90);
  ellipse(x, y-121, ancho-22, alto-23);
}

