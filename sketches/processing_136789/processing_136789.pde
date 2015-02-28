

void setup(){
size(400,400);
}
void draw(){
  background(0);
for(int a = 0; a <width; a = a+100){
  for(int b = 0;  b <height; b = b+5){
stroke(255);
noFill();
float distancia = dist(mouseX,mouseY,a,b);
float tamano = random (102);

  ellipse(a,b,distancia,tamano);
  
  }
 }
}
