
int navePosX;
int navePosY;
Sprite nave;

Tiro[] tiros;

int contaTiros;
int NUM_MAX_TIROS=200;

boolean teclaEsq;
boolean teclaDir;
boolean teclaBaixo;
boolean teclaCima;
boolean teclaEsp;

void setup () {

  tiros = new Tiro[NUM_MAX_TIROS];

  for (int i=0; i<NUM_MAX_TIROS; i++) {
    tiros[i] = new Tiro();
  }

  size (800, 600);

  navePosX = 400;
  navePosY = 500;
  
  nave = new Sprite("exu_pulando", 1);
}

void draw () {

  //Entradas do jogador
  if (teclaEsq==true) {
    navePosX=navePosX-25;
  }
  if (teclaDir==true) {
    navePosX=navePosX+25;
  }
  if (teclaEsp==true) {
    tiros[contaTiros].atirando =true;
    contaTiros++;
    if (contaTiros==NUM_MAX_TIROS){
      contaTiros=0;
    }
  }

  if (navePosX<20) {
    navePosX=20;
  }
  if (navePosX>width-20) {
    navePosX=width-20;
  }

  //Trata ñ jogador
  for (int i=0; i<NUM_MAX_TIROS; i++) {
    if (tiros[i].atirando==false) {
      tiros[i].posX=navePosX-5;
      tiros[i].posY=navePosY-15;
    }
    else {
      tiros[i].posY-=15;
      if (tiros[i].posY<0) {
        tiros[i].atirando=false;
      }
    }
  }

  //Desenha tudo
  background(255);
  
  for (int i=0; i<NUM_MAX_TIROS; i++) {
    tiros[i].desenha();
  }
  
  nave.desenha (navePosX,navePosY);
  
//  fill(0);
//  triangle (navePosX+20, navePosY, navePosX-20, navePosY, navePosX, navePosY-20);
}

void keyPressed () {
  if (keyCode==LEFT) {
    teclaEsq=true;
  }
  if (keyCode==RIGHT) {
    teclaDir=true;
  }
  if (key==' ') {
    teclaEsp=true;
  }
}
void keyReleased () {
  if (keyCode==LEFT) {
    teclaEsq=false;
  }
  if (keyCode==RIGHT) {
    teclaDir=false;
  } 
  if (key==' ') {
    teclaEsp=false;
  }
}

class Sprite{
  PImage[] quadros;
  float quadroAtual;
  Sprite (String nome, int numQuadros) {
    quadros = new PImage[numQuadros];
    for (int i=0; i<numQuadros; i++) {
      quadros[i] = loadImage (nome + i + ".gif"); 
    }
    quadroAtual = 0;
  }
  void desenha (float posX, float posY){
    quadroAtual = quadroAtual + random(0.1,0.3);
    if (quadroAtual >= quadros.length) {
      quadroAtual = 0;
    }
    image (quadros[(int)quadroAtual],posX,posY);    
  }  
}
class Tiro{
  int posX;
  int posY;
  boolean atirando; 
  Sprite sprTiro;
  
  Tiro() {
    sprTiro = new Sprite("coco", 4);
  }
  
  void desenha() {
   // rect (posX, posY, 10, 15);
    if (atirando) {
      sprTiro.desenha(posX, posY);
    }
  }
}


