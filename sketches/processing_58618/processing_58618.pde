
size(500,500); // define o tamanho da janela
background(173, 44, 44, 80); // define a cor de fundo da janela
smooth(); // suaviza a imagem

 for (int y = 1; y < 5; y = y+1) { // construção de quatro círculos na posição y, altura, da janela

    for (int x = 1; x < 5; x = x+1) { // construção de quatro círculos na posição x, largura, da janela
      
      float diam = random (20, 50); // variável do diâmetro dos círculos
      float i = random (2, 4); // variável do contorno
      
      strokeWeight(i); // cortorno dos objectos
      stroke(0); // cor do contorno
      ellipse(x * 50, y * 50, diam, diam); // desenho dos círculos
      
    }
    
 } 
 
  for (int y = 6; y < 10; y = y+1) { // construção de quatro círculos na posição y, altura, da janela

    for (int x = 6; x < 10; x = x+1) { // construção de quatro círculos na posição x, largura, da janela
      
      float diam = random (20, 50); // variável do diâmetro dos círculos
      float i = random (2, 4); // variável do contorno
      
      strokeWeight(i); // cortorno dos objectos
      stroke(0); // cor do contorno
      ellipse(x * 50, y * 50, diam, diam); // desenho dos círculos
      
    }
    
  }
