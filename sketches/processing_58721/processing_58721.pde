
size (700, 700); // tamanho janela 
background (0); // cor fundo 

smooth (); // suavizar elementos

float r, g, b; // variavel cor

for (int y = 1; y < 10; y = y + 1){ // a repetiçao varia entre 1 e 10 na altura

  for (int x = 1; x < 10; x = x + 1) { // a repetiçao varia entre 1 e 10 na largura
  
  noStroke (); // nao existe contorno 
  ellipse ( x * 70, y * 70, 40, 40); // posiçao circulos
  
  r = random (255); // variavel cor na escala de vermelho
  g = random (255); // variavel cor na escala de verde
  b = random (255); // variavel cor na escala de azul
  
  fill (r, g, b); // preenchimento
  
  }
  
}
