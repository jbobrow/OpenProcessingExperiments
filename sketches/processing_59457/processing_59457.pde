


float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro do circulo
float r,g,b; // variaveis para a cor do circlo
float s; // variavel da espessura do outline

float probabilidade; 
float percentagem; 
int countProbabilidade; 


void setup() { // definições de Set up
  
  float sizeW, sizeH; // variavel da largura e comprimento
  sizeW = 700; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (0);  // cor de fundo
  smooth(); // definição do contorno dos circulos
  noLoop(); // imagem estatica
  
  
 
  
 percentagem = 30; // 10% dos circulos pintados de verdes
 probabilidade = 100 - percentagem; // a variavel para o teste da probabilidade
 
  countProbabilidade  = 0; // um counter para verificar quantos circulos são pintados de verde
}

void draw(){ // desenhar imagem
  background(0); // cor de fundo
  
  for ( int i = 0; i < 100; i++) // numero de circulos
  {
     posX = random (width); // gerar um numero para posição horizontal 
     posY = random (height); // gerar um numero para posição vertical
     diametro = 7; // gerar um diametro
 
     // circulos verdes
     if (random(100) > probabilidade){ // localização dos circulos
      
      r = 155; 
      g = 255; 
      b = 150;
      
      countProbabilidade = countProbabilidade +2; 
      println(countProbabilidade);
       
     }
     
     // circulos azuis
     else
     {
     r = 0;
     g = 0; 
     b = 255;
     
     }
     
     
     noStroke(); // sem contorno
     fill(r,g,b); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  
  
         
}



