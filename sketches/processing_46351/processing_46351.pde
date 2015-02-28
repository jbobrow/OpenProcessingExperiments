
class Bruxa { // defenir a class

  float posX;// defenir posição horizontal da variavel
  float posY; // defenir posição vertical da variavel
  float velocity; //defenir velocidade
  float larg; // defenir largura da variavel
  float altura; //defenir altura
  
  
  PImage img; // guarda uma imagem 
  
  
    Bruxa (float t_large, float t_altura){
    posX = random( width); // posição de X
    posY = random( height);  // posição de Y
    img = loadImage ("Bruxa.png");// carrega a imagem
    velocity = 1; // dar valores a velocidade
    
    larg = t_large;
    altura = t_altura;
  }
  
  void update(){ //iniciar variavel para actualizar a animação
  
    //velocidade (movimento) da animação
    
  if ( posX > width ){

     posX = -60;

     posY = random (height);

  
     
    }
   posX = posX + random(0.1, 3); 
   
   posY = posY + random (-3,3);
  
  }
  
  
    void drawing(){//iniciar variável para desenhar o objecto
    
  
    imageMode(CENTER);// defenir posição da imagem /centro
    image(img,posX, posY, larg,altura);// desenha a imagem /cordenadas
  
  }

}

