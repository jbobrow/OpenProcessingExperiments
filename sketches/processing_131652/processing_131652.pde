
//Caroline Alves Lins de Albuquerque. Computação S53
//Retangulo girando ao redor do mouse
 
//Criando variável
float r = 0;
float backR;
float backG;
float backB;
 
void setup() {
  size(400, 400);
  //Variação de cor de fundo
  backR = random(0, 100);
  backG = random(0, 100);
  backB = random(0, 100);
  //Cor de fundo
  background(backR, backG, backB);
  //Faz o retângulo seguir o centro do mouse
  rectMode(CENTER);
}
 
void draw() {
  //Cor de fundo e do retângulo
  fill(backR, backG, backB, 50);
  fill(255);
  //Faz o retângulo girar e seguir o mouse
  translate(mouseX, mouseY);
  rotate(r);
  r = r + 0.05;
  //Tamanho do retângulo
  rect(0, 0, 100, 100);
}

