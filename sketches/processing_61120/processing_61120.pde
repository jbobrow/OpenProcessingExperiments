

int totalObjectos; // totalidade dos objectos ( circulos )

float posX, posY; //  posição horizontal e vertical do circulo
float diametro; // variavel para o diametro do circulo
float r,g,b; // variaveis para a cor do circulo
float s; // variavel para controlar a espessura do outline

float px, py;

// definições de Set up
void setup() {
  
  float sizeW, sizeH;  // variavel do comprimento e largura
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (227); // cor de fundo
  smooth(); // definição de contorno
  noLoop(); // imagem estática
  
  
  totalObjectos = 650;// totalidade de circulos (controlo do loop)
  
 

}

void draw(){
 
  colorMode(RGB, 400,150,265) ;
  background(350); // cor de fundo
  
  colorMode(HSB, 150,100,250,140); // mudar a cor para HSB - Hue Saturation Brightness
  
  // posição aleatoria da janela
     px = width/2 ;
     py = height/2 ;
     
  // posiçao aleatoria da janela
     posX = width/2 ;
     posY = height/2 ;
     
  for ( int i = 1; i <totalObjectos; i++)
  {
    
     // posiçao aleatoria da janela
     posX = width/2 +   random (-i, i); //  posição horizontal
     posY = height/2 +  random (-i, i); //  posição vertical
     
     diametro = map ( i, 0, totalObjectos, 10,1); 
      
     float h = map ( i, 0, totalObjectos, 0,300); // hue
    // float b = map ( i, 0, totalObjectos, 0,100); // brightness
     
    
    
     stroke(10,diametro*12); // contorno
     fill(h,10,120,diametro*10); // preenchimento
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores 
     
     noStroke(); // sem contorno
     fill(76); // preenchimento
     ellipse ( posX, posY, 6, 4); // desenhar a elipse com os valores 
     
     stroke(10,diametro*2); // contorno
     line(px, py, posX, posY);
     
    
     
     px = posX;
     py = posY;
     
  } 
  
  
  
         
}



