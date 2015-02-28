
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (255); // cor fundo janela
  smooth (); // suavizar elementos 
  noLoop (); // manter a imagem estatica
  

}
float posX, posY; // variavel posiçao X, e Y
float diametro; // variavel diametro 
float r, g, b; // variavel cor
float sw; // variavel tamanho do contorno


void draw () { // definiçao elementos composiçao 
  
  for ( int i = 0; i < 100; i = i + 1) // a repetiçao varia entre os valores 1 e 100
  {
    
  posX = random (width); // posiçao X aleatoria
  posY = random (height); // posiçao Y aleatoria
  diametro = random (5, 200); // diametro aleatorio entre 5 e 200
  r = random (255); // variavel cor na escala de vermelho
  g = random (255); // variavel cor na escala de verde
  b = random (255); // variavel cor na escala de azul
  sw = random (1, 10); // variavel do contorno entre 1 e 10
  
  strokeWeight (sw); // contorno
  fill (r, g, b); // preenchimento
  ellipse (posX, posY, diametro, diametro); // posiçao circulos
  
  }
  
}
