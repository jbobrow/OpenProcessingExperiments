
class bolota { // defenir a class

  float posX;// defenir posição horizontal da variavel
  float posY; // defenir posição vertical da variavel
  float velocity; //defenir velocidade
  float larg; // defenir largura da variavel
  float altura; //defenir altura
  
  PImage img; // guarda uma imagem 
  
  
    bolota (float t_large, float t_altura){
    posX = random( width); // posição de X
    posY = random( -height, 0);  // posição de Y
    img = loadImage ("acorn.png");// carrega a imagem
    velocity = 1; // dar valores a velocidade
    
    larg = t_large;
    altura = t_altura;
  }
  
  void update(){ //iniciar variavel para actualizar a animação
  
    //velocidade (movimento) da animação
    posY = posY + velocity;
    
    if ( posY > height) {
     
     posY =  random( -height, 0); 
     
  
     
    }
  
  
  }
  
  
  void drawing(){//iniciar variável para desenhar o objecto
    
    imageMode(CENTER);// defenir posição da imagem /centro
    image(img,posX, posY, larg,altura);// desenha a imagem /cordenadas
  
  }

}

