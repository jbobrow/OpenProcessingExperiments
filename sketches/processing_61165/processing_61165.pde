
void setup() {//função que define o set up
  size(800,600); //tamanho do ecran
  background(0); //fundo do ecran
  smooth(); //suavizar todo o desenho
  noStroke(); //sem contorno 
}

void draw() {//função que define o desenho

      float vermelhoprob = 0.30; // vou criar uma variavel onde '30%' das ellipses são vermelhas
      float verdeprob = 0.35; // vou criar uma variavel onde '35%' das ellipses são verdes
      float azulprob = 0.35; // vou criar uma variavel onde '35%' das ellipses são azuis
  
      float numero = random(1);  // escolho um número aleatório entre 0 e 1
  
      if (numero < verdeprob) { //Se o número aleatório é inferior a 0,35, neste caso à probablidade de verdes
    fill(255,50);//preenche a branco,com transparencia '50%'

  } else if (numero < verdeprob + azulprob) { //caso contrário se o numero entre 0 e 1 for menor que a probabilidade de verdes mais azuis
    fill(232,23,0,60);//preenche a azul com transparencia '60%'
  }
  ellipse(random(width),random(height),30,30); //digo ao processing para desenhar ellipses aleatoriamente ao longo do ecran. '30', '30' representa o tamanho da ellipse.
}

