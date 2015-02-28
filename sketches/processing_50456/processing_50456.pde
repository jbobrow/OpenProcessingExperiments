
class Chuva {// defenir a class

  float posX;// defenir posição horizontal da variavel
  float posY; // defenir posição vertical da variavel
  float velocidade; //defenir velocidade
  float larg; // defenir largura da variavel
  float altura; //defenir altura
  float aceleracao; // variavel para a aceleracao
  
  PImage img; // guarda uma imagem 
  
  
    Chuva ( float t_large, float t_altura){
     
    posX = random( width); // posição de X
    posY = random( -height, 0);  // posição de Y
    img = loadImage ("chuva.png");// carrega a imagem
    
    aceleracao = random (0.1) * 0.1; // para gerar um numero enter 0.1 e 1
    velocidade = 1; // dar valores a velocidade
    
    larg = t_large;
    altura = t_altura;
  }
  
  void update(){  //iniciar variavel para actualizar a animação
     
     
     // a velocidade agora deixa de ser constante
    // e passa a variar, neste caso tem uma aceleracao linear (constante)
     velocidade = velocidade + aceleracao;
    //velocidade (movimento) da animação
    posY = posY + velocidade;
    
    if ( posY > height) {
     
     posY =  random( -height, 0); 
     
     }
  
  
  }
  
  

  
  
  void drawing(){//iniciar variável para desenhar o objecto
    
    imageMode(CENTER);// defenir posição da imagem /centro
    image(img,posX, posY, larg,altura);// desenha a imagem // cordenadas
  
  }

}

