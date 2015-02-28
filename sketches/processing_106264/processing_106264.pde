
/* O mouseWheel retorna um valor negativo se a 
"roda" do mouse é rodada para cima e positivo se é 
rodada para baixo*/

float acumulador = 0;
void setup() {
  background(0);
  size(200, 200);
  textSize(32);
  text("text" , 65, 30 + 5 * acumulador);
}

void draw() {} 

void mouseWheel(MouseEvent event) {
  background(0);
  float e = event.getAmount();
  acumulador += e;
  textSize(32);
  text("text" , 65, 30 + 5 * acumulador); 
}
