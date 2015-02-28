


class desenho{ // início da class do objecto
  
  //variaveis
  int posX; // posição horizontal
  int posY; // posição vertical
  int tamanho; // dimensões
  int tamanho2; // dimensão 2
  
  int velocidade; // deslocamento por ciclo
  
  int r; // cor red
  int g; // cor green
  int b; // cor blue
  
  
  //construção
  // variáveis que permitem definir a posição e tamanho do objecto
  desenho (int p_posX, int p_posY, int p_tamanho, int p_tamanho2){ 
    
    posX = p_posX;
    posY = p_posY;
    tamanho = p_tamanho;
    tamanho2 = p_tamanho2;
    
    velocidade = (int) random (6,7); //variável para actualização do objecto, cria o movimento e define a velocidade
    
    // variáveis para aplicação de cor, cores aleatórias
 
      
  }
  
  //função de actualização, cria o movimento
  void update () {
       r = (int) 100; 
    g = (int) 50;
    b = (int) random (0, 200); // variaveis da cor com actualização, esta variação só actua se tiver random
    
       if ( posX <0) {//fazer reset ao movimento, neste caso é a largura da janela, ao chegar a esta posição,
          posX = 950; // volta para a posição aqui definida
      } 
    posX = posX - velocidade; // a cada ciclo move-se com o valor definido na variável "velocidade"

  }
  
  //características do objecto 2d 
  void desenha () {
    noStroke (); // retirar contorno ao objecto
    fill (r,g,b); // aplicação da cor através das variáveis acima criadas
    rect (posX, posY, tamanho, tamanho2); // criação do objecto através das variáveis em cima criadas
  }
  

  
} // fechamento da class do objecto

