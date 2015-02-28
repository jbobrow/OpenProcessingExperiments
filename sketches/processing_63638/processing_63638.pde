
import processing.video.*;


import codeanticode.glgraphics.*;
import processing.opengl.*;
import ddf.minim.*;


Minim minim;
AudioSample player_1, player_2, player_3, player_4, player_5;
int num_1 = 1, num_2 = 1, num_3 = 1, num_4 = 1, num_5 = 1, count_1 = 0, count_2 = 0, tamanho_tim; 
GLTexture tarola, tarola_2, tarola_3, timbalao_1, timbalao_top_1, timbalao_top_2, timbalao_2, prato_1, prato_2, prato_3, prato_1_red, prato_3_red, tripe_esq, tripe_drt, imagem_fundo, imagem_f;


int cena = 0; 

botao_entrar b_entra; 
botao_entrar b_sobre; 
botao_entrar b_voltar; 


int scr_h = 1280;  
int scr_v = 720;  
int b_larg = 150; 
int b_alt = 50;  

boolean botaoOpen = true; 

void setup() {
  size (1280, 720, OPENGL);
  background(255);     
  smooth();
  frameRate(120);
  tamanho_tim = 250;



  PImage  imageNormal = loadImage ( "drum.png");    
  PImage  imageHigh = loadImage ( "drum_2.png");      
  PImage  imageDown = loadImage ( "drum_3.png");      

  PImage  imageNormal_2 = loadImage ( "teclas.png");   
  PImage  imageHigh_2 = loadImage ( "teclas_2.png");     
  PImage  imageDown_2 = loadImage ( "teclas_3.png");     

  PImage  imageNormal_3 = loadImage ( "menu.png");  
  PImage  imageHigh_3 = loadImage ( "menu_2.png");    
  PImage  imageDown_3 = loadImage ( "menu_3.png");    



  b_entra = new botao_entrar(320, 600, 
  b_larg, b_alt, 
  imageNormal, imageHigh, imageDown); 


  b_sobre = new botao_entrar(800, 600, 
  b_larg, b_alt, 
  imageNormal_2, imageHigh_2, imageDown_2); 


  b_voltar = new botao_entrar(1000, 100, 
  b_larg, b_alt, 
  imageNormal_3, imageHigh_3, imageDown_3); 

  tarola =  new GLTexture (this, "tarola_1.png");
  tarola_2 = new GLTexture ( this, "tarola_2.png");
  tarola_3 = new GLTexture ( this, "tarola_3.png");

  timbalao_1 = new GLTexture (this, "timbalao_1.png");
  timbalao_top_1 = new GLTexture (this, "timbalao_top_1.png");
  timbalao_top_2 = new GLTexture (this, "timbalao_top_2.png");
  timbalao_2 = new GLTexture (this, "timbalao_2.png");

  prato_1 = new GLTexture (this, "prato1.png");
  prato_1_red = new GLTexture (this, "prato1_red.png");
  prato_2 = new GLTexture (this, "prato2.png");
  prato_3 = new GLTexture (this, "prato3.png");
  prato_3_red = new GLTexture (this, "prato3_red.png");

  tripe_esq = new GLTexture (this, "tripe_esq.png");
  tripe_drt = new GLTexture (this, "tripe_drt.png");

  imagem_fundo = new GLTexture (this, "air_drum_t.png");
  imagem_f = new GLTexture (this, "air_drum__p.png");


  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player_1 = minim.loadSample("Snare.wav", 512);
  player_2 = minim.loadSample("LoTom.wav", 512);
  player_3 = minim.loadSample("MidTom.wav", 512);
  player_4 = minim.loadSample("Splash.wav", 512);
  player_5 = minim.loadSample("China.wav", 512);
  // play the file
}

void draw() {



  switch (cena) {   

  case 0:           
    cena_0();
    break;          

  case 1:           
    cena_1();
    break;          

  case 2:           
    cena_2();
    break;
  }
}




