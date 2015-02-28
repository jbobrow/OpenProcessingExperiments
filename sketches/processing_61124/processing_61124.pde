
// tentar fazer um relógio, em que o fundo do relógio tenha uma imagem;
// funções do processing que comunicam com o computador;
//e devolvem a hora, minutos e segundos
//agora vamos escalar

PImage A;

void setup() {
  size(500, 500);
  PFont font;
  smooth();
  font = loadFont("Futura-CondensedMedium-48.vlw");
  textFont(font, 18);
  frameRate(1);
}
 
void draw() {
  background(0);
  A= loadImage("mimo.jpg");
  image (A,0,0);
  int s = second();// criar a variavel ´s` e passar o valor dos segundos
  int m = minute();
  int h = hour();
  float m1 = map(m, 0, 59, 0, 200);// mapear os valores de 0,59,para o tamanho da largura da janela
  float s1 = map(s, 0, 59, 0, 200);
  float h1 = map(h,0, 23, 0, 200);
  rect(50, 75, s1, 15); 
  rect(50, 125, m1, 15); 
  rect(50, 175, h1, 15); 
  text(int(s), 30, 87);//criar um texto;
  text(int(m), 30, 137);
  text(int(h), 30, 187);
  text("Um Relógio de Barras de Segundos/ Minutis/ Hora", 60, 340);
  text("Boa Tarde", 60, 320);
}


