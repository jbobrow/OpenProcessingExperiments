
size(500,500); // tamanho da janela
background(123,124,125); // cor de fundo

noStroke(); // sem espessura
smooth(); // suavizar desenhoi

for (int x = 1; x < 10; x = x+1) { // valor que o x varia
      
ellipse( x * 50 , width/2, 30,30); // localização e tamanho das ellipses
fill(0); // cor das elipses  

}
