
//Exercício de 2D Grid   -  Anabel Santos


size (290,310); // medida do background
background (0); // cor do fundo

noStroke (); // não tem contornos (outline)
smooth (); // suavizar

//float step = 60; // serve para alterar os círculos na posição horizontal
//float stepY = 40; // serve para alterar os círculos na posição vertical

for ( int y = 1; y <15; y ++) { // cria as filas verticais

for ( int x = 1; x <17; x ++) { // cria as filas horizontais
  
  //float i = random (60); // variável do tamanho dos circulos até 50
  fill (24,71,237); // cor azul
  ellipse( x *20, y *20, 5,5); //  círculos com posições aleatórias
  
}


}

