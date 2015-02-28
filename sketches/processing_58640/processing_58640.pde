
void setup (){ // constução do stage
  size (500,500); // define o tamanho da janela
  background (219,206,139); // define a cor de fundo
  smooth(); // suaviza as formas
  //noLoop(); // cria imagem estática sem repetição
  frameRate(2); // define a número de frames por segundo
}

void draw (){ // construção do desenho
  for (int i=0; i < 50; i ++){ // indica o numero de repetições da forma, começando em 0 e acabando em 50, e i++ indica que vao ser geradas 50 formas em cada frame
  
  float posX1 = random (0,500); // atribui uma variavel para uma posição aleatória em X do primeiro ponto
  float posY1 = random (0,500); // atribui uma variavel para uma posição aleatória em Y do primeiro ponto
  float posX2 = random (0,500); // atribui uma variavel para uma posição aleatória em X do segundo ponto
  float posY2 = random (0,500); // atribui uma variavel para uma posição aleatória em Y do segundo ponto
  float posX3 = random (0,500); // atribui uma variavel para uma posição aleatória em X do terceiro ponto
  float posY3 = random (0,500); // atribui uma variavel para uma posição aleatória em Y do terceiro ponto
  float r = random (120,149); // atribui uma variavel para um valor aleatório na escala de vermelhos
  float g = random (75,149); // atribui uma variavel para um valor aleatório na escala de verdes
  
  noStroke(); // indica qe as formas não vão ter linha de contorno
  fill(r,g,75,90); // indica a cor de preenchimento da forma, e o 90 indica a qe tem apenas 90% da opacidade
  triangle(posX1,posY1,posX2,posY2,posX3,posY3); // construção da forma
  
  }
  }
