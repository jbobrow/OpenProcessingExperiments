
int estado;
int MENU = 0;
int JOGANDO = 1;

PImage tela1;
PImage instruc;

int posBotX;
int posBotY;

PImage fundo;
PImage fundoJogo;

boolean teclaCima;
boolean teclaBaixo;
boolean teclaEspaco;

int instanteTeclaEsp;
int instanteQueda;
//int instAparecendo;
//int instInicial;
int posX; 
int posY;

int mPosX;
int mPosY;

Sprite m;
Sprite m2;
Sprite balde;
boolean martelada;

Sprite escada1;
Sprite escada2;

int baldePosX;
int baldePosY;
int baldeExploQuadro;
boolean baldeChutado;
boolean baldeMovendo;
boolean baldeRebatido;

int escadaPosX;
int escadaPosY;
boolean escadaCaindo;
boolean escadaSobe;

void setup() {
  size(1024, 768);
  background(255);
  
  estado = MENU;//JOGANDO;

  tela1 = loadImage("Pinicial.gif");

  instruc = loadImage ("instruções.gif");
  fundo = loadImage("planofundo.gif");
  fundoJogo = loadImage("fundojogo.gif");


  posBotX = 0;
  posBotY = height/2;

  //instInicial = millis();
  mPosX = width-80;
  mPosY = height/2;
  baldePosY = (int)random (height);
  escadaPosX = 100;

  balde = new Sprite ("balde",1);
  m = new Sprite("perna",1);
  m2 = new Sprite ("perna2",1);
  escada1 = new Sprite ("escada",1);
  escada2 = new Sprite ("escada2",1);
}

void draw() {
  
  if(estado==MENU){
    menu();
  } else if (estado==JOGANDO){
    jogando();
  }
} 

void menu(){
 

  background(tela1);
  
  instruc = loadImage ("instruções.gif");
  image (instruc, posBotX+50, posBotY+200);
  
  noStroke();
}
  
void jogando(){
  // entrada do jogador
  if (teclaCima) {
    mPosY -= 12;
    if (mPosY < 20) {
      mPosY = 20;
    }
  }
  if (teclaBaixo) {
    mPosY += 12;
    if (mPosY > height-60) {
      mPosY = height-60;
    }
  }
  if (teclaEspaco) {
    martelada = true;
    instanteTeclaEsp=millis();
  }
  if (millis()-instanteTeclaEsp>500) {
    martelada = false;
  }
  
  
  
  // não-jogadores
  
  if (escadaSobe) {
    escadaPosY-=8;
    if(escadaPosY<0){
      escadaPosY=0;
      escadaSobe = false;
    }
    
  }
  else {
    escadaPosY+=8;
    if (escadaPosY>height){
    escadaPosY = height;
    escadaSobe = true;
    }
  }
   

  if (baldeRebatido) {
    baldePosX-=15;
  }
  else {
    baldePosX+=8;
  }

  if (baldePosX>width) {
    baldePosX=0;
    baldePosY=(int)random(height);
  }

  if (baldePosX<0) {
    baldeRebatido=false;
    baldePosX=0;
    baldePosY=(int)random(height);
  }
  

  //detecção de colisão
  //chute no balde
  if (baldePosX>= mPosX-130 &&
    baldePosX<= mPosX+40 &&
    baldePosY>= mPosY-60 &&
    baldePosY<= mPosY+60 &&
    martelada==true) {

    print("bateu ");

    baldeRebatido = true;
    baldeMovendo = false;
  }
   //balde colidindo com a escada
  if (baldePosX<= escadaPosX+40 &&
    baldePosX>= escadaPosX-40 &&
    baldePosY<= escadaPosY+40 &&
    baldePosY>= escadaPosY-100) {
      
    print("derrubou");
    baldePosX=0;
    escadaCaindo = true;
    instanteQueda = millis();
    }  
      
      if (millis()-instanteQueda>500) {
      escadaCaindo = false;
      }


  //desenha tudo!
  
  background(fundo);

  image (fundoJogo, posX, posY);
  noStroke();
  
  
  if (martelada) {
     m2.desenha(mPosX-120, mPosY);

  } 
  else {
     m.desenha (mPosX, mPosY);

  }

  balde.desenha (baldePosX, baldePosY);


  if (escadaCaindo) {
    escada2.desenha (escadaPosX, escadaPosY);

  }
  else {
    escada1.desenha ( escadaPosX, escadaPosY-150);

  }  
}

void keyPressed() {
  if (keyCode == UP) {
    teclaCima = true;
  }
  if (keyCode == DOWN) {
    teclaBaixo = true;
  }
  if (key == ' ') {
    teclaEspaco = true;
  }
  
  if (keyCode == ENTER) {
    estado = JOGANDO;
  }
  if (keyCode == TAB) {
  estado = MENU;  
  }
}

void keyReleased () {
  if (keyCode == UP) {
    teclaCima = false;
  }
  if (keyCode == DOWN) {
    teclaBaixo = false;
  }
  if (key == ' ') {
    teclaEspaco = false;
  }

}



class Sprite {
  PImage quadro; 
    //atributo
  Sprite(String nome, int numQuadros) {
    quadro = loadImage(nome+ ".gif");
  }
  void desenha(float posX, float posY){        //metodo funcao
    image(quadro,posX,posY);
  }
}


class Sprite {
  PImage quadro; 
    //atributo
  Sprite(String nome, int numQuadros) {
    quadro = loadImage(nome+ ".gif");
  }
  void desenha(float posX, float posY){        //metodo funcao
    image(quadro,posX,posY);
  }
}


