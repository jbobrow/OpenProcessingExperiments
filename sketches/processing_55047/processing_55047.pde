
//definir a class butterfly

class objectButterfly{//iniciar class
  
  //definir as variáveis 
  float posX;//definir a variável da posição horizontal X
  float posY;//definir a variável da posição vertical Y
  float velocity;//definir a variável da velocidade
  float r,g,b;//definir a variável da cor r,g,b
  
  objectButterfly(){//definir a animação a ser chamada
    posX = random(width);//localização do objecto no eixo de X - posição horizontal aleatória
    posY = random(height);//localização do objecto no eixo de Y - posição vertical aleatória
    velocity = random(5,8);//definir a velocidade do movimento dos objectos - aleatória
        
    r = random(254);//definir a cor "red"
    g = random(23);//definir a cor "green"
    b = random(255);//definir a cor "blue"
  }
  
  void update(){//iniciar a variável para actualizar a animação da class "butterfly"
    
    posX = posX + velocity;//movimento dos objectos no sentido de X e da esquerda para a direita
    
    if (posX > width+600){//se a posição X for maior que a largura+600
    posX = -100;//início da animação dos objectos
    }
    
  }
    
  void drawing(){//iniciar variável para desenhar a animação
    
    smooth();//percentagem de pixelização
    fill(r,g,b);//cor do preenchimento dos objectos
    noStroke();//sem contorno
    ellipse(posX,posY,random(100),random(100));//desenhar a geometria dos objectos
    //"posX" e "posY" são usados para desenhar os objectos
   //numa posição nova em cada frame
  }
  
}

