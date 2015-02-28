
/*
 Programa    : joguinho_carro  
 Descrição   : Este programa simula um jogo de carros, onde o carro do jogador deve desviar dos carros adversários
 Criador     : Gustavo Santoro Nunes e Humberto Almeida
 Data criação: 09/08/2011
*/

// variáveis
int   px   = 0;
int   py   = 0;
int   ly   = 0;
int   posx = 295; // posição eixo x do carro
int   posy = 520; // posição eixo y do carro
int   posz = 0;   // posição eixo x do carro adversário
int   posa = 0;   // posição eixo y do carro adversário
int   vel  = 10;  // seta o framerate
int   velc = 10;  // marca velocidade do carro
int   v    = 0;   // contador dos metros percorridos
int   vdist = 0;  // valor da distância percorrida
int   car  = 0;   // quantidade de carros ultrapassados
int   cor1 = 0;   // cor R
int   cor2 = 0;   // cor G
int   cor3 = 0;   // cor B

boolean start, farol, farol2 = false;
boolean ultrapassou, ylinha;

// textos do jogo
String textoO = "Objetivo: Percorrer a pista, ultrapassando o maior número de carros adversários";
String textoI = "Instruções do jogo:";
String texto1 = "1)Para iniciar o jogo tecle 'S'";
String texto2 = "2)Utilizar as setas direita/esquerda para movimentar";
String texto3 = "3)Utilizar a seta para cima  para aumentar a velocidade";
String texto4 = "4)Utilizar a seta para baixo para diminuir a velocidade";
String texto5 = "5)Para ligar/desligar o farol tecle 'F'";
String texto6 = "Fim de Jogo !!!";
String texto7 = "Carros ultrapassados: ";
String texto8 = "Total de pontos: ";
String texto9 = "Para reiniciar o jogo tecle 'R'";

//Humberto em 30/08/2011
int posPista  = 0;     // Posição da pista
int posPista2 = -600;  // Posição da pista 2

PImage pista;          // Variável que contém a imagem da pista
PImage jogo;           // Variável que contém a imagem do jogo

// formatação da tela
void setup()
{
  size(600, 600);
  smooth();
  noCursor();
  //Humberto em 30/08/2011
  pista = loadImage("pista.png");          // Carrega imagem da pista   
  jogo  = loadImage("jogo.png");           // Carrega imagem da pista   
}

// desenha a tela
void draw()
{
  if (!start) {                            // verifica o inicio do jogo
    background(180);
    textAlign(LEFT, TOP);
    fill(color(50, 10, 10));
    textSize(20);
    text(textoO, 10,  20, width, height/2);
    fill(color(250, 100, 100));
    textSize(30);
    text(textoI, 10,  80, width, height/2);
    fill(color(250, 250, 150));
    textSize(20);
    text(texto1, 10, 120, width, height/2);
    text(texto2, 10, 140, width, height/2);
    text(texto3, 10, 160, width, height/2);
    text(texto4, 10, 180, width, height/2);
    text(texto5, 10, 200, width, height/2);
    image(jogo, 180, 300);
  }
  else {
    background(0);

    // aumenta a velocidade do carro adversário
    if (v > 99) { 
      velc   += 10;
      vel    += 5;
      vdist  += v;
      v      =  0;
      ly     =  0;
      ylinha = true;
    }

    frameRate(vel);      // define a velocidade dos carros adversários

    // define a pista do carro adversário
    if (posa == 0) { 
      posz        = int(random(600)); 
      cor1        = int(random(256)); 
      cor2        = int(random(256)); 
      cor3        = int(random(256)); 
      ultrapassou = false;
      // define se o farol do adversário está ligado ou desligado
      if (cor3 <=128) { farol2 = true; }
      else            { farol2 = false;}
    }

    //Humberto em 30/08/2011
    // Movimento da pista em movimento
    posPista  += 35;
    posPista2 += 35;
    
    // Scroll (rolagem) da pista
    if(posPista  >= 600) posPista  = -600;
    if(posPista2 >= 600) posPista2 = -600;

    background(0);
    fill(204, 102, 0);
    rect(0, 601, 20, width);
  
    // Duas pistas são desenhadas
    image(pista, 0, posPista);
    image(pista, 0, posPista2);
/*
    // desenha pista fixa
    stroke(255);
    strokeWeight(8); 
    strokeCap(PROJECT); 
*/
    py = 15;
    for (int j = 0; j < 6; j++) { 
      px = 200;
      for (int i = 0; i < 2; i++) {
        line(px, py, px, py+60);
        px += 200;
      }  
      py += 100;
    }

    // desenha a linha de medida
    if (ylinha) { 
      stroke(255);
      strokeWeight(8); 
      strokeCap(PROJECT); 

      strokeWeight(45);
      line(0, ly, 600, ly);
      fill(color(0, 0, 0));
      textAlign(CENTER, CENTER);
      textSize(35);
      text(str(vdist)+'m', 300, ly);
    }
    
    carro(posz, posa, cor1, cor2, cor3, false, farol2); // desenha carro adversário

    carro(posx, posy, 120 , 120 , 120 , true , farol ); // desenha carro jogador

    posa += 30;                                         // faz o carro adversário andar na pista
    v ++;                                              
    
    // controla o avanço da linha de medida
    if (ly > 600) { ylinha = false; }
    else          { ly += 10;       }

    // termina o jogo quando o carro adversário bate no carro do jogador
    verifica_batida(posx, posy, posz, posa+80);

    // remonta carro adversário no topo da tela e conta como carro ultrapassado
    if (posa > 600) { 
      posa =  0;
      car  += 1;
    }
  }
}

