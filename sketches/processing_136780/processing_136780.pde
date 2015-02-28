

void setup(){
size(500,500);
}
void draw(){
  background(0);
for(int a = 0; a <width; a = a+10){
  for(int b = 0; b <height; b = b+10){
stroke(255);
noFill();
float tamano = random (100);
  ellipse(tamano,b,a,10);
   
  }
 }
}
