
//definir a class Sketch

class utopia{
  
  //definir as variáveis
  float posX;//definir a variável da posição horizontal X
  float posY;//definir a variável da posição vertical Y 
  
  utopia(float posX, float posY){//definir a animação a ser chamada
    posX = posX;//localização dos objectos no eixo de X
    posY = posY;//localização dos objectos no eixo de Y

  }
   
 void update(){//iniciar a variável para actualizar a animação da class "utopia"
    posX = posX + 15;//espaçamento entre linhas
    posY = random(height/2-400,height/2+700);//defini os limites da animação
      if(posX > width+10){//se a posição X for maior que a largura+10
      posX= -100;//início da animação do objecto em X
      if(posY > height+10){//se a posição Y for maior que a altura+10
      posY = -5;//início da animação do objecto em Y
      } 
    }
  }
  
  void drawing(){//iniciar variável para desenhar a animação
    strokeWeight(random(3));//tamanho dos objectos
    stroke(random(200),random(255),0);//cor dos objectos
    rect(posX,posY,0,0);//desenhar a geometria do objecto
    rect(posY,posX,0,0);//desenhar a geometria do objecto
  }
  
}
//fim da "class"

