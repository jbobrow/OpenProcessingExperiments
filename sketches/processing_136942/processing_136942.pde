

void setup(){
size (500, 500);

for(int i = 0; i< 360; i++){
//rotate(i);
//cara(width/2, height/2, 100, 100);
cara(i, height/2, 100, 100);
}

}



void cara(int x, int y, int ancho, int alto) {
  fill(345, 234, 170, 120);
  ellipse (x, y, ancho, alto);
  fill (156, 34, 89, 120);
  ellipse (x+ancho/4, y, ancho/4, alto/4);
  ellipse (x-ancho/4, y, ancho/4, alto/4);
  fill (100, 40, 250, 120);
  ellipse (x, y+ancho/4, ancho/20, alto/20);
  fill(45, 768, 345, 120);
  triangle (x, y-ancho/2, x-ancho/4, y-ancho/4, x+ancho/6.6, y-ancho/2);
  triangle (x-ancho/10, y-ancho/2, x-y/3.6, y-x/3.6, x, y-ancho/2);
  triangle (x+ancho/6.6, y-ancho/2, x-ancho/10, y-ancho/10, x+ancho/4, y-ancho/2);
}


