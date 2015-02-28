
void setup(){ // utiliza-se para imagens não estáticas
  
  size(800,500); // define o tamanho da janela
  background(0); // a cor de fundo da janela, que é preto
  smooth(); // suaviza o desenho

}

void draw(){ //definições específicas do desenho
  
  float x1 = random (250, 550); // posição variável de X1 da linha, neste caso entre a posição 250 e 550
  float y1 = random (0, 500); // posição variável de Y1, a toda a altura da janela
  float x2 = random (200, 600); // posição variável de X2 da linha, entre 250 e 550
  float y2 = random (0, 500); // posição variável de Y2, na mesma a toda a altura
  
  strokeWeight(3); // grossura da linha desenhada
  stroke(255); // cor da linha
  line(x1, y1, x2, y2); // aqui é onde se desenha a linha: X1, Y1, X2, Y2
  
  float posX = random (0, 250); // posição variável de X, no lado esquerdo da janela
  float posY = random (0, 500); // posição variável de Y, a toda a altura da janela
  float r = random (0, 255); // cor variável de vermelhos
  float g = random (0, 255); // cor variável de verdes
  float b = random (0, 255); // cor variável de azuis
  
  noStroke(); // serve para as elipses não ter contorno
  fill(r, g, b); // cor de preenchimento das elipses
  ellipse(posX, posY, 20, 20); // desenho das elipses: posição X, posição Y, diâmetro, diâmetro
  
  float posX1 = random (550, 800); // posição variável de X, desta vez à direita das linhas
  float posY1 = random (0, 500); // posição variável de Y, a toda a altura da janela
  float r1 = random (0, 255); // cor variável de vermelhos
  float g1 = random (0, 255); // cor variável de verdes
  float b1 = random (0, 255); // cor variável de azuis
  
  fill(r1, g1, b1); // cor de preenchimento das elipses
  ellipse (posX1, posY1, 20, 20);  // desenho das elipses: posição X, posição Y, diâmetro, diâmetro

 saveFrame("briefing_ex3.jpg"); // serve para gravar a imagem
  
}

