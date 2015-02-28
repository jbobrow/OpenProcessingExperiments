
PImage start;
PImage fundo;
PImage fim;
PImage braco1;
PImage braco2;
PImage bracinho1;
PImage bracinho2;

int radius = 40;

//variáveis que vão guardar aposição de mousePressed
int mouseposX1 = -500;
int mouseposY1 = -200;
int mouseposX2 = -500;
int mouseposY2 = -200;

Boolean startscreen = true;
Boolean playscreen = false;
Boolean endscreen= false; //por fazer ainda

int qtdBolinhas = 10; //variável com a qtd inicial de bolinhas
int[] speeds = { //array com velocidade das bolinhas
  -1, 1
};

Bolinha[] bolinha = new Bolinha[qtdBolinhas]; //array das bolinhas

void setup() {
  size (1024, 600);
  smooth();

  //imagens
  start = loadImage("tela inicial.png");
  fundo=loadImage("tela principal.png"); 
  fim=loadImage("tela final.png");
  braco1=loadImage("braco_esquerdo.png");
  braco2=loadImage("braco_direito.png");
  bracinho1=loadImage("bracinhoesquerdo.png");
  bracinho2=loadImage("bracinhodireito.png");

  for (int i = 0; i < qtdBolinhas; i++) {  //toda vez dá loop, cria uma nova bolinha????
    bolinha[i]= new Bolinha();
  }
}

void draw() {

  //display tela 1
  if (startscreen == true) {
    background(start);

    //se apertar botão start (inbutido na tela) ativa o playscreen
    if (mouseX > 300 && mouseX < 700 && mouseY >400 && mouseY<500) { //´posição do start
      if (mousePressed == true) {
        startscreen=false;
        playscreen=true;
        mouseX = -500;
        mouseY = -200;
      }
    }
  }

  // display tela 2 - COMEÇA O JOGO!
  if (playscreen==true) {
    background(fundo); 

    //braço esquerdo
    if (mouseX <= width/2) {
      if (mousePressed) {
        mouseposX1 = mouseX - 400; //guardando posição de mousePressed x
        mouseposY1 = mouseY - 25; // guardando posição de mousePressed y
        image(braco1, mouseposX1, mouseposY1); //desenhando a mão da posição do "click" (primeira posição)
        verificaEstouroBolinha(mouseX, mouseY); //configurando verificação
      }
      else {
        image(bracinho1, mouseposX1, mouseposY1); //desenhando a mão na posição do "click" anterior
      }
    }
    //braço direito
    else if (mousePressed) {
      mouseposX2 = mouseX - 30;  //guardando posição de mousePressed x
      mouseposY2 = mouseY - 30;  // guardando posição de mousePressed y
      image(braco2, mouseposX2, mouseposY2);  //desenhando a mão da posição do "click"
      verificaEstouroBolinha(mouseX, mouseY); //configurando verificação
    }
    else {
      image(bracinho2, mouseposX2, mouseposY2);  //desenhando a mão na posição do "click" anterior
    }

    //??????????????????????????????
    for (int i = 0; i < qtdBolinhas; i++) {
      if (bolinha[i].getDesenhaBolinha() == true) {
        bolinha[i].moveBolinha();
      }
    }
  }
}
// função de verificar estou bolinha   ??????????
void verificaEstouroBolinha(int dedoPosX, int dedoPosY) {
  for (int i = 0; i < qtdBolinhas; i++) {
    if (bolinha[i].getDesenhaBolinha() == true) {

      float d = dist(bolinha[i].getX(), bolinha[i].getY(), dedoPosX, dedoPosY); 
      println(" posBolinha " + i + " = " + bolinha[i].getX() + " " + bolinha[i].getY() + " dedo = " + dedoPosX + " " + dedoPosY + "   d = " + d);
      if (d < 2*radius) {
        bolinha[i].setDesenhaBolinha(false);
        //bolinhaSom.ring();
      }
    }
  }
}

class Bolinha {

  Boolean desenhaBolinha;
  int x;
  int y;
  int vx;
  int vy;

  Bolinha() {
    desenhaBolinha = true;
    x = int(random(0, width));
    y = int(random(0, height));
    vx = speeds[int(random(speeds.length))];  // same as int(random(4))
    vy = speeds[int(random(speeds.length))];
    //println("x = " + x);
    //println(y + " " + vx  + " " + vy);
    //desenhando a bolinha
    stroke(100, 0, 0); //stroke verde
    fill(133, 165, 252, 125); //bolinha pintada azul e transparente
    ellipse(x, y, radius*2, radius*2); //bolinha na posição x, y
  }

  //função com os movimentos da bolinha
  void moveBolinha() {
    x = x + vx; 
    y = y + vy;

    //colocando a bolinha para voltar em x e y
    if ((x>width)||(x<0)) { //e x for maior o tamanho máximo da janela ou tiver valor negativo (está fora da janela) 
      this.vx = this.vx*-1; //a velocidade no eixo x muda de sentido
    }

    if ((y>height)||(y<0)) { //se y for maior o tamanho máximo da janela ou tiver valor negativo (está fora da janela)
      this.vy = this.vy*-1; //a velocidade no eixo y muda de sentido
    }
    ellipse(x, y, radius*2, radius*2); //bolinha na posição x, y
  }

  Boolean getDesenhaBolinha() {
    return this.desenhaBolinha;
  }

  void setDesenhaBolinha(Boolean statusBolinha) {
    this.desenhaBolinha = statusBolinha;
  }

  int getX() {
    return this.x;
  }

  int getY() {
    return this.y;
  }
}



