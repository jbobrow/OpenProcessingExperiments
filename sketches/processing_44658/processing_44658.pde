

class objecto1 { // início da class e criação das variáveis
  int posX; // posição horizontal
  int posY; // posição vertical
  int tamanho1; // largura
  int tamanho2; // altura
  
  int velocidade;
  int velocidade2; // velocidade para a transformação do objecto
  
  int cor1; // variáveis para cores
  int cor2;
  int cor3;
  
  
  //definir objecto através das  variáveis
  objecto1 ( int t_posX, int t_posY, int t_tamanho1, int t_tamanho2) {
    
    posX = t_posX;
    posY = t_posY;
    tamanho1 = t_tamanho1;
    tamanho2 = t_tamanho2;
    
    velocidade = (int) random (2,4); // valores das variáveis
    velocidade2= (int) 1; 
    cor1 = (int) 255;
    cor2 = (int) random (255);
    cor3 = (int) random (255);
    
 
    
    
  }
  
  
  
  // actualização das variáveis
  void update () {
    
      if ( posX > 250) {//fazer reset ao movimento, neste caso é a largura da janela
          posX = 0; // voltar para a posição aqui definida
      } 
            if ( posY > 500) {
          posY = 100; 
      }

    
    posX = posX+velocidade; // atribução dos movimentos e respectiva velocidade
    posY = posY+velocidade;
    tamanho2 = tamanho2+velocidade2;
  }
  
  //desenhar
  void desenhar() {
    noStroke (); // sem contorno
    fill (cor1, cor2, cor3); // cores atribuídas com as variáveis em cima criadas
    
    rect (posX, posY, tamanho1, tamanho2); // desenhar o objecto com as variáveis
  }
  
  
  
} // fim da class

