
//Exercício de Iteration - Anabel Santos


// definiçoes setup
void setup(){
  size(400,400); // tamanho do background
  rectMode(CENTER); // quadrados alinhados pelo centro
}


// parte ilustrativa (desenhos)
void draw(){
  background(255); // tamanho do fundo
  noStroke (); // sem linha de contorno (outline)
  fill(206,0,0); // cor dos quadrados
  float largura=mouseX/9; /* controla a linha horizontal,
 o /9 define o valor até onde a passagem do rato tem efeito */
  for(int a=0;a<=400;a+=40){ // variável que controla o espaçamento na horizontal
    for(int b=0;b<=400;b+=40){; // veriável que controla o espaçamento na vertical
      rect(a,b,largura,largura); // quadrado com altura e largura
    }
    
  }
  
}

