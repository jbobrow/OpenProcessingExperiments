

void setup(){
size(600,600);
}
void draw (){
for (int a =0;a<600;a=a+15){
  for(int b=0;b<600;b=b+15){
  fill(a/3,b/3,b/3);
  strokeWeight (5);
  float tamano= random(20);
  ellipse(a,b,tamano,tamano);
}
}
}
