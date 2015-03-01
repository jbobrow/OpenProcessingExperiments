
void setup () {
  size(400,400);
}
void draw() {
  background(0);
  float tamano =random(350);
ellipse(200,200,tamano,tamano);
fill(250);
noStroke();
fill(255,48);
translate(100,100); //Configura posición inicial
for (int i = 0; i < 14; i++) {//12 repeticiones
scale(1.2); //Acumula escala
ellipse(4, 2, 28,28);
}
}
