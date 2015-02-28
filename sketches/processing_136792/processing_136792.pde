
void setup() {
 size(600,600);
}
void draw() {
  //background();
for(int a = 0; a < width; a=a+20){
  for(int b = 0; b < height; b=b+20){
 fill(a/3,b/3,b/3);
 float tamano = random(50);
ellipse(a,b,tamano,tamano);
}
}
}
