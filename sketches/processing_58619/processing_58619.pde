
void setup() { // definiçoes do setup
  
 size(500, 500);// para definir o tamanho da janela
  background (255); // definir a cor do fundo
  smooth(); // suavizar o contorno
  noLoop();// criar imagem estática
  noStroke(); // sem contorno

  int totalObjectos; // numero total de objectos
  totalObjectos = 130;// numero total de círculos
  
 }

void draw(){// definiçoes do void draw
  
  colorMode(RGB, 255,255,255);// esta função é usada para mudar cores especificas do RGB
  background(255); // para definir a cor de fundo
  
  colorMode(HSB, 320,80,30); // para mudar a cor para HSB 
  
  for ( int i = 0; i <130; i++)// controla a sequência de repetições 
  {
    float r,g,b; // variaveis para a cor dos círculos
    float posX, posY; //variaveis para a posição horizontal e vertical dos círculos

     posX = random(0, 500); // gerar uma posição horizonral 
     posY = random (0, 500); // gerar uma posição vertical
     
     
     float h = map ( i, 0, 130, 0,320); //para criar um valor de uma cor para a outra  
     
     fill(h,70,70); // cor de preenchimento 
     ellipse(posX, posY, 100, 100);// desenhar os círculos
  }
  
}
