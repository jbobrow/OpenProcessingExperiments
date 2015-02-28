
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/67375*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

//Declaração de variáveis—————————————————————————————————————————————————————
PFont font;
int jogador1Pontos, jogador2Pontos, jogador1Y, jogador2Y, bolaPosX, bolaPosY;
float bolaVelocidX, bolaVelocidY, bolaR, bolaG, bolaB;
boolean upPres, downPres, wPres, sPres, gameOver, primeira;
int contador;


//Declaração das constantes––––––––––––––––––––––––––––––––––––––––––––––––––––
int jogador1X, jogador2X, raqueteLargura, raqueteAltura, bolaSize, jodadorSpeed;

//Inicialização de variáveis–––––––––––––––––––––––––––––––––––––––––––––––––––
void setup ()
{
  size(800, 600);
  smooth();
  background(0);
  jogador1Pontos = 0;
  jogador2Pontos = 0;
  jogador1Y = 300;
  jogador2Y = 300;
  bolaPosX = 400;
  bolaPosY = 300;
  bolaVelocidY = 4;
  bolaVelocidX = 4;
  bolaR = random(0, 255);
  bolaG = random(0, 255);
  bolaB = random(0, 255);
  jodadorSpeed = 6;
  primeira = true;
  gameOver = true;
  upPres = false;
  downPres = false;
  wPres = false;
  sPres = false;

  jogador1X = 20;
  jogador2X = width - 40;
  raqueteLargura = 20;
  raqueteAltura = 150;
  bolaSize = int (random (15, 25));
  font = loadFont("Serif-48.vlw");
  textFont(font, 32);
}