void keyPressed() {

 //println(keyCode);                                 // identificação do código da tecla pressionada

 if (keyCode == 83) { start = true; }              // tecla s ou S para iniciar o jogo
  
 if ((keyCode == 82) && ( start == false)) {       // tecla r ou R para reiniciar o jogo
      start = true;
      posx   = 295;
      posy   = 520;
      posa   = 0;
      vel    = 10;
      velc   = 10;
      v      = 0;
      vdist  = 0;
      car    = 0;
      ylinha = false;
      loop();   
  }       

  if (keyCode == 70) {                             // tecla f ou F para iniciar o jogo
      if (farol) { farol = false; }
      else       { farol = true;  }              
  }
  
  // movimenta o carro do jogador com as setas
  if (keyCode == 37) {                 // direita
    posx -= 200;
    if (posx < 95)  { posx = 95;  }
  }
  else if (keyCode == 39) {            // esquerda
    posx += 200;
    if (posx > 495) { posx = 495; }
  }
  else if (keyCode == 38) {            // para cima
    posy -= 50;
    vel  += 5;
    velc += 10;
    v    += 5;
    if (v    > 99) { v    = 100; }
    if (posy < 85) { posy = 85;  }
  }
  else if (keyCode == 40) {            // para baixo
    posy += 50;
    vel  -= 5;
    velc -= 10;
    v    -= 5;
    if (vel <= 0 )  { vel  = 5;  }
    if (velc <=0 )  { velc = 10; }
    if (posy > 520) { posy = 520; }
  }
}

void mousePressed() {
/*
  // movimenta o carro do jogador com o mouse
  posy = mouseY;
  if (mouseY > 520) { posy = 520;  }

  if      (mouseButton == LEFT)  { posx = 95;  }
  else if (mouseButton == CENTER){ posx = 295; }
  else if (mouseButton == RIGHT) { posx = 495; }
*/
}

void carro(int x, int y, int corR, int corG, int corB, boolean yvel, boolean yfarol) {
  // posição do carro centralizado na pista
  if      (x >= 0  && x <= 200) { x = 95;  }
  else if (x > 200 && x <= 400) { x = 295; }
  else if (x > 400            ) { x = 495; }

  // desenha o corpo e rodas do carro
  strokeWeight(2);
  strokeCap(ROUND); 
  fill(color(0, 0, 0));
  stroke(color(0, 0, 0));
  rectMode(CENTER);
  fill(corR, corG, corB);
  rect(x, y, 80, 120);
  rect(x-45, y-25, 15, 30 );
  rect(x-45, y+35, 15, 30 );
  rect(x+45, y-25, 15, 30 );
  rect(x+45, y+35, 15, 30 );
  fill(color(255, 0, 0));
  ellipse(x-30, y+57, 8, 5);
  ellipse(x+30, y+57, 8, 5);
  if (yvel) {                               // apresenta velocidade
     fill(color(0, 0, 0));
     textSize(10);
     text(str(velc)+"km/h", x, y, 45, 45);
  }
  if (yfarol) {                             // liga ou desliga farol
     fill(color(255, 255, 70, 70));
     triangle(x-35, y-59, x-55, y-120, x, y-120);
     triangle(x+35, y-59, x+55, y-120, x, y-120);
  }
}

void verifica_batida(int xc1, int yc1, int xc2, int yc2) {

  if      (xc2 >= 0  && xc2 <= 200) { xc2 = 95;  }
  else if (xc2 > 200 && xc2 <= 400) { xc2 = 295; }
  else if (xc2 > 400              ) { xc2 = 495; }
  
  // verifica se houve ultrapassagem
  if ((yc1<=yc2) && (xc1!=xc2)) { ultrapassou = true; } 

  // verifica se houve batida e exibe mensagens finais
  if (yc2>=yc1) {
    if ((xc1==xc2) && (!ultrapassou)) { 
      background(180);
      textAlign(CENTER, CENTER);
      fill(color(250, 100, 50));
      textSize(50);
      text(texto6                   , 300, 100, width, height/2);
      fill(color(50, 100, 250));
      textSize(30);
      text(texto7+str(car)          , 300, 150, width, height/2);
      text(texto8+str((vdist+v)*car), 300, 190, width, height/2);
      fill(color(0, 0, 0));
      textSize(35);
      text(texto9                   , 300, 300, width, height/2);
      start = false;
      noLoop();   
    }
  }
}

