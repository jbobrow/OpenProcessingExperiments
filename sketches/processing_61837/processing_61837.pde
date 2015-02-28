

int totalObjectos; // totalidade dos objectos ( circulos )

float posX, posY; //  posição horizontal e vertical do circulo
float diametro; // variavel do diametro 
float r,g,b; // variavel da cor do circulo
float s; // variavel para controlar a espessura do outline

float probabilidade; 
float percentagem; 
int countProbabilidade; 
// definições de Set up
void setup() {
  
  float sizeW, sizeH; // variavel de largura e comprimento
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (255); // cor de fundo
  smooth(); // definição de contorno 
  noLoop(); // imagem estática 
  
  
  totalObjectos = 100;// totalidadede circulos (controlo do loop)
  
  
 percentagem = 30; // 10 % - queremos 10% dos circulos pintar de vermelho
 probabilidade = 100 - percentagem; //  teste da probabilidade
 
  countProbabilidade  = 0; // um counter de verificação da quantidade de circulos que pintamos a vermelho
}

void draw(){
  background(255); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (width); //  posição horizontal  
     posY = random (height); //  posição vertical
     diametro = 20; // random (5, 100); // gerar um diametro entre 5 e 50
  //   r = random(2); // gerar um valor entre 0 e 2
  //   g = random(300); // gerar um valorentre 0 e 300
   //  b = random(500); // gerar um valor entre 0 e 500
   
     
     
     if (random(100) > probabilidade){ 
      // localização dos circulos
      
      // circulos laranjas
      r =400; 
      g = 100; 
      b = 50;
      
      countProbabilidade = countProbabilidade +1; 
      println(countProbabilidade);
       
     }
     // circulos azuis
     else
     {
     r = 100;
     g = 200; 
     b = 400;
     
     }
     
     
     noStroke(); // sem contorno
     fill(r,g,b); // preenchimento
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores 
  } 
  
  
 
         
}



