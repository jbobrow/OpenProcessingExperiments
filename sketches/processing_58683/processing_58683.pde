
int totalObjectos; // numero total de objectos

float posX, posY; // variaveis para a posição horizontal e vertical
float diametro; // variavel para o diametro (tamanho)
float r,g,b; // variaveis para a cor 
float s; // variavel para controlar a espessura do outline

float px, py;


void setup() { // definições de Setup
  
  float sizeW, sizeH;
  sizeW = 800.50; 
  sizeH = sizeW / 1.25; 
  size ( (int) sizeW, (int) sizeH); 
  background (249,178,51); 
  smooth();
  noLoop();
  
  
  totalObjectos = 500;// numero total de objectos (controlo do loop)
  
}

void draw(){ //definições do desenho
  
  colorMode(RGB, 255,255,255);
  background (237,52,247);
  
  colorMode(HSB, 360,264,241,325); // muda a cor para HSB - Hue Saturation Brightness
  
  // gerar uma posição aleatoria na janela
     px = width/2 ;
     py = height/2 ;
     
  // gerar uma posição aleatoria na janela
     posX = width/2 ;
     posY = height/2 ;
     
  for ( int i = 0; i <totalObjectos; i++)
  {
    
     // gerar uma posição aleatoria na janela
     posX = width/2 +   random (-i, i); // gerar um numero para posição horizonral 
     posY = height/2 +  random (-i, i); // gerar um numero para posição vertical
     
     diametro = map ( i, 0, totalObjectos, 10,1); 
      
     float h = map ( i, 0, totalObjectos, 0,360); // hue
    // float b = map ( i, 0, totalObjectos, 0,100); // brightness
     
    
    
     stroke(0,diametro*12);
     fill(h,300,300,diametro*100);
     rect ( posX, posY, diametro, diametro); // desenhar o objecto com os valores gerados
     
     noStroke();
     fill(4,25,456);
     rect ( posX, posY, 4, 4); // desenhar o objecto apartir dos valores gerados
     
     stroke(0,diametro*4);
     line(px, py, posX, posY); 
     
    
     
     px = posX;
     py = posY;
     
  } 
    //saveFrame("Net_6.png"); 
         
}
