
size(500,500);  // tamanho janela
smooth(); // suavizar imagen
noStroke(); // sem contorno
background(0); // cor fundo

float step = width/15; // variavel largura
float stepY = height/15; // variavel altura

for( int y=2; y<13; y = y +1){// repetir o objecto 
  
for( int x=2; x<13; x = x +1) // repetir o objecto 

rect(x * step, y * step ,30,30); // desenho rectangulo
fill(10,90,79); // preenchimento
}

