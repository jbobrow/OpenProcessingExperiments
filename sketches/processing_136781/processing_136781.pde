
void setup() {
size(1000,1000);
}
void draw(){
background(255);
for(int a = 0; a < width; a=a+20){
  for(int b = 0; b < height; b=b+20){
  fill(a/3,b/3,250);
  float tamano =random(25);
    ellipse(a,b, tamano, tamano);
   
 }
}
}
