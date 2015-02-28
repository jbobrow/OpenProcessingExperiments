

size(800,800); // tamanho janela
background(0); // cor fundo

noStroke(); // sem espessura do contorno
smooth(); //suavizar o desenho

float step = width/ 10; // criar variavel para a largura
float stepY = height/10; //criar variavel para a altura

println(step); // gerar um numero


for(int y=1; y<10; y= y+1){ // numero de rpetições
for( int x=1; x<10; x = x+1){ // numero de repetições

  float l= random (50);
  fill (random (255), random (255), random (255)); // cor dos o bjectos geradas de forma aleatoria
  //ellipse(x * step, y * step, l, l);
  quad(x*step, y*stepY,
      x*step+50, y*stepY,
      x*step+60, y*stepY -30,
      x*step+10, y*stepY -30);

    }
}

