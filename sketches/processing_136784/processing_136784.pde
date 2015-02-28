
void setup() {
size(600,600);
}
void draw() {
  background(255);
for(int a = 0; a < mouseX; a=a+10){
for(int b = 0; b < mouseY; b=b+10){
  fill(a/2,b/4,b);
  float tamano = random(120);
  ellipse(a,b,tamano, tamano);
}
}
}
