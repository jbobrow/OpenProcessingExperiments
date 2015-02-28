
//PONG para 2 jogadores, explorando o uso do condicional 'if'.
//Jogador da esquerda controlado pelo Mouse, e o da direita
//pelas setas CIMA e BAIXO do teclado.
//Qualquer erros, dúvidas, sugestões e críticas, favor deixar
//nos comentários, ou em design.camelo[arroba]gmail[ponto]com.

//Objeto de fonte.
PFont fonte;
//Variáveis raquete 1.
int raq1X, raq1Y, pontos1;
//Variáveis raquete 2.
int raq2X, raq2Y, pontos2;
//Variáveis comuns.
int raqLarg, raqAlt, raqVel;
//Variáveis bola.
int bolaX, bolaY, tamBola, velBolaX, velBolaY;

void setup() {
  size(800, 600);
  noStroke();
  fonte = loadFont("Emulogic-48.vlw");
  textFont(fonte, 48);
  textAlign(CENTER, BOTTOM);
  rectMode(CENTER);
  raqLarg = 20;
  raqAlt = 80;
  raqVel = 3;
  raq1X = 50;
  pontos1 = 0;
  raq1Y = height/2;
  raq2X = width-50;
  raq2Y = height/2;
  pontos2 = 0;
  bolaX = width/2;
  bolaY = height/2;
  tamBola = 10;
  velBolaX = 5;
  velBolaY = 5;
}

void draw() {
  //Pinta de preto,apagando a imagem anterior e dando ao fundo.
  background(0);
  //Condicional que verifica se a bola encosta em cima ou embaixo.
  //Caso verdadeiro, inverte o incremento vertical da bola.
  if (bolaY > (height-tamBola/2) || bolaY < tamBola/2) {
    velBolaY = velBolaY * -1;
  }
  //Verifica se a bola escosta na lateral esquerda da tela.
  //Caso verdadeiro, retorna a bola para o centro horizontal da tela,
  //posição vertical aleatório, inverte o incremento horizontal da bola
  // e acrescenta 1 à pontuação do jogador 2.
  if (bolaX < tamBola/2) {
    bolaX = width/2;
    bolaY = int(random(tamBola/2, height-tamBola/2));
    velBolaX = velBolaX * -1;
    pontos2 = pontos2 + 1;
  }
  //Exatamente igual ao 'if' anterior, mas para o outro lado e jogador.
  if (bolaX > width-tamBola/2) {
    bolaX = width/2;
    bolaY = int(random(tamBola/2, height-tamBola/2));
    velBolaX = velBolaX * -1;
    pontos1 = pontos1 + 1;
  }
  //Esses 'ifs' move a raquete esquerda, seguindo a posição do mouse e
  //trava o movimento caso a raquete encoste em cima ou em baixo.
  //Caso o mouse esteja acima da raquete:
  if (mouseY < raq1Y) {
    //Está encostado em cima?
    if (raq1Y <= raqAlt/2) {
      //Então trave!
      raq1Y = raqAlt/2;
    //Se não,
    }else{
      //Suba!
      raq1Y = raq1Y - raqVel;
    }
  }
  //Mesma coisa caso esteja abaixo:
  if (mouseY > raq1Y) {
    if (raq1Y >= height-raqAlt/2) {
      raq1Y = height-raqAlt/2;
    }else{
        raq1Y = raq1Y + raqVel;
    }
  }
  //Esse 'if' cuida da movimentação da raquete da direita.
  //A variável 'keyPressed' retorna 'true' se alguma tecla
  //do teclado estiver sendo pressionada.
  if(keyPressed){
    //A variável 'keyCode' recebe o valor da última tecla pressionada
    //no caso dessa ser uma tecla especial, como BACKSPACE, TAB, ENTER...
    //Aqui se ela for a setinha pra cima...
    if(keyCode == UP){
      //...verifique se está encostada da parte de cima,
      if(raq2Y <= raqAlt/2){
        //se estiver, trave,
        raq2Y = raqAlt/2;
      }else{
        //se não, suba!
        raq2Y = raq2Y - raqVel;
      }
    }
    //Mesma lógica, mas agora para baixo:
    if(keyCode == DOWN){
      if(raq2Y >= height-raqAlt/2){
        raq2Y = height-raqAlt/2;
      }else{
        raq2Y = raq2Y + raqVel;
      }
    }    
  }
  //Esse 'if' verifica se a raquete da esquerda toca a bola.
  //Traduzindo a condição: se a bola estiver na mesma altura da raquete..
  if(bolaY >= raq1Y-raqAlt/2 && bolaY <= raq1Y+raqAlt/2){
    //Essa condição está um pouco estranha, mas garante uma precisão
    //na hora de saber se a raquete está encostando na bola. Traduzindo:
    //a distância entre a raquete e a bola é menor do que o espaço
    //que a bola se desloca a cada loop?
    if((bolaX-tamBola/2)-(raq1X+raqLarg/2)<=abs(velBolaX) && (bolaX-tamBola/2)-(raq1X+raqLarg/2)>=0){
      //Verifica agora de a bola esta vindo no sentido da raquete,
      //para evitar que ela fique presa na volta.
      if(velBolaX < 0){
        //Finalmente podemos inverter a velocidade horizontal da bola.
        velBolaX = velBolaX * -1;
      }
    }
  }
  //Mesma lógica, mas para ooutro lado:
    if(bolaY >= raq2Y-raqAlt/2 && bolaY <= raq2Y+raqAlt/2){
    if((bolaX+tamBola/2)-(raq2X-raqLarg/2)<=abs(velBolaX) && (bolaX+tamBola/2)-(raq2X-raqLarg/2)>=0){
      if(velBolaX > 0){
        velBolaX = velBolaX * -1;
      }
    }
  }
  //Essas linhas incrementam a posição da bola:
  bolaX = bolaX + velBolaX;
  bolaY = bolaY + velBolaY;
  //Depois de feitos todos os ajustes, podemos desenhar o que
  //precisa ser desenhado. Respectivamente, placares, bola e raquetes.
  text(str(pontos1), width/2 - 50, 50);
  text(str(pontos2), width/2 + 50, 50);
  rect(bolaX, bolaY, tamBola, tamBola);
  rect(raq1X, raq1Y, raqLarg, raqAlt);
  rect(raq2X, raq2Y, raqLarg, raqAlt);
  }

/*
Esse não é melhor jeito de se fazer um jogo de PONG.
O angulo de movimentação é sempre o mesmo, isso torna o jogo previsivel e chato.
Em compensação, seguindo esse esquema de ter variáveveis para as posições
X e Y da bola e raquetes, ficaria muito complicado implementar modificações.
A ideia desse exemplo é cobrir o condicional 'if'. Aos curiosos que quiserem
explorar novas possibilidades de programação 2D pesquise sobre o objeto PVector.
Sugestões de modificações:
-Mudança de angulo no trajeto da bola de acordo com a área da raquete tocada;
-Condição de vitória (como está o jogo é infinito);
-Eventos que mudem a velocidade da bola e raquetes;
-Evento BLACKOUT, onde a bola ficasse invisível por um tempo;
-Modos de 4 e 3 jogadores.
*/


