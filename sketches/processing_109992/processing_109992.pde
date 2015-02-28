
void setup(){
  size (600,400);
}


//variaveis para a bola e a velocidade
float bolaX = 200;
float bolaY = 100;
float velocidadeX = 10;
float  velocidadeY = 0;
int acerto = 0;
int erro = 0;


void draw(){
  //ao apertar o mouse reinicia os pontos
  if (mousePressed){
    acerto =0;
    erro = 0;
  }
  
  float base = 1000/(acerto+10);
  // configuracao para velocidade da bola
  if (bolaX < 0 || bolaX > width){
    velocidadeX = -velocidadeX;
  }
  if (bolaY > height){
    velocidadeY = -velocidadeY;
  float distancia = abs(mouseX - bolaX);
  if (distancia < base)
    acerto += 1;
  else
    erro += 1;
  }
  else
  velocidadeY += 1;
  
  
 bolaX += velocidadeX;
 bolaY += velocidadeY;
 
 //faz o fundo a base e a bola
 background(255);
 fill(255,0,0);
 ellipse(bolaX, bolaY, 50, 50);
 rect(mouseX-base, height-10, 2*base, 10);
 
 fill(0);
 text("acertos: " + acerto, 10, 20);
 text("erros: " + erro, 10, 40);
}


