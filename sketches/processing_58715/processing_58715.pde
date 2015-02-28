
int totalObjectos; // número total de objectos
float probab; // variável da probabilidade
float percent; // variável da percentagem

void setup(){ // definições de setup
  
  size (900, 500); // tamanho da janela de fundo
  background (102, 105, 78); // cor de fundo
  smooth(); // suavizar imagen
  frameRate(10); // 10 frames por segundo
  
  totalObjectos = 100; // total de objectos que pretendo desenhar
  percent = 50; // 50% desses objectos ser de uma cor
  probab = 100 - percent; // variável para que a probabilidade aconteça
  
}

void draw(){ // definições do desenho

  float X = random (width); // variável da posição X da elipse
  float Y = random (height); // variável da posição Y
  float diam = random (50, 90); // variável do diâmetro dos círulos
  
  strokeWeight(6); // contorno dos círculos
  fill(0, 0, 0, 100); // cor dos círculos (preto), e transparência
  ellipse(X, Y, diam, diam); // desenho dos círculos

 
  {
    float posX1 = random (width); // gerar um valor para a posiçaoo horizontal
    float posY1 = random (height); // gerar um valor para a posiçao vertical
    float posX2 = random (width); // gerar um valor para a posiçao horizontal
    float posY2 = random (height); // gerar um valor para a posiçao vertical
    float r = random(0, 255); // gerar um valor para a componente vermelha
    float g = random(0, 255); // gerar um valor para a componente verde
    float b = random(0, 255); // gerar um valor para a componente azul
   
    if (random(100) > probab){ // probabildade
      
      r = 72; // cor
      g = 168;
      b = 150;
       
    }
    else // senão
    {
      r = 255; 
      g = 255;
      b = 255;
     
    }
 stroke(r, g, b);
  }
  

  
}
  
