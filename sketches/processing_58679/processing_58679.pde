
int totalObjectos; // número total de objectos
float probab; // variável da probabilidade
float percent; // variável da percentagem

void setup(){ // definições de setup
  
  size (600,800); // tamanho da janela
  background (138, 249, 246); // cor de fundo
  smooth(); // suavizar o desenho
  frameRate(20); // 20 frames por segundo
  
  totalObjectos = 100; // total de objectos que pretendo desenhar
  percent = 50; // 50% desses objectos são ser cor-de-laranja
  probab = 100 - percent; // variável para que a probabilidade aconteça
  
}

void draw(){ // definições do desenho
  
  float X = random (width); // variável da posição X da elipse, aplicável a toda a janela, para a posição horizontal
  float Y = random (height); // variável da posição Y, também em toda a janela, para a posição vertical
  float diam = random (20, 50); // variável do diâmetro dos círulos, que variam entre 20 a 50
  
  strokeWeight(4); // contorno dos círculos
  fill(0, 0, 0, 100); // cor dos círculos (preto), e transparência
  rect(X, Y, diam, diam); // desenho dos círculos
  fill(184,106,234);
  ellipse(X, Y, diam, diam);
  //for (int i = 0; i < totalObjectos; i++); // início do desenho das linhas, nas suas variáveis e com a probabilidade pretendida
  {
    float posX1 = random (width); // gerar um valor para a posição horizontal
    float posY1 = random (height); // gerar um valor para a posição vertical
    float posX2 = random (width); // gerar um valor para a posição horizontal
    float posY2 = random (height); // gerar um valor para a posição vertical
    float r = random(50, 300); // gerar um valor para a componente vermelha
    float g = random(50, 300); // gerar um valor para a componente verde
    float b = random(50, 300); // gerar um valor para a componente azul
  
    if (random(100) > probab){ // probabildade
      
      r = 106; // 50% as linhas são ser cor-de-laranja
      g = 112;
      b = 234;
      
    }
    else // senão,
    {
      r = 255; // os outros 50% vão ser brancos
      g = 255;
      b = 255;
      
    }
    
    strokeWeight(1.5); // grossura das linhas
    stroke(r, g, b); // rgb de acordo com a probabilidade
    line(posX1, posY1, posX2, posY2); //desenho de todas as linhas pretendidas
    
  }
  
  //saveFrame("briefing1_ex4.jpg"); // guarda a imagem
  
}
