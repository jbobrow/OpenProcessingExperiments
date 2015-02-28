
void setup() {
  size(480,120);
  smooth();
}
void draw(){
 if (mousePressed){
   fill(123);
 }else{
   fill(98);
   }
   line(mouseX,mouseY,80,80);
 }

