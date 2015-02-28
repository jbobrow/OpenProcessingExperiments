
int totalObjectos; // numero total de objectos, neste caso triângulos 

float posX, posY, posX1, posY1, posX2, posY2; // variaveis para a posição horizontal e vertical do triângulo

float r,g,b; // variaveis para a cor do triângulo
float s; // variavel para controlar a espessura do outline, do stroke
float probabilidade; 
float percentagem; 
int countProbabilidade; 

void setup() { // definições do setup
  
  float sizeW, sizeH;
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (255); 
  smooth();
  noLoop();
  
  
  totalObjectos = 100;// numero total de triângulos (controlo do loop)
    
 percentagem = 20; // 10 % - queremos 10% dos circulos pintar de vermelho
 probabilidade = 100 - percentagem; // a variavel para o teste da probabilidade
 
  countProbabilidade  = 0; // um counter para verificarmos quantos circulos pintamos de vermelho
}
 



void draw(){ // definições do draw
  background(255); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (width); // criar um numero para a posição horizonral 
     posY = random (height); //criar um numero para a posição vertical
     posX1 = random (width); // criarr um numero para a posição horizonral de x1 
     posY1 = random (height);// criar um numero para a posiçao vertical de y1
     posX2 = random (width); // criar um numero para a posição horizonral de x2 
     posY2 = random (height);// criar um numero para a posição vertical de y2
   
        
     if (random(100) > probabilidade){
      
      r = 0; 
      g = 0; 
      b = 255;
      
      countProbabilidade = countProbabilidade +1; 
      println(countProbabilidade);
       
     }
     else
     {
     r = 0;
     g = 0; 
     b = 0;
     
     }
     
     
     //strokeWeight(s);// espessura da linha 
     fill(r,g,b); // cor de preenchimento (rgb) mais a opacidade
     triangle(posX, posY, posX1, posY1, posX2, posY2); // desenhar o triângulo com os valores gerados
 

  }
    saveFrame("Probabilidades.png"); 
         
}
