
//class acorn

class acorn{//iniciar class

  //definir as variáveis
  float posX;//define a variável da posição horizontal X
  float posY;//define a variável da posição vertical Y
  float velocity;//define variável da velocidade
  float largura;//define variável da largura
  float altura;//define variável da altura
  
  PImage acornImg;//guarda a imagem  
  
  acorn(){//definir a imagem a ser chamada
    posX = random(width);//localização do objecto no eixo de X - posição horizontal aleatória
    posY = random(-height,0);//localização do objecto no eixo de Y - posição vertical aleatória
    acornImg = loadImage ("acorn.png");//carregar a imagem
    velocity = 3;//definir a velocidade do movimento da imagem
    
    largura = 30;//definir a largura da imagem
    altura = 34;//definir a altura da imagem
  }
  
  void updateacorn(){//iniciar a variável para actualizar a animação da class "acorn"
  
    posY = posY + velocity;//movimento do objecto no sentido de X e de cima para baixo
      if (posY > height){//se a posição Y for maior que a altura
        posY =  random(-height,0);//início da animação do objecto
      }
  
  }

  void drawingacorn(){//variável que inicia o desenho do objecto
  imageMode(CENTER);//localização do início do desenho na tela
  image(acornImg,posX, posY, largura,altura);//desenha a imagem
 }

}//fim da class "acorn"

