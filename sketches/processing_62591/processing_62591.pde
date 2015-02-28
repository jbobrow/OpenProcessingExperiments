
// Exercício Layers - Anabel Santos

int totalObjectos; // numero total de objectos, circulos e linhas

int layer2_totalObjectos; // numero total de objectos para a segunda camada, os circulos


float posX, posY; // variaveis para a posição horizontal e vertical dos objectos
float tamanho;// variavel para o tamanho do objecto
float diametro; // variável para o diâmetro

//float r,g,b; // variaveis para a cor do circlo (vermelho, azul e verde)

float so; //  espessura do contorno da linha (outline)

//  definiçoes Setup
void setup() {
  
  size (800,500);  //tamanho do fundo
  background (255); // cor do fundo
  smooth(); //suavidade
  noLoop(); // sem repetição de código (estático), este código tem de estar em último no void setup
  

  totalObjectos = 1400; // Numero total de objectos, 1400 linhas
  layer2_totalObjectos = 10; // Numero total de objectos na 2a layer, 10 circulos
  
  

}

void draw(){ // parte ilustrativa (desenhos)
  background(39,39,39); // cor do background
  
  for ( int i = 0; i <totalObjectos; i++)  // primeira camada
  {
     posX = random (width); // numero aleatório para posição horizontal 
     posY = random (height); // numero aleatório para posição vertical
     tamanho = random (5, 50); // tamanho aleatório das linhas entre 5 e 50
     
     
     strokeWeight(1); // espessura das linhas
     
    
     line ( posX, posY, posX +random(-100,100), posY+random(-100, 100)); // desenha as linhas com os valores pretendidos
   
} 
  
  
   for ( int i = 0; i < layer2_totalObjectos; i++)  // 2a camada
  {
     posX = random (width); // gerar um numero para posição horizonral 
     posY = random (height); // gerar um numero para posição vertical
     diametro = random (50,200); // define um diâmetro entre 50 e 200
     
     strokeWeight (2); // espessura da linha de contorno do circulo (outline)
     stroke (255);// cor da linha de contorno (outline) 
     fill (67, 228, 255);  // cor dos circulos
     ellipse ( posX, posY, diametro, diametro); // cria os circulos com os valores escolhidos
  } 
        
}




