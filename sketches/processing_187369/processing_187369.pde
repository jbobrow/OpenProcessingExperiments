
void setup() {
 size(600,600);
}
void draw() {
 
}
void mouseDragged(){
  float aleatorioX= random(-50,50);
  float aleatorioY= random(-50,50);
  float tamano= random(5,50);
 ellipse(mouseX+aleatorioX,mouseY+aleatorioY,tamano,tamano); 
}
