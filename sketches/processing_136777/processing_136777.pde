
void setup() {
size(600,600);
}
void draw() {
  background(255);
for(int a = 0; a < width; a=a+10){
for(int b = 0; b < height; b=b+10){
  fill(a/2,b/4,b);
  float tamano = random(20);
  ellipse(a,b,tamano, tamano);
}
}
}
