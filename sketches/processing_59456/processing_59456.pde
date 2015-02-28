
float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro do circulo
float r,g,b; // variaveis para a cor do circulo
float s; // variavel para controlar a espessura do outline

float limiteHorizontal, limiteVertical; //variavel dos valores do limite

void setup() { // definição do step up
  
  float sizeW, sizeH; // variavel da largura e comprimento
  sizeW = 700; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (255); // cor de fundo
  smooth(); // definição do contorno dos circulos
  noLoop(); // imagem estatica
  
 
  limiteHorizontal = 70; // limite horizontal
  limiteVertical = 200;  // limite vertical
  
}

void draw (){ // desenhar imagem
 background(0); // cor de fundo
for ( int i = 0; i < 100; i = i +1) // numero de circulos
{
  posX = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // gerar um numero para posição horizontal 
  posY = random (height/2-limiteVertical, height/2 + limiteVertical); // gerar um numero para posição vertical
  diametro = random (5, 100); // gerar um diametro 
  s = random (1,10); // gerar um valor para a espessura do outline
  r = random(200); // gerar um valor para a componente vermelha 
  g = random(300); // gerar um valor para a componente verde 
  b = random(400); // gerar um valor para a componente azul 
    
     
        
     strokeWeight(s); // espessura da linha dos circulos
     fill(r,g,b); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados 
}

} 



