
float bolaX = 10, dX =5, bolaY = 10, dY = 5; //bolaX e bolaY determinam as posições da bola de pong, inicialmente estando na posição (10, 10). dX e dY determinam o deslocamento da esfera a cada frame.

void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  background(0); //Usado para evitar que os objetos que se movem na cena, no caso, a bola, deixem rastros.
  desenhaCenario(); //Desenha o cenário a cada frame
  paddle(); //Chama a função paddle para que a cada frame o paddle seja desenhado dependendo da posição vertical do mouse.
  ellipse(bolaX, bolaY, 20, 20); //Desenha a bola nas posições bolaX e bola Y

  bolaX+=dX; //Determina o movimento horizontal da bola. Sua posição horizontal bolaX será acrescida da variável dX.
  bolaY+=dY; //Determina o movimento vertical da bola. Sua posição vertiacl bolaX será acrescida da variável dY.

  if (bolaY >= 590) dY = -1.1*dY; //Delimita que o deslocamento a ser acrescido na posição vertical da esfera se inverta de valor (fazendo com que seu sentido mude), e acrescendo 10% de valor aos próximos deslocamentos verticais quando a esfera chegar no lado inferior da tela.
  if (bolaY <= 10) dY = -1.1*dY; //O mesmo que o de cima, mas para o lado superior da tela.

  if (bolaX >= 790) dX = -1.1*dX; //O mesmo que os dois anteriores, mas para o deslocamento horizontal e para os lado direito.
  if (bolaX <= 10) dX = -1.1*dX; //O mesmo que os três anteriores, mas para o deslocamento horizontal e para os lado esquerdo.
}

void desenhaCenario() { // Função para criar uma linha tracejada no centro do cenário. Utiliza-se o laço "for" com um incremento de valor (21) acima do comprimento vertical de cada retângulo criado pelo rect (17), fazendo assim com que cada próximo retângulo criado seja desenhado sem encostar no anterior.
  for  (int i = 0; i <= 600; i+=21) {
    rect(400, i, 7, 17);
  }
}

void paddle() { //Desenha um rect representando o paddle do jogo Pong nas posições x 10, y seguindo a posição vertical do mouse e com largura 10 e comprimento 40.
  rect(10, mouseY, 10, 40);
}

