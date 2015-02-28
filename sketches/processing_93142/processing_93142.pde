
//Emanuele S. Reis - Exercício Animação

void setup(){
  size(200,200);
  background (10,mouseX,mouseY, 5);
}
void draw(){
  stroke(30,mouseX,mouseY, 200);
  strokeWeight(1);
  fill (9,mouseX,mouseY, 10);
  rect (mouseX, mouseY, mouseX, mouseY);
 }