void draw() {

  //Entradas do Jogador –––––––––––––––––––––––––––––––––––––––––––––––––––––––––
  if (upPres == true)
  {
    jogador2Y-=jodadorSpeed;
  }
  if (downPres == true)
  {
    jogador2Y+=jodadorSpeed;
  }
  if (wPres == true)
  {
    jogador1Y-=jodadorSpeed;
  }
  if (sPres == true)
  {
    jogador1Y+=jodadorSpeed;
  }

  if (jogador1Pontos > 30 || jogador2Pontos > 30) {
    gameOver = true;
    save ("RePong" + contador + ".gif");
    contador++;
    jogador1Pontos = 0;
    jogador2Pontos = 0;
  }

  if (gameOver == true) {
    fill(0, 0, 0, 50);
    rect(80, 80, width-160, height-160);
    fill(255, 255, 255);
    textAlign(CENTER);
    int txtBase = 150;
    int txtLinha = 30;
    if (primeira == true) {
      text("Clique no Quadro", width/2, txtBase);
    } 
    else {
      text("Game Over", width/2, txtBase);
    }
    text("Para Iniciar —> ENTER", width/2, txtBase+txtLinha*2.5);
    text("Jogador 1 Sobe —> W", width/2, txtBase+txtLinha*5);
    text("Jogador 1 Desce —> S", width/2, txtBase+txtLinha*6.5);
    text("Jogador 2 Sobe —> SETA PARA CIMA", width/2, txtBase+txtLinha*9);
    text("Jogador 2 Desce —> SETA PARA BAIXO", width/2, txtBase+txtLinha*10.5);
  }


  //Área das raquetes––––––––––––––––––––––––––––––––––––––––––––––––––––––––
  if (jogador1Y < 0) {
    jogador1Y = 0;
  }
  if (jogador2Y < 0) {
    jogador2Y = 0;
  }
  if (jogador1Y + raqueteAltura > 600) {
    jogador1Y = height - raqueteAltura;
  }
  if (jogador2Y + raqueteAltura > 600) {
    jogador2Y = height - raqueteAltura;
  }


  //Colisão da bola na altura––––––––––––––––––––––––––––––––––––––––––––––––
  if (bolaPosY < 10 || bolaPosY > 590) {
    bolaVelocidY *= -1;
  }


  //Colisão da bola Jogador 1––––––––––––––––––––––––––––––––––––––––––
  if (bolaPosX > jogador1X && bolaPosX < jogador1X + raqueteLargura && bolaPosY > jogador1Y 
    && bolaPosY < jogador1Y + raqueteAltura && bolaPosY != jogador1Y + (raqueteAltura/2))
  {
    bolaVelocidX *= -1*random(.9, 1.1);
    print ("bateu jogador 1 ");
    print (bolaVelocidX + " ");
    bolaR = random(0, 255);
    bolaG = random(0, 255);
    bolaB = random(0, 255);
    bolaSize = int (random (15, 25));
  } 

  //Colisão da bola Jogador 2––––––––––––––––––––––––––––––––––––––––––
  if (bolaPosX > jogador2X && bolaPosX < jogador2X + raqueteLargura && bolaPosY > jogador2Y 
    && bolaPosY < jogador2Y + raqueteAltura && bolaPosY != jogador2Y + (raqueteAltura/2))
  {
    bolaVelocidX *= -1*random(.9, 1.1);
    print ("bateu jogador 2 ");
    print (bolaVelocidX + " ");
    bolaR = random(0, 255);
    bolaG = random(0, 255);
    bolaB = random(0, 255);
    bolaSize = int (random (15, 25));
  } 

  //Pontuação–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
  if (bolaPosX < 0) {
    jogador2Pontos = jogador2Pontos + 10;
    bolaPosX = 400;
    bolaPosY = 300;
    bolaR = random(0, 255);
    bolaG = random(0, 255);
    bolaB = random(0, 255);
    bolaVelocidX *= -1;
    if (bolaVelocidX > 0) {
      bolaVelocidX = 4;
    } 
    else if (bolaVelocidX < 0) {
      bolaVelocidX = -4;
    }
  }

  if (bolaPosX > 800) {
    jogador1Pontos = jogador1Pontos + 10;
    bolaPosX = 400;
    bolaPosY = 300;
    bolaR = random(0, 255);
    bolaG = random(0, 255);
    bolaB = random(0, 255);
    bolaVelocidX *= -1;
    if (bolaVelocidX > 0) {
      bolaVelocidX = 4;
    } 
    else if (bolaVelocidX < 0) {
      bolaVelocidX = -4;
    }
  }

  //Redesenha Tudo––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
  if (gameOver == false)
  {
    //Redesenha área das raquetes–––––––––––––––––––––––––––––––––––––––––––––
    fill(0);
    rect(0, 0, 60, 600);
    rect(740, 0, 60, 600);
    fill(255);
    text(jogador1Pontos, 20, 50);
    text(jogador2Pontos, 760, 50);
    rect(jogador1X, jogador1Y, raqueteLargura, raqueteAltura);
    rect(jogador2X, jogador2Y, raqueteLargura, raqueteAltura);  

    //desenha a bola–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    fill(int(bolaR), int(bolaG), int(bolaB));
    noStroke();
    ellipse(bolaPosX, bolaPosY, bolaSize, bolaSize);
    bolaPosX += bolaVelocidX;
    bolaPosY += bolaVelocidY;
    fill(255);
  }
}


void keyPressed()
{
  if (keyCode == UP)
  {
    upPres = true;
  }
  if (keyCode == DOWN)
  {
    downPres = true;
  }
  if (keyCode == 'W')
  {
    wPres = true;
  }
  if (keyCode == 'S')
  {
    sPres = true;
  }

  if (keyCode == ENTER)
  {
    gameOver = false;
    primeira = false;
    background(0);
  }
}

void keyReleased()
{
  if (keyCode == UP)
  {
    upPres = false;
  }
  if (keyCode == DOWN)
  {
    downPres = false;
  }
  if (keyCode == 'W')
  {
    wPres = false;
  }
  if (keyCode == 'S')
  {
    sPres = false;
  }
}

