

class objecto { // início da class
// criação de variáveis, posição, dimensões, velocidade e cor

int posX;
int posY;
int largura;
int altura;

int velocidade;

int verde;
int vermelho;
int azul;

// aplicação das variáveis ao objecto

objecto (int t_posX, int t_posY, int t_largura, int t_altura) {
  posX = t_posX; // eixo x
  posY = t_posY; // eixo y
  largura = t_largura; // lagura do objecto
  altura = t_altura; // altura do objecto
  
  velocidade = (int) random (2,6); //programar velocidade de forma aleatória entre dois valores
  verde = (int) random (255); // configurar a atribuição das cores
  vermelho = (int) random (255);
  azul = (int) random (255);

} // fecho do ciclo de propriedades

void actualizar () { // ciclo que actualiza o objecto, transladação e transformação
  
  posX = posX+velocidade; //actualizar posição X
  largura = largura+velocidade;

  
    if ( posX > 600) {//fazer reset ao movimento, iniciar novamente, limite para terminar
          posX = 200; // posição para reiniciar
      } 
      
       if ( largura > 200) {//reiniciar a largura do objecto para evitar que ultrapasse 200 px
          largura =50; //reinicia-se com 50 px
      } 
      
  
} // fechar ciclo de actualização


void desenhar () { //criação de formas (primitiva 2d)
  noStroke (); // retirar o contorno
  fill (verde, vermelho, azul); // aplicação de fundo através das variáveis acima criadas
  ellipse (posX, posY, largura, altura); // posição e dimensão do objecto através das variáveis em cima criadas
  
} // fechar a função que desenha


} // fechar a class do objecto


