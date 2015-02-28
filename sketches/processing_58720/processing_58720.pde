
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
    float x1, y1, x2, y2, x3, y3; //variaveis para a posição horizontal e vertical dos círculos

     x1 = random(0, 500); // gerar uma posição horizontal 
     y1 = random (0, 500); // gerar uma posição vertical
     x2 = random (0, 500);
     y2 = random (0, 500);
     x3 = random (0, 500);
     y3 = random (0, 500);
     
     
     float h = map ( i, 0, 130, 0,320); //para criar um valor de uma cor para a outra  
     
     fill(h,70,70); // cor de preenchimento 
    // triangle(posX, posY, posA);// desenhar os círculos
     triangle(x1, y1, x2, y2, x3, y3);
  }
  
  
}
