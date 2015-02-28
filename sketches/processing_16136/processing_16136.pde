
import processing.opengl.*;

float x;
float y;
float vx;
float vy;
float a;
float b;
float frameAtual;
float s = 0.5;
PImage personagem[] = new PImage[10];

PGraphics tela;  // cria uma variavel que vai guardar uma camada da tela

import ddf.minim.*;
import ddf.minim.analysis.*;

boolean podeDesenhar;

//Minim minim;
//AudioPlayer song;
//BeatDetect beat;
//beatListener

//*********************************************************
void setup(){
  size(screen.width,screen.height);
//  minim=new Minim(this);
//  song=minim.loadFile("1.mp3");
//  song.play();
  
  frameRate(30);
  
  carregaCenario();

  tela = createGraphics(10*screen.width,screen.height,P2D);  // cria uma camada e guarda na variavel

  tela.beginDraw();        // begin: começar  / draw: desenhar
  tela.background(0, 0);  // define fundo dessa tela transparente
  tela.endDraw();

  for (int i = 0; i < 6; i++) {
    personagem[i] = loadImage("a"+i+".png");
  }
  p=2;
  ceny = 0;
  vp=-1300;
  
  podeDesenhar = true;
  
  pixoSetup();
}

//*****************************************************
void draw(){
  background(0);
  mostraCenario();
  desenhaBoneco(x,y);
  parede();
  blazer();

  if ( (mouseY > 637&&mouseY<858 && mouseButton == RIGHT) || 
       (mouseY > 627&&mouseY<868 && mouseButton == LEFT) ) {
    podeDesenhar = true;
  }
  
  else {
    podeDesenhar = false;
  }

  pixoDraw();
  //println("cenx: " + cenx);
  //println("mouseY: " + mouseY);
}

//***********************PIXADOR******************************
void desenhaBoneco(float x,float y) {

  if (frameAtual > 5) {
    frameAtual = 0;
  }
  if (frameAtual < 0) {
    frameAtual = 5;
  }

  pushMatrix();
  translate(cenx,0);
  image(tela,0,0);
  popMatrix();

  pushMatrix();
  translate(x, y+650);
  scale(s,0.5);
  image(personagem[round(frameAtual)],-personagem[round(frameAtual)].width/2,-personagem[round(frameAtual)].height/2);
  popMatrix();

}

//********************ANDA***********************************************

void keyPressed() {

  if (key == '5') {  
    vp=2000;
  }
  // cima: UP

  // baixo: DOWN  
  // esquerda: left
  // direita: right
  if (keyCode == RIGHT) {

    x=x+10;  
    if(x > width-200) {
      x = width-200;
    }  
    s = 0.5;
    frameAtual = frameAtual+0.5;
  }

  if (keyCode == LEFT) {
    x=x-10;    
    if(x < 150) {
      x = 150;
    }  

    s = -0.5;
    frameAtual = frameAtual+0.5;
  }


  if (keyCode == UP) {
   // zoom = zoom + 1.5;
    ///y=y-10;    
  }


  if (keyCode == DOWN) {
    //zoom = zoom - 0.1;
    //y=y+10;    
  }
if (key=='0'){
  save ("pixo" + random(1) + ".jpg");
}
}


//*********************PAREDE******************************************
void parede() {

  if(x<=150){
    x=150.1;

    if (cenx < 0) {   
      cenx = cenx+10;
      funx = funx+3;
    }
  }

  if(x>=width-200){
    x=width-200.1;
    if(cenx>-5900.0){ 
      cenx = cenx-10;
      funx = funx-3;
    }
  }


  if(y<150){
    y=150.;

  }

  if(y>250){
    y=250;
  }

}
//******************************DESENHA*********************************************


void mouseDragged() {   // mouse arrastado : desenha na camada transparente
}
//***************************************************************************











