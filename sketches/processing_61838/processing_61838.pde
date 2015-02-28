

int totalObjectos; // totalidade dos objectos ( circulos )

float posX, posY; // variaveis da posição horizontal e vertical do circulo
float diametro; // variavel para o diametro 
float r,g,b; // variaveis para a cor do circulo
float s; // controlação da espessura do outline

// definições de Set up
void setup() {
  
  float sizeW, sizeH; // variavel do comprimento e largura
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333;  // variavel comprimento / largura  
  size ( (int) sizeW, (int) sizeH); 
  background (255); // cor de fundo
  smooth(); // definição do contorno
  noLoop(); // imagem estática
  

  
  totalObjectos = 220;// totalidade dos circulos (controlo do loop)
  
 

}

void draw(){
  
  colorMode(RGB,654,300,400);
  background(799); // cor de fundo
  
  colorMode(HSB, 300,150,100); // mudança de cor para HSB - Hue Saturation Brightness
  
  for ( int i = 0; i <totalObjectos; i++) // numero de circulos
  {
    
    //  posição aleatoria na janela
     posX = width/2 + random (-i,i); // posição horizontal 
     posY = random (height); // posição vertical
     
     float h = map ( i, 0, totalObjectos, 0,360); 
     
     diametro = map ( i, 0, totalObjectos, 200,0); 
    
     //s = random (1,10); // gerar um valor para a espessura do stroke (outline)
     
     strokeWeight(1); // espessura da linha dos circulos
     fill(h,100,100); // preenchimento
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  

         
}

