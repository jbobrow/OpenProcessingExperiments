
float margen;
float tam;



void setup() {
  size(300,300);
  background(127,129,129);
  stroke(0);
  tam = width/4;
  margen = tam/4;
  println(tam+margen);
  
}

void draw(){

  for (float i = margen; i < width; i = i + tam +margen ) {
    for (float j = margen; j < height; j = j + tam + margen) {
     fill(i,j,255);
     rect(i,j,tam,tam);
    }
  }
 
}


