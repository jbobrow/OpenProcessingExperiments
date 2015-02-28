
void setup(){
  size (500,500);
  background(255);
  smooth();
}
/*definições do programa*/

void draw(){
  fill(0);
  rect(0,0, width, height/2);
  /*quadrado preto com a largura da janela e com metade da altura da janela*/
  fill(255);
  arc(width/2, height/2, mouseX, mouseY, 0, PI);
  /*arco com preenchimento branco a ser constantemente desenhado 
  conforme a posição do rato*/
}

