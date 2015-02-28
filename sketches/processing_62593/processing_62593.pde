
// Exercício de Probabilidades/ Percentagem    Anabel Santos

int totalObjectos; // numero total de objectos, neste caso circulos

float posX, posY; // variavel para a posição horizontal (x) e vertical (y) do circulo
float diametro; // variavel para o tamanho do circulo
float r,g,b; // variavel para as cores dos círculos

float probabilidade; // variável para controlar a probabilidade
float percentagem; //  variável para controlar as percentagens de cor
int countProbabilidade; //  variável para controlar

// definiçoes setup
void setup() { 
  
  size (950, 300); // tamanho do fundo
  noLoop(); //  imagem estática
  
  
  totalObjectos = 100;// numero total de circulos
  
  
 percentagem = 15; // 15 por cento dos circulos sejam rosas
 probabilidade = 90 - percentagem; // a variavel para o teste da probabilidade
 
  countProbabilidade  = 0; // um counter para verificarmos quantos circulos pintamos de vermelho
}


// parte ilustrativa (desenhos)
void draw(){
  background(0); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++) /*Controla a uma sequência de repetiçoes 
                                               neste caso ciclo de criação de círculos*/
  {
     
 
     posX = random (width); // número aleatório para a posição horizonral 
     posY = random (height); // número aleatório para posição vertical
     diametro = 35; // diametro de 35     
     
     if (random(100) > probabilidade){ /* se o random 100 (rosa), for menor que a 
     probabilidade os circulos serão rosas */
      
     r = 255; // cor -  rosa dos círculos
     g = 113; // cor -  rosa dos círculos
     b = 199; // cor -  rosa dos círculos
       
     }
     else // caso contrário os círculos serão cinzentos
     {
     
     r = 190; // cor -  cinzento dos círculos
     g = 190; // cor -  cinzento dos círculos
     b = 190; //cor -  cinzento dos círculos
      
     }
     
   strokeWeight(2); // espessura da linha de contorno
     stroke (255); // define a cor do contorno dos circulos
     fill(r,g,b); // define as cores da maior parte dos círculos cinzentos
     smooth (); // suaviza o desenho
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores criados
  } 
  
 
         
}




