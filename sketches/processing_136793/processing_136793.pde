
void setup() {
 size(600,600);
}
void draw() {
  background(0);
for(int a = 0; a < width; a=a+20){
  for(int b = 0; b < height; b=b+20){
 //fill(a/3,b/3,b/3);
 float distancia= 400-dist(mouseX,mouseY,a,b);
 //float tamano = random (50);
ellipse(a,b,distancia/10,distancia/10




);
}
}
}
