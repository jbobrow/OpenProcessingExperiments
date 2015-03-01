
void setup() {
size(600,600);
colorMode(HSB);
rectMode(CENTER);
}
void draw() {
  float aleatorio = random(0,255);
translate(300,300);
for(int i =700; i>0; i--){
   stroke(0);
   fill(mouseY/3,i,150);
  rect(aleatorio,i,i,i);
   rotate(i*0.001);
 
}
}
