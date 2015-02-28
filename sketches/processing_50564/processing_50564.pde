
class folha {// início da class do folhas

  float posY;
  float posX; 
  float velocity; 
  float larg;
  float altura; 
  
  PImage img; // guarda uma imagem 

  
  folha (float t_large, float t_altura){//Converte um tipo de dados primitivo
    posX = random( width); //Gera números aleatórios
    posY = random( -height, 0);//Gera números aleatórios
    img = loadImage ("folha.png");// Carrega uma imagem em uma variável do tipo PImage 
    velocity = 1.5; 
    
    larg = t_large;// largura da folha
    altura = t_altura;// altura da folha
  }
  //função de actualização, cria o movimento
  void update(){
  
    posY = posY + velocity;
    
    if ( posY > height) {
     
     posY =  random( -height, 0); 
    
     
    }
  
  
  }
  
   //características do objecto 2d
  void drawing(){
    imageMode(CENTER); //especifica a posiçao da imagem
  image(img,posX, posY, larg,altura);// desenha a imagem
  
  }

}// fechamento da class do objecto

