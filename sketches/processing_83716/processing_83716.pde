
PImage bg;
PImage bgInvert;
PImage toroSacana;
PFont font;

//PImage jalimHabei;

boolean teclaEsq;
boolean teclaDir;

boolean inimAtingido;


int turcoPosX;
int turcoPosY;

int labaredaPosX;
int labaredaPosY;


int d;

int contaBatidas;


Sprite jalimParado; 
Sprite jalimLeft;
Sprite labareda;


import ddf.minim.*;

AudioPlayer player;
Minim minim;


void setup () {

  minim = new Minim(this);

  player = minim.loadFile("01.mp3", 512);
  // play the file
  player.play();  


  jalimParado = new Sprite("jalim", 5);
  jalimLeft = new Sprite("left", 5);
  labareda = new Sprite("labareda", 9);
  bg = loadImage ("bg2.jpg");
  bgInvert = loadImage ("bginvert.jpg");
  toroSacana = loadImage ("bg-fim.jpg");

  font = loadFont ("font.vlw");

  size (800, 600);

  turcoPosX = 400;
  turcoPosY = 300; 

  labaredaPosX = 500;
  labaredaPosY = 300;


  d = 30;
}

void draw () {
  //TRATA JOGADOR JALIM HABEY!!!! 

  if (teclaEsq) {

    turcoPosX = turcoPosX-10;
    if (turcoPosX < 0) {
      turcoPosX = 0;
    }
  }

  if (teclaDir) {
    turcoPosX = turcoPosX+10;
    if (turcoPosX>800) {
      turcoPosX = 800;
    }
  }



  background (bg);


  // detectação de colisão
  if (turcoPosX>=labaredaPosX-20&&
    turcoPosX<=labaredaPosX+20)
  {
    contaBatidas++;
    print (contaBatidas);
    //  image (toroSacana,0,0);
    labaredaPosX=(int)random (width);    
    d=30;
  }

  //    image (bg, 0, 0);
  text ("Jalim Habey", 100, 50);
  text (contaBatidas, 700, 50);
  textFont (font, 50);


  jalimParado.desenha (turcoPosX, turcoPosY);


  //  jalimLeft.desenha (turcoPosX,turcoPosY);



  d= d+1; //incrementação
  if (d==200) {//condição
    d=0;
    labaredaPosX=(int)random (width);
  }

  labareda.desenha (labaredaPosX, labaredaPosY);
  //ellipse (labaredaPosX, labaredaPosY, d, d);

  if (contaBatidas>=10) {
    image (toroSacana, 0, 0);
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    teclaEsq = true;
  }
  if (keyCode == RIGHT) {
    teclaDir = true;
  }
}

void keyReleased () {
  if (keyCode == LEFT) {
    teclaEsq = false;
  }
  if (keyCode == RIGHT) {
    teclaDir = false;
  }
}
