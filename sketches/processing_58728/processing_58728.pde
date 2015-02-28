
size(500,500);  // tamanho janela
background(0); // cor fundo

noStroke(); // sem contorno
smooth(); // suavizar imagen


    for (int x = 1; x < 10; x = x+1) {  // repetir o objecto 
      
      ellipse( x * 50 , width/2, 45,45); // desenho circulo

    }
    

// x varia de 1 a 10
// multiplicamos o x por 50 para obter o espaçamento
