
void setup() { // definiçoes do setup
  
 size(600, 800);// definir o tamanho da janela
 background (117,242,149); // cor do fundo
 smooth(); // suavizar o contorno
 noLoop();// criar imagem estática
 noStroke(); // sem contorno

  int totalObjectos; // numero total de objectos
  totalObjectos = 500;// numero total de quadrados
  
 }

void draw(){// definiçoes do desenho
  
  colorMode(RGB, 255,255,255);// esta função é usada para mudar cores especificas do RGB
  background(117,242,149); //  cor de fundo
  
  colorMode(HSB, 320,80,30); // para mudar a cor para HSB 
  
  for ( int i = 0; i <130; i++)// controla a sequência de repetições 
  {
    float r,g,b; // variaveis para a cor dos quadrados
    float posX, posY; //variaveis para a posição horizontal e vertical dos quadrados

     posX = random(0, 800); // gerar uma posição horizonral 
     posY = random (0, 800); // gerar uma posição vertical
     
     
     float h = map ( i, 0, 278, 56,235); //para criar um valor de uma cor para a outra  
     
     fill(h,70,70); // cor de preenchimento 
     rect(posX, posY, 100, 100);// desenhar os quadrados
  }
  
}
