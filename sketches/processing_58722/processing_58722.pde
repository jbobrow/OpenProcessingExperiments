
size (700, 700); // tamanho janela 
background (255); // fundo janela

noStroke (); // nao existe contorno
smooth (); // suavizar elementos

float r, g, b; // variavel cor

  for (int x = 1; x < 10; x = x + 1) { // a repetiçao varia entre 1 e 10
  
  r = random (255); // variavel cor na escala de vermelho
  g = random (255); // variavel cor na escala de verde
  b = random (0); // variavel cor na escala de azul 
  
  fill (r, g, b); // preenchimento
  ellipse ( x * 70, width/2, 40, 40); // posiçao circulos
  
  }
