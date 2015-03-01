
float bolaX = 10, dX =5, bolaY = 10, dY = 5; //Determina as posições iniciais da bola

void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  background(0); //Atualiza a cor do background para que os objetos que se moverem não deixem rastros.
  paddle();      //Desenha o paddle
  checagemHit(); //Checa se a bola colidiu com o paddle
  ellipse(bolaX, bolaY, 20, 20); //Desenha a bola

  bolaX+=dX;
  bolaY+=dY;

  if (bolaY <= 10) dY = -1*dY; //Checa se a bola colidiu com a parte superior da tela
  if (bolaX >= 790) dX = -1*dX; //Checa para ver se a bola colidiu com o lado direito da tela
  if (bolaX <= 10) dX = -1*dX; //Checa para ver se a bola colidiu com o lado esquerdo da tela
  saiuDaTela();                //Chama a função que verifica se a bola saiu pelo fundo da tela
}

void paddle() { //Desenha o retângulo do paddle, variando a posição horizontal dependendo da posição do mouse.
  rect(mouseX, 500, 100, 10);
}

void checagemHit() {
  if (bolaY+10 == 500 && bolaX >= mouseX && bolaX <= mouseX + 100) { //Checa se a quina inferior da bola está na mesa altura que o topo do paddle e se o x da quina da bola está encostando no comprimento (com posição variável) do paddle.
    dY = -1*dY; //Se houve colisão, o valor do deslocamento y é invertido, para dar a idéia de "kickar".
    dX = ((1+(mouseX-pmouseX)/10))*dX; //Adiciona efeito para o deslocamento na horizontal dX dependendo do deslocamento entre a posição horizontal em que o mouse estava no frame anterior a bola encostar no paddle e a posição horizontal em que o mouse estava no frame em que a bola encostou no paddle.
  }
}

void saiuDaTela() {
  if (bolaY >=590) { //Se a bola sair da tela, chama-se um menu de Game Over.
    text("Game Over!", 400, 300);
    text("Aperte qualquer botão do mouse para resetar o jogo.", 400, 330);
    if (mousePressed == true) { //Se algum botão do mouse for apertado, reseta-se a posição de valor de deslocamento da bola.
      bolaX = 10; 
      dX =5; 
      bolaY = 10; 
      dY = 5;
    }
  }
}

