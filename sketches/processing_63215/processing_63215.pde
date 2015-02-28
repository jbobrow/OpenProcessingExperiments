

int totalObjectos; // numero total de objectos

float posX, posY; // variaveis para a posição horizontal e vertical dos objectos 
float posX2, posY2;// variaveis para a posição horizontal e vertical dos objectos

float r,g,b; // variaveis para a cor


float probabilidade;// variável nomeada de probabilidade 
float percentagem; // variável de percentagem


void setup() { // definição dos elementos estáticos
  
  size(600,600); // define a área de composição
  background (255); // define a cor de fundo
  smooth();// suaviza a composição

  
  totalObjectos = 100;// numero total de objectos
  
  
 percentagem = 20; // a percentagem é de 20 %
 probabilidade = 100 - percentagem; // os restantes objectos representam 80%
 

}

void draw()// definição dos elementos em animação
{ 
  background(255);// define a cor de fundo para que o fundo se mantenha sempre branco
  
  for ( int i = 0; i <totalObjectos; i++)// função em que a composição começa em 0 até o numero total de objectos
  {
     posX = random (width); // define que a posição horizonral varia entre a largura total
     posY = random (height); // define que a posição vertical varia entre a largura total
    posX2 = random (width); // define que a posição horizonral varia entre a largura total
     posY2 = random (height);// define que a posição vertical varia entre a largura total
   

   r = random(255); // define um valor para a componente vermelha entre 0 e 255
   g = random(255); // define um valor para a componente verde entre 0 e 255
   b = random(255); // define um valor para a componente azul entre 0 e 255
   
     
     
     if (random(100) > probabilidade){ // se a probabilidade for menor na variaçao entre 0 a 100 
      
      r = 255; 
      g = 0; 
      b = 0;
      
       
     }
     else // caso contrario, a cor dos objectos vai alterar para preto
     {
     r = 0;
     g = 0; 
     b = 0;
     
     }
     
     
     noStroke();// sem stroke
     fill(r,g,b);// o preenchimento dos objectos com as variaveis RGB já definidas anteriormente
     arc( posX, posY,posX2,posY2, 0, PI/2); // os arcos vão-se situar entre os valores estipulados
  } 
         
}




