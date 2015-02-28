
//definir a class bigSketch

class bigSketch{//iniciar class
  
  //definir as variáveis 
  float posX = int(random(width));//definir a variável da posição horizontal X - aleatória
  float posY = int(random(height));//definir a variável da posição vertical Y - aleatória
  float r = int(random(255));//definir percentagem de cor "red"
  float g = int(random(255));//definir percentagem de cor "green"
  float b = int(random(255));//definir percentagem de cor "blue"
   
void update(){//iniciar a variável para actualizar a animação da class "bigSketch"
   if(posX > width){//se a posição X for maior que a largura
   posX = random(width-40);//início da animação do objecto em X
   posY = random(height);//início da animação do objecto em Y
   r = random(255);//início da animação do objecto em cor "red"
   g = random(255);//início da animação do objecto em cor "green"
   b = random(255);//início da animação do objecto em cor "blue"
   
}

    //velocidade, movimento e loop da animação da direita para a esquerda
    posX = posX + int(random(5,-1));
    posY = posY + int(random(-2,2));
  }
    
 void drawing(){//iniciar variável para desenhar o objecto
   smooth();//percentagem de pixelização
   noStroke();//sem contorno
   fill(r,g,b,random(255));//cor do preenchimento do objecto
   ellipse (posX,posY,60,60);//desenhar a geometria do objecto
   //"posX" e "posY" são usados para desenhar o objecto
   //numa posição nova em cada frame
    
  }
}//fim da "class"

