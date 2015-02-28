
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (255); // fundo da janela
  smooth (); // suavizar elementos
  noLoop (); // manter imagem estatica
  
}
float posX, posY; // variavel posiçao X e Y
float diametro; // variavel diametro
float lado; // variavel lado
float r, g, b; // variavel cor


void draw () { // definiçao elementos composiçao
  
  for ( int i = 0; i < 100; i = i + 1) // a repetiçao varia entre os valores de 1 e 100
  {
    
  posX = random (width); // posiçao X aleatoria
  posY = random (height); // posiçao Y aleatoria
  diametro = random (5, 200); // diametro aleatorio entre 5 e 200
  r = random (255); // variavel cor na escala de vermelho
  g = random (0); // variavel cor na escala de verde
  b = random (255); // variavel cor na escala de azul
  
  noStroke (); // nao existe contorno
  fill (r, g, b); // preenchimento
  ellipse (posX, posY, diametro, diametro); // posiçao circulos
  
  }
  
  for ( int i = 0; i < 20; i = i + 1) // a repetiçao varia entre os valores de 1 e 20
  {
    
  posX = random (width); // posiçao X aleatoria
  posY = random (height); // posiçao Y aleatoria
  lado = random (50, 200); // variavel lado entre 50 e 200
  
  fill (0); // preenchimento
  rect (posX, posY, lado, lado); // posiçao quadrados
  
  }
  
}
