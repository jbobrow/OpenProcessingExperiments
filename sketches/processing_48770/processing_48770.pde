
// criar nova variável para os objectos
Cubos[] listaCubos; 
int numObjects;              

void setup (){ 
    size (720,405);
  smooth(); 
 
  numObjects = 100; 
  listaCubos = new Cubos [numObjects];
                              
  
  for (int i =0; i < numObjects; i++){   
    
   float ballAlpha = (205.0/ numObjects) * i; 
 
   
   float vel = (4.0/ numObjects) * i;
  
    
    float largura = (20.0 / numObjects) * i; 
  
     
     
     listaCubos[i] = new Cubos ( (int) random(height), (int) random(width), largura , ballAlpha, vel  );  
  }
    println("--------------"); 

}

void draw (){
  background(255);
  
  for (int i =0; i < numObjects; i++){ 
    
       listaCubos[i].update(); 
       listaCubos[i].desenha();
                                
  }  
}


class Cubos {

  float posX; // posição horizontal
  float posY; // posição vertical
  float largura;  // dimensões
  
  float vel; // deslocamento 
  
  int r;  // cor red
  int g;  // cor green
  int b;  // cor blue
  float a; // alpha 
 
 
 //construção
  // variáveis que permitem definir a posição e tamanho do objecto
  Cubos ( float t_posX, float t_posY, float t_largura, float t_alpha, float t_vel){
    
    posX = t_posX; 
    posY = t_posY;
    largura = t_largura; 
   
    vel =  t_vel; 
  
   // variáveis para aplicação de cor
    r = (int) random (r);
    g = (int) random (255);
    b = (int) random (b);
    a = t_alpha; // initialise the alpha with the construction function parameter
   
  } 

//função de actualização, cria o movimento
  void update (){
    
    if ( posX > height+(largura/0.1)) { 
          posX = 1-(largura/1); 
      } 
    
   
   
    
  }
   //características do objecto 2d
  void desenha (){
    posX = posX +vel;
    

    noStroke(); // retirar contorno ao objecto
    fill(random(r), g, b, a); // aplicação da cor através das variáveis acima criadas
    rect (posX, posY, largura, largura);   // criação do objecto através das variáveis em cima criadas
    ellipse(posX,posY,largura,largura);// criação do objecto através das variáveis em cima criadas
    ellipse(posX,202,40,40);// criação do objecto através das variáveis em cima criadas
  }
  

}
     
                
